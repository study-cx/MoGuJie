package com.yc.mogujie.action;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.UserInfoService;
import com.yc.mogujie.util.MogujieData;
import com.yc.mogujie.util.VerifyCode;

@Controller("userAction")
public class UserAction implements ModelDriven<UserInfo>{
	private UserInfo userInfo;
	private VerifyCode vc=new VerifyCode();
	private String email;
	
	public void setEmail(String email) {
		this.email = email;
	}
	@Autowired
	private JavaMailSender javaMailSender;
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
		ActionContext.getContext().getSession().put("userInfo",userInfo);
		ActionContext.getContext().getSession().put(MogujieData.CODE, uuid);
		smm.setText(uuid);
		javaMailSender.send(smm);
		return "tiaozhuan";
		
	}
	public String registers(){
		String jiaoyan=(String) ActionContext.getContext().getSession().get(MogujieData.CODE);
		if(jiaoyan.equals(email)){
			System.out.println(userInfo);
			int result=userInfoService.userRegister(userInfo);
			if(result>0){
				return  "register";
			}
		}
		return  "false";
	}
	@Override
	public UserInfo getModel() {
		userInfo=new UserInfo();
		return userInfo;
	}
}
