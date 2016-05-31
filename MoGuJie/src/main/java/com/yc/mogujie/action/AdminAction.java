package com.yc.mogujie.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Admin;
import com.yc.mogujie.service.AdminService;
import com.yc.mogujie.util.MogujieData;

@Controller("adminAction")
public class AdminAction implements ModelDriven<Admin>, SessionAware {
	private Admin admin;
	private Admin chakeAname;
	private Admin chakeAemail;
	private int pageNo = 1;
	private int pageSize = 10;
	private String aids;
	@Autowired
	private AdminService adminService;
	private Map<String, Object> session;

	public Admin getChakeAname() {
		return chakeAname;
	}

	public Admin getChakeAemail() {
		return chakeAemail;
	}

	public void setAids(String aids) {
		this.aids = aids;
	}

	public String login() {
		LogManager.getLogger().debug("login登陆操作...");
		System.out.println(admin);
		admin = adminService.login(admin);
		if (admin == null) {
			session.put(MogujieData.ERROR_MSG, "用户名或密码错误!!!");
			return "adminLogin";
		}
		session.put(MogujieData.LOGIN_Admin, admin);
		return "adminLoginSuccess";
	}

	public String adminRegiest() {
		LogManager.getLogger().debug("管理员注册操作...");
		int result = adminService.addAdminInfo(admin);
		if (result == 1) {
			return "addAdminSuccess";
		}
		session.put(MogujieData.ERROR_MSG, "注册失败!!!");
		return "addAdmin";
	}

	public String checkName() {
		LogManager.getLogger().debug("管理员信息注册用户名验证操作...");
		chakeAname = adminService.findByName(admin.getAname());
		System.out.println(chakeAname);
		return "ckName";
	}

	public String checkEmail() {
		LogManager.getLogger().debug("管理员信息注册用户名验证操作...");
		chakeAemail = adminService.findByEmail(admin.getAemail());
		System.out.println(chakeAemail);
		return "ckEmail";
	}

	public void getPageAdminInfo() {
		LogManager.getLogger().debug("管理员信息查询操作...");
		List<Admin> admins = adminService.find(pageNo, pageSize);

		Gson gson = new Gson();// json处理对象
		String jsonResult = gson.toJson(admins);// 把对象转换成json字符串
		try {
			HttpServletResponse response = ServletActionContext.getResponse();// 获得response对象
			response.setCharacterEncoding("utf-8");
			response.setContentType("charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);// 测试与页面是否跑通
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void addAdminInfo() {
		LogManager.getLogger().debug("管理员注册操作...");
		int result = adminService.addAdminInfo(admin);
		Gson gson = new Gson();// json处理对象
		String jsonResult = gson.toJson(result);// 把对象转换成json字符串
		try {
			HttpServletResponse response = ServletActionContext.getResponse();// 获得response对象
			response.setCharacterEncoding("utf-8");
			response.setContentType("charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);// 测试与页面是否跑通
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void del() {
		LogManager.getLogger().debug("管理员删除操作...");
		int result = adminService.del(aids);
		Gson gson = new Gson();// json处理对象
		String jsonResult = gson.toJson(result);// 把对象转换成json字符串
		try {
			HttpServletResponse response = ServletActionContext.getResponse();// 获得response对象
			response.setCharacterEncoding("utf-8");
			response.setContentType("charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);// 测试与页面是否跑通
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Admin getModel() {
		admin = new Admin();
		return admin;

	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
