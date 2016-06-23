package com.yc.mogujie.action;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Detail;
import com.yc.mogujie.entity.Product;
import com.yc.mogujie.service.XiangQingService;

import com.yc.mogujie.entity.Feedback;
import com.yc.mogujie.entity.FeedbackBean;

@Controller("xiangQingAction")
public class XiangQingAction implements ModelDriven<Detail>{
	@Autowired
	private XiangQingService xiangQingService;
	private Detail detail;

	private String shownumber;
	
	public String getShownumber() {
		return shownumber;
	}

	public String show(){
		List<Product> spxqproduct=xiangQingService.SelectProductByProid(detail.getProid());
		List<Detail> color=xiangQingService.SelectColorByProid(detail.getProid());
		List<Detail> psize=xiangQingService.SelectPsizeByProid(detail.getProid());
		List<FeedbackBean> feedback=xiangQingService.SelectFeedBack(detail.getProid());
		if(spxqproduct.size()>0 && color.size()>0 && psize.size()>0){
			ActionContext.getContext().getSession().put("spxqproduct", spxqproduct);
			ActionContext.getContext().getSession().put("color", color);
			ActionContext.getContext().getSession().put("psize", psize);
			ActionContext.getContext().getSession().put("feedback", feedback);
			return "spxq";
		}
		
		return "fail";
		
	}
	public String shownumber(){
		LogManager.getLogger().debug(detail);
		shownumber=xiangQingService.SelectNumberBySizeAndColor(detail);
		return "shownumber";
	}
	

	@Override
	public Detail getModel() {
		detail=new Detail();
		return detail;
	}
	
}
