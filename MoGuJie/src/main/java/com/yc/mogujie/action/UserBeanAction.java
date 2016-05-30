package com.yc.mogujie.action;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.service.UserInfoService;

@Controller("userBeanAction")
public class UserBeanAction implements ModelDriven<UserBean>{
	private UserBean userBean;
	private UserBean userInfo;
	
	public UserBean getUserInfo() {
		return userInfo;
	}

	@Autowired
	private UserInfoService userInfoService;
	
	//前台查询用户基本信息
	public String findBasicInfo(){
		LogManager.getLogger().debug(userBean);
		userInfo=userInfoService.findBasicInfo(userBean.getUname());
		System.out.println("查询到数据为："+userInfo);
		return "success";
	}

	@Override
	public UserBean getModel() {
		userBean=new UserBean();
		return userBean;
	}
}
