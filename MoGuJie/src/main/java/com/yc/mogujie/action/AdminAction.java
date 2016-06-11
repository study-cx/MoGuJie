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
	
	@Autowired
	private AdminService adminService;
	private Map<String, Object> session;

	public Admin getChakeAname() {
		return chakeAname;
	}

	public Admin getChakeAemail() {
		return chakeAemail;
	}
	

	public String login() {
		LogManager.getLogger().debug("logig管理员登录...");
		System.out.println(admin);
		admin = adminService.login(admin);
		if (admin == null) {
			session.put(MogujieData.ERROR_MSG, "登录失败!!!");
			return "adminLogin";
		}
		session.put(MogujieData.LOGIN_Admin, admin);
		return "adminLoginSuccess";
	}

	public String adminRegiest() {
		LogManager.getLogger().debug("管理员注册操作..");
		int result = adminService.addAdminInfo(admin);
		if (result == 1) {
			return "addAdminSuccess";
		}
		session.put(MogujieData.ERROR_MSG, "注册失败!!!");
		return "addAdmin";
	}

	public String checkName() {
		LogManager.getLogger().debug("注册名字验证...");
		chakeAname = adminService.findByName(admin.getAname());
		System.out.println(chakeAname);
		return "ckName";
	}

	public String checkEmail() {
		LogManager.getLogger().debug("注册邮箱验证..");
		chakeAemail = adminService.findByEmail(admin.getAemail());
		System.out.println(chakeAemail);
		return "ckEmail";
	}

	public void getPageAdminInfo() {
		LogManager.getLogger().debug("管理员信息分页查询操作..");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<Admin> admins = adminService.find(Integer.valueOf(page), Integer.valueOf(rows));

		Gson gson = new Gson();
		String jsonResult = gson.toJson(admins);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
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

	public void addAdminInfo() {
		LogManager.getLogger().debug("后台添加管理员..");
		int result = adminService.addAdminInfo(admin);
		Gson gson = new Gson();
		String jsonResult = gson.toJson(result);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
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

	public void del() {
		LogManager.getLogger().debug("删除管理员..");
		String aids=ServletActionContext.getRequest().getParameter("aids");
		int result = adminService.del(aids);
		Gson gson = new Gson();
		String jsonResult = gson.toJson(result);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
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
