package com.yc.mogujie.action;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.UserInfoService;

@Controller("userInfoAction")
public class UserInfoAction implements ModelDriven<UserInfo>,SessionAware{
	@Autowired
	private UserInfoService userInfoService;
	
	private UserInfo userInfo;
	private Map<String,Object> session;
	public String login() {
		LogManager.getLogger().debug("userInfo信息==》"+userInfo);
		userInfoService.login(userInfo);
		session.put("userInfo", userInfo);
		return "login";
	}

	@Override
	public UserInfo getModel() {
		userInfo=new UserInfo();
		return userInfo;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
}
