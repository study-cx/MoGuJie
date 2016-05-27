package com.yc.mogujie.action;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.service.UserInfoService;

@Controller("userBeanAction")
public class UserBeanAction implements ModelDriven<UserBean>,SessionAware{
	private UserBean userBean;
	private Map<String, Object> session;
	
	@Autowired
	private UserInfoService userInfoService;
	
	//前台查询用户基本信息
	public String findBasicInfo(){
		LogManager.getLogger().debug(userBean);
		UserBean user=userInfoService.findBasicInfo(userBean.getUname());
		System.out.println("查询到数据为："+user);
		return "findBasicSuccess";
	}

	@Override
	public UserBean getModel() {
		userBean=new UserBean();
		return userBean;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

}
