package com.yc.mogujie.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Categorybean;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.service.CategorytwoService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.yc.mogujie.entity.Categoryone;

@Controller("categorytwoAction")
public class CategorytwoAction implements ModelDriven<Categorytwo>,SessionAware {
	private Categorytwo categorytwo;
	private Map<String, Object> session;
	@Autowired
	private CategorytwoService categorytwoService;

	public void getPageTypeInfo(){
		LogManager.getLogger().debug("二级商品分类分页查询操作..");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<Categorytwo> categoryones = categorytwoService.find(Integer.valueOf(page), Integer.valueOf(rows));

		Gson gson = new Gson();
		String jsonResult = gson.toJson(categoryones);
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
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public Categorytwo getModel() {
		this.categorytwo = new 	Categorytwo();	
		return categorytwo;
	}
}
