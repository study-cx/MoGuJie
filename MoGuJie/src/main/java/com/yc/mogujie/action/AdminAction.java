package com.yc.mogujie.action;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Admin;
import com.yc.mogujie.service.AdminService;

@Controller("adminAction")
public class AdminAction implements ModelDriven<Admin>, SessionAware {
	private Admin admin;

	@Autowired
	private AdminService adminService;
	private Map<String, Object> session;
	
	public String login(){
		LogManager.getLogger().debug("login登陆操作...");
		admin=adminService.login(admin);
		if(admin==null){
			session.put("", "用户名或密码错误!!!");
			return "login";
		}
		session.put("", admin);
		return "loginSuccess";
	}

	@Override
	public Admin getModel() {
		admin=new Admin();
		return admin;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = session;
	}

}
