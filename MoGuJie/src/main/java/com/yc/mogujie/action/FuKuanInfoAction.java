package com.yc.mogujie.action;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.FukuanInfoService;
import com.yc.mogujie.util.MogujieData;

@Controller("fuKuanInfoAction")
public class FuKuanInfoAction implements  ModelDriven<FuKuanInfoBean>,SessionAware{
	@Autowired
	private FukuanInfoService fukuanInfoService;
	
	private  FuKuanInfoBean fuKuanInfoBean;
	private int flag;
	private int cid;
	private int fukuan;
	
	public int getFukuan() {
		return fukuan;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getFlag() {
		return flag;
	}
	private Address address;

	private Map<String, Object> session;
	
	public Address getAddress() {
		return address;
	}
	//付款界面查询默认地址
	public String selectAddress(){
		UserInfo us=(UserInfo) ActionContext.getContext().getSession().get(MogujieData.LOGIN_USER);
		int usid=us.getUsid();
		address=fukuanInfoService.selectMorenAddess(usid);
		//System.out.println("地址表："+address);
		return "selectAddress";
	}
	
	//付款界面表格显示的信息
	public String jieesuanInfo(){
		flag=fukuanInfoService.selectFuKuanInfo(fuKuanInfoBean);
		return "jieesuanInfo";
	}
	
	//确认并付款(生成订单，状态为未付款)
	public String paying(){
		List<FuKuanInfoBean> fukuanInfo=(List<FuKuanInfoBean>) session.get("fuKuanInfoBean");
		int result=fukuanInfoService.adduserOrder(fuKuanInfoBean);
		if(result==1){
			for(int i=0;i<fukuanInfo.size();i++){
				System.out.println(i+"===>"+fuKuanInfoBean.getOrderid());
				fukuanInfo.get(i).setOrderid(fuKuanInfoBean.getOrderid());
				fukuan=fukuanInfoService.addorderdetail(fukuanInfo.get(i));
			}
		}
		return "funkuanInfo";
	}
	//付款界面表格显示的信息//购物车跳转来
	public void saveCartInfo(){
		LogManager.getLogger().debug("取到的cid："+cid);
		int isof=fukuanInfoService.saveCartInfos(cid);
	}
	public void deleteInfo(){
		fukuanInfoService.deleteInfos();
		
	}
	
	@Override
	public FuKuanInfoBean getModel(){
		fuKuanInfoBean=new FuKuanInfoBean();
		return fuKuanInfoBean;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
}
