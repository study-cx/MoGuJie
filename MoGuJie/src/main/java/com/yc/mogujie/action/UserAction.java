package com.yc.mogujie.action;


import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import java.util.Map;



import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.UserInfoService;
import com.yc.mogujie.util.MogujieData;
import com.yc.mogujie.util.VerifyCode;

@Controller("userAction")
public class UserAction implements ModelDriven<UserInfo>,SessionAware{
	private UserInfo userInfo;

	private VerifyCode vc=new VerifyCode();
	private String email;
	
	public void setEmail(String email) {
		this.email = email;
	}
	@Autowired
	private JavaMailSender javaMailSender;

	private Map<String, Object> session;
	

	@Autowired
	private UserInfoService userInfoService;
	
	public String login(){
		LogManager.getLogger().debug(userInfo);
		UserInfo us=userInfoService.login(userInfo);
		if(us!=null){
			ActionContext.getContext().getSession().put(MogujieData.LOGIN_USER, us);
			return "login";
		}
		return "false";
	}
	
	
	public String register(){
		SimpleMailMessage smm=new SimpleMailMessage();
		smm.setFrom("studymail_test@163.com");
		smm.setTo(userInfo.getUsemail());
		smm.setSubject("验证码");
		String uuid=vc.code();
		ActionContext.getContext().getSession().put(MogujieData.LOGIN_USER,userInfo);
		ActionContext.getContext().getSession().put(MogujieData.CODE, uuid);
		smm.setText(uuid);
		javaMailSender.send(smm);
		int result=userInfoService.userRegister(userInfo);
		if(result>0){
			return  "tiaozhuan";
		}
		return "false";
		
	}
	public String registers(){
		String jiaoyan=(String) ActionContext.getContext().getSession().get(MogujieData.CODE);
		if(jiaoyan.equals(email)){
			UserInfo us=(UserInfo) ActionContext.getContext().getSession().get(MogujieData.LOGIN_USER);
			String uname=us.getUname();
			int result=userInfoService.updateuserInfo(uname);
			return "register";
			
		}
		return  "false";
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
