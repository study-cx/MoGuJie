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
import com.yc.mogujie.entity.Advertise;
import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.service.AdvertiseService;
import com.yc.mogujie.service.CategoryoneService;

@Controller("categoryoneAction")
public class CategoryoneAction implements ModelDriven<Categoryone>, SessionAware{
	private Categoryone categoryone;
	
	@Autowired
	private CategoryoneService categoryoneService;
	
	private Map<String, Object> session;
	
	
	public void getPageTypeInfo(){
		LogManager.getLogger().debug("商品分类分页查询操作..");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<Categoryone> categoryones = categoryoneService.find(Integer.valueOf(page), Integer.valueOf(rows));

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
	
	public void addTypeInfo(){
		LogManager.getLogger().debug("商品分类添加操作..");
		int result = categoryoneService.addTypeone(categoryone);
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
	
	public void updateTypeInfo(){
		LogManager.getLogger().debug("商品分类修改操作..");
		System.out.println(categoryone);
		int result = categoryoneService.updateTypeone(categoryone);
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
	
	public void delTypeInfo(){
		LogManager.getLogger().debug("商品分类删除操作..");
		String categoryidone=ServletActionContext.getRequest().getParameter("categoryidones");
		int result = categoryoneService.delete(categoryidone);
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
	
	public void findCategoryone(){
		LogManager.getLogger().debug("商品分类查询操作..");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<Categoryone> categoryones = categoryoneService.finds(categoryone.getCategorytypeone(),categoryone.getCategoryidone(),Integer.valueOf(page), Integer.valueOf(rows));
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
	
	public void getAllTypeone(){
		LogManager.getLogger().debug("商品分类查询操作..");
		List<Categoryone> categoryones = categoryoneService.findtypeone();
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
	public Categoryone getModel() {
		this.categoryone = new Categoryone();
		return categoryone;
	}

}
