package com.yc.mogujie.action;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Product;
import com.yc.mogujie.service.IndexService;

@Controller("indexAction")
public class IndexAction {
	@Autowired
	private IndexService indexService;
	public String list(){
		List<Categoryone> typeone=indexService.selectCategoryOne();
		List<Categorytwo> typetwo=indexService.selectCategoryTwo();
		List<GuangGaoBean> guangao=indexService.selectGuanGao();
		List<Product> liangping=indexService.selectProductByobligateone();
		ActionContext.getContext().getSession().put("cateone", typeone);
		ActionContext.getContext().getSession().put("catetwo", typetwo);
		ActionContext.getContext().getSession().put("weizhi", guangao);
		ActionContext.getContext().getSession().put("liangping", liangping);
		LogManager.getLogger().debug(typetwo);
		return "index";
	}
	
}
