package com.yc.mogujie.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.FuKuanInfoBean;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.FukuanInfoService;
import com.yc.mogujie.util.MogujieData;
import com.yc.mogujie.util.PaymentUtil;

@Controller("paymentAction")
public class PaymentAction implements ModelDriven<FuKuanInfoBean>,SessionAware,ServletRequestAware{
	private HttpServletRequest request;
	private String IPaddress;
	private Map<String, Object> session;
	private  FuKuanInfoBean fuKuanInfoBean;
	
	@Autowired
	private FukuanInfoService fukuanInfoService;
	
	public String getIPaddress() {
		return IPaddress;
	}

	public void setIPaddress(String iPaddress) {
		IPaddress = iPaddress;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String pay() throws  IOException {
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("pay.properties"));
		// 1.准备13个参数
		String p0_Cmd = "Buy"; // 业务类型，固定值Buy
		String p1_MerId = props.getProperty("p1_MerId");// 商号编码，在易宝的唯一标识
		String p2_Order = ""; // 商品订单号
		String p3_Amt = "0.01"; // 支付金额
		String p4_Cur = "CNY"; // 交易币种，固定值
		String p5_Pid = ""; // 商品名称
		String p6_Pcat = ""; // 商品种类
		String p7_Pdesc = ""; // 商品描述
		String p8_Url = props.getProperty("p8_Url"); // 商户接收支付成功数据的地址
		String p9_SAF = ""; // 送货地址
		String pa_MP = ""; // 商户扩展信息
		String pd_FrpId = request.getParameter("yh"); // 支付通道
		String pr_NeedResponse = "1"; // 应答机制,固定值1
		if(pd_FrpId.equals("YuE")){
			//System.out.println("选择用余额付款....");
			List<FuKuanInfoBean> fukuanInfo=(List<FuKuanInfoBean>) session.get("fuKuanInfoBean");
			int allprice=fukuanInfo.get(0).getTotalprice();
			UserInfo user=(UserInfo) session.get(MogujieData.LOGIN_USER);
			int yuE=user.getUsaccount();
			//System.out.println(allprice+"==>"+yuE);
			if(allprice>yuE){
				return "YuEPayFail";
			}else{
				//改变余额的值
				int NowYuE=yuE-allprice;//付款后的余额值
				user.setUsaccount(NowYuE);
				//System.out.println("付款后的余额"+user.getUsaccount()+"==>"+user.getUsid());
				int result3=fukuanInfoService.updateUserYuE(user);
				int result = 0;
				int result1 = 0;
				int result2 = 0;
				for(int i=0;i<fukuanInfo.size();i++){
					//修改订单状态
					result=fukuanInfoService.updateOrderStatus(fukuanInfo.get(i));
					//修改商品表的销售量
					result1=fukuanInfoService.updateProductValue(fukuanInfo.get(i).getProid());
					//修改商品详细表销售量、库存
					result2=fukuanInfoService.updateDetailValue(fukuanInfo.get(i).getDeid());
				}
				//System.out.println("付款后的状态："+result+"==>"+result1+"==>"+result2+"==>"+result3);
				if(result==1 && result1==1 && result2==1 && result3==1){
					return "message";
				}
			}
		}

		/**
		 * 2.计算hmac 需要13个参数，keyValue,加密算法
		 */
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);

		/**
		 *3. 重定向到易宝的支付网关
		 */
		StringBuilder sb=new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		//resp.sendRedirect(sb.toString());
		
		//System.out.println(sb.toString());
		
		setIPaddress(sb.toString());
		//System.out.println("获得的 "+getIPaddress());
		return "Paysuccess";
	}

	/*
	 * 回馈方法
	 * 当支付成功时，易宝会访问这里
	 */
	public String back() throws IOException{
		//1.获取12个参数
		String p1_MerId=request.getParameter("p1_MerId");
		String r0_Cmd=request.getParameter("r0_Cmd");
		String r1_Code=request.getParameter("r1_Code");
		String r2_TrxId=request.getParameter("r2_TrxId");
		String r3_Amt=request.getParameter("r3_Amt");
		String r4_Cur=request.getParameter("r4_Cur");
		String r5_Pid=request.getParameter("r5_Pid");
		String r6_Order=request.getParameter("r6_Order");
		String r7_Uid=request.getParameter("r7_Uid");
		String r8_MP=request.getParameter("r8_MP");
		String r9_BType=request.getParameter("r9_BType");
		String hmac=request.getParameter("hmac");
		//2.获取keyValue
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("pay.properties"));
		String keyValue=props.getProperty("keyValue");
		//3.调用PaymentUtil的校验方法来校验调用者的身份
		boolean bool=PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
				r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		if(!bool){
			request.setAttribute("code", "error");
			request.setAttribute("msg", "无效的签名，支付失败！");
			return "message";
		}
		if(r1_Code.equals("1")){
			//修改订单状态
			if(r9_BType.equals("1")){
				request.setAttribute("code", "success");
				request.setAttribute("msg", "恭喜您，支付成功！");
				
				List<FuKuanInfoBean> fukuanInfo=(List<FuKuanInfoBean>) session.get("fuKuanInfoBean");
				//fuKuanInfoBean.setOrderid(fu.getOrderid());
				int result = 0;
				int result1 = 0;
				int result2 = 0;
				for(int i=0;i<fukuanInfo.size();i++){
					//修改订单状态
					result=fukuanInfoService.updateOrderStatus(fukuanInfo.get(i));
					//修改商品表的销售量
					result1=fukuanInfoService.updateProductValue(fukuanInfo.get(i).getProid());
					//修改商品详细表销售量、库存
					result2=fukuanInfoService.updateDetailValue(fukuanInfo.get(i).getDeid());
				}
				//System.out.println("付款后的状态："+result+"==>"+result1+"==>"+result2);
				if(result==1 && result1==1 && result2==1){
					return "message";
				}
			}else if(r9_BType.equals("2")){
				
			}
		}
		return "message";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	@Override
	public FuKuanInfoBean getModel() {
		fuKuanInfoBean=new FuKuanInfoBean();
		return fuKuanInfoBean;
	}
}
