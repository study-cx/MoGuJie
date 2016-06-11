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
import com.yc.mogujie.service.AddrService;
import com.yc.mogujie.service.FukuanInfoService;
import com.yc.mogujie.service.UserInfoService;
import com.yc.mogujie.util.MogujieData;

@Controller("fuKuanInfoAction")
public class FuKuanInfoAction implements  ModelDriven<FuKuanInfoBean>{
	@Autowired
	private FukuanInfoService fukuanInfoService;
	
	private  FuKuanInfoBean fuKuanInfoBean;
	private int flag;
	
	public int getFlag() {
		return flag;
	}
	private int cid;
	
	public void setCid(int cid) {
		this.cid = cid;
	}
	private Address address;
	
	public Address getAddress() {
		return address;
	}
	//付款界面查询默认地址
	public String selectAddress(){
		UserInfo us=(UserInfo) ActionContext.getContext().getSession().get(MogujieData.LOGIN_USER);
		int usid=us.getUsid();
		address=fukuanInfoService.selectMorenAddess(usid);
		return "selectAddress";
	}
	//付款界面表格显示的信息//直接购买跳转来
	public String jieesuanInfo(){
		flag=fukuanInfoService.selectFuKuanInfo(fuKuanInfoBean);
		return "jieesuanInfo";
	}
	//付款界面表格显示的信息//购物车跳转来
	public void saveCartInfo(){
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
	
	
}
