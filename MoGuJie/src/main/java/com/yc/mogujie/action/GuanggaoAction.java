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
import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Guanggao;
import com.yc.mogujie.service.GuanggaoService;

@Controller("guanggaoAction")
public class GuanggaoAction implements ModelDriven<Guanggao>, SessionAware{
	private Map<String, Object> session;
	private Guanggao guanggao;
	@Autowired
	private GuanggaoService guanggaoService;
	
	public void getPageNewsInfo(){
		LogManager.getLogger().debug("广告分页查询操作..");
		String page=ServletActionContext.getRequest().getParameter("page");
		String rows=ServletActionContext.getRequest().getParameter("rows");
		List<Guanggao> guanggaos = guanggaoService.find(Integer.valueOf(page), Integer.valueOf(rows));

		Gson gson = new Gson();
		String jsonResult = gson.toJson(guanggaos);
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
	
	public void findGuanggaoBygid(){
		LogManager.getLogger().debug("广告详细查询操作..");
		String gid=ServletActionContext.getRequest().getParameter("gid");
		GuangGaoBean guanggaos = guanggaoService.finds(gid);
		Gson gson = new Gson();
		String jsonResult = gson.toJson(guanggaos);
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
	public Guanggao getModel() {
		guanggao = new Guanggao();
		return guanggao;
	}
	

}
