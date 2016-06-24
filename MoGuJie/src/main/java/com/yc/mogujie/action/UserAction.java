package com.yc.mogujie.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.UserInfoService;
import com.yc.mogujie.util.MogujieData;
import com.yc.mogujie.util.UploadUtil;
import com.yc.mogujie.util.VerifyCode;

@Controller("userAction")
public class UserAction implements ModelDriven<UserInfo>, SessionAware {
	private UserInfo userInfo;
	@Autowired
	private UploadUtil uploadUtil;

	private VerifyCode vc = new VerifyCode();
	private String email;
	
	private File[] uphotos;
	private String[] uphotosFileName;
	private String[] uphotosContentType;

	
	@Autowired
	private JavaMailSender javaMailSender;

	private Map<String, Object> session;

	@Autowired
	private UserInfoService userInfoService;

	public String login() {
		LogManager.getLogger().debug(userInfo);
		UserInfo us = userInfoService.login(userInfo);
		if (us != null) {
			ActionContext.getContext().getSession()
					.put(MogujieData.LOGIN_USER, us);
			return "login";
		}
		return "Nologin";
	}

	public String register() {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom("studymail_test@163.com");
		smm.setTo(userInfo.getUsemail());
		smm.setSubject("验证码");
		String uuid = vc.code();
		ActionContext.getContext().getSession()
				.put(MogujieData.LOGIN_USER, userInfo);
		ActionContext.getContext().getSession().put(MogujieData.CODE, uuid);
		smm.setText(uuid);
		javaMailSender.send(smm);
		int result = userInfoService.userRegister(userInfo);
		if (result > 0) {
			return "tiaozhuan";
		}
		return "false";

	}

	public String registers() {
		String jiaoyan = (String) ActionContext.getContext().getSession()
				.get(MogujieData.CODE);
		if (jiaoyan.equals(email)) {
			UserInfo us = (UserInfo) ActionContext.getContext().getSession()
					.get(MogujieData.LOGIN_USER);
			String uname = us.getUname();
			int result = userInfoService.updateuserInfo(uname);
			return "register";

		}
		return "false";
	}

	public void getAllUserInfo() {
		LogManager.getLogger().debug("用户信息查询操作...");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<UserInfo> userInfo = userInfoService.find(Integer.valueOf(page), Integer.valueOf(rows));

		Gson gson = new Gson();// json处理对象
		String jsonResult = gson.toJson(userInfo);// 把对象转换成json字符串
		try {
			HttpServletResponse response = ServletActionContext.getResponse();// 获得response对象
			response.setCharacterEncoding("utf-8");
			response.setContentType("charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void findUserInfo(){
		LogManager.getLogger().debug("用户信息查询操作...");
		String usid=ServletActionContext.getRequest().getParameter("usid");
		UserInfo userInfo = userInfoService.find(usid);
		Gson gson = new Gson();// json处理对象
		String jsonResult = gson.toJson(userInfo);// 把对象转换成json字符串
		try {
			HttpServletResponse response = ServletActionContext.getResponse();// 获得response对象
			response.setCharacterEncoding("utf-8");
			response.setContentType("charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void updateUserInfo(){
		LogManager.getLogger().debug("用户信息修改操作...");
		String path=uploadUtil.image(uphotos,uphotosFileName);
		userInfo.setUphoto(path);
		int result = userInfoService.updateUserInfo(userInfo);
		Gson gson = new Gson();// json处理对象
		String jsonResult = gson.toJson(result);// 把对象转换成json字符串
		try {
			HttpServletResponse response = ServletActionContext.getResponse();// 获得response对象
			response.setCharacterEncoding("utf-8");
			response.setContentType("charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String shopping(){
		return "shopping";
	}
	
	public String dingdan(){
		return "dingdan";
	}
	
	@Override
	public UserInfo getModel() {
		userInfo = new UserInfo();
		return userInfo;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public File[] getUphotos() {
		return uphotos;
	}

	public void setUphotos(File[] uphotos) {
		this.uphotos = uphotos;
	}

	public String[] getUphotosFileName() {
		return uphotosFileName;
	}

	public void setUphotosFileName(String[] uphotosFileName) {
		this.uphotosFileName = uphotosFileName;
	}

	public String[] getUphotosContentType() {
		return uphotosContentType;
	}

	public void setUphotosContentType(String[] uphotosContentType) {
		this.uphotosContentType = uphotosContentType;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String loginOut(){
		ActionContext.getContext().getSession().put(MogujieData.LOGIN_USER, "");
		return "loginout";
	}

}
