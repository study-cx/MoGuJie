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
import com.yc.mogujie.entity.Product;
import com.yc.mogujie.service.ProductService;

@Controller("productAction")
public class ProductAction  implements ModelDriven<Product>,SessionAware  {
	private Product product;
	private Map<String, Object> session;
	
	@Autowired
	private ProductService productService;
	
	
	public void getAllProduct(){
		LogManager.getLogger().debug("商品查询..");
		List<Product> result = productService.findAllProduct();
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
		this.session=session;
	}

	@Override
	public Product getModel() {
		this.product = new Product();
		return product;
	}

}
