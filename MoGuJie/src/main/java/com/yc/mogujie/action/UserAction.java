package com.yc.mogujie.action;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.UserInfoService;
import com.yc.mogujie.util.MogujieData;

@Controller("userAction")
public class UserAction implements ModelDriven<UserInfo>{
	private UserInfo userInfo;
	@Autowired
	private UserInfoService userInfoService;
	
	public String login(){
		LogManager.getLogger().debug(userInfo);
		UserInfo us=userInfoService.login(userInfo);
		ActionContext.getContext().getSession().put(MogujieData.LOGIN_USER, us);
		return "login";
	}
	
	
	public String register(){
		LogManager.getLogger().debug(userInfo);
		int result=userInfoService.userRegister(userInfo);
		
		return  "register";
	}

	@Override
	public UserInfo getModel() {
		userInfo=new UserInfo();
		return userInfo;
	}
}
