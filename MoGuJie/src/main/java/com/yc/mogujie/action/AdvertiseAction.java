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
import com.yc.mogujie.service.AdvertiseService;

@Controller("advertiseAction")
public class AdvertiseAction implements ModelDriven<Advertise>, SessionAware{
	
	private Advertise advertise;
	
	@Autowired
	private AdvertiseService advertiseService;
	
	private Map<String, Object> session;
	
	public void getPageAdtInfo(){
		LogManager.getLogger().debug("广告位分页查询操作..");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<Advertise> advertises = advertiseService.find(Integer.valueOf(page), Integer.valueOf(rows));

		Gson gson = new Gson();
		String jsonResult = gson.toJson(advertises);
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
	
	public void addAdvertise(){
		LogManager.getLogger().debug("后台添加广告位..");
		int result = advertiseService.addAdvertise(advertise);
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

	public void updateAdvertise(){
		LogManager.getLogger().debug("后台修改广告位..");
		int result = advertiseService.updateAdvertise(advertise);
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
	
	public void delAdvertise(){
		LogManager.getLogger().debug("后台删除广告位..");
		String aid=ServletActionContext.getRequest().getParameter("aids");
		int result = advertiseService.delAdvertise(aid);
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

	public void getAllAdvertise(){
		LogManager.getLogger().debug("广告位查询..");
		List<Advertise> result = advertiseService.finds();
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
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public Advertise getModel() {
		advertise = new Advertise();
		return advertise;
	}
}
