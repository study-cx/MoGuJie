package com.yc.mogujie.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Categorybean;
import com.yc.mogujie.service.CategorytwoService;

@Controller("categoryAction")
public class CategoryAction implements ModelDriven<Categorybean>,SessionAware {
	private Map<String, Object> session;
	private Categorybean category;
	private List<Categorybean> cateTypeInfo;
	
	@Autowired
	private CategorytwoService categorytwoService;

	public String findCatetwoType(){
		//System.out.println(category.getCategoryidone());
		cateTypeInfo=categorytwoService.getCatetwoType(category);
		//System.out.println("获取到的类型为："+cateTypeInfo);
		session.put("catetwo", cateTypeInfo);
		cateTypeInfo=categorytwoService.getAllProductByType(category);
		session.put("AllProductInfo", cateTypeInfo);
		return "findCateSuccess";
	}
	
	public String findProductByType(){
		//System.out.println("一级分类id："+category.getCategoryidone());
		//System.out.println("二级分类类型："+category.getCategoryTypetwo());
		cateTypeInfo=categorytwoService.getCatetwoType(category);
		//System.out.println("获取到的类型为："+cateTypeInfo);
		session.put("catetwo", cateTypeInfo);
		cateTypeInfo=categorytwoService.getProductByType(category);
		session.put("AllProductInfo", cateTypeInfo);
		//System.out.println(cateTypeInfo);
		return "findCateSuccess";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public Categorybean getModel() {
		category=new Categorybean();
		return category;
	}


}
