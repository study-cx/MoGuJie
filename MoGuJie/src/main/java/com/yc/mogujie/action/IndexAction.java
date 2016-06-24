package com.yc.mogujie.action;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.yc.mogujie.entity.Categorybean;
import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.entity.Categorytwos;
import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Product;
import com.yc.mogujie.service.IndexService;

@Controller("indexAction")
public class IndexAction {
	private String SouSuoContent;
	private List<Categorybean> productContent;
	
	public void setSouSuoContent(String souSuoContent) {
		SouSuoContent = souSuoContent;
	}

	@Autowired
	private IndexService indexService;
	public String list(){
		List<Categoryone> typeone=indexService.selectCategoryOne();
		List<Categorytwo> typetwo=indexService.selectCategoryTwo();
		List<GuangGaoBean> guangao=indexService.selectGuanGao();
		List<Product> liangping=indexService.selectProductByobligateone();
		List<Product> renqinvxie=indexService.selectRenqiNvxie();
		ActionContext.getContext().getSession().put("cateone", typeone);
		ActionContext.getContext().getSession().put("catetwo", typetwo);
		ActionContext.getContext().getSession().put("weizhi", guangao);
		ActionContext.getContext().getSession().put("liangping", liangping);
		ActionContext.getContext().getSession().put("renqinvxie", renqinvxie);
		
		return "index";
	}
	
	public String SouSuo(){
		System.out.println("SouSuoContent"+SouSuoContent);
		productContent=indexService.selectProductByCateOne(SouSuoContent);
		System.out.println(productContent.size());
		if(productContent.size()==0){
			productContent=indexService.selectProductByCateTwo(SouSuoContent);
			if(productContent.size()==0){
				productContent=indexService.selectProductByCateThree(SouSuoContent);
				if(productContent.size()==0){
					productContent=indexService.selectProductByProname(SouSuoContent);
					if(productContent.size()==0){
						productContent=indexService.selectProductByProContent(SouSuoContent);
					}
				}
			}
		}
		
		String Categoryidone=productContent.get(0).getCategoryidone();
		List<Categorytwos> typetwo =indexService.selectCateTwoByIdOne(Categoryidone);
		ActionContext.getContext().getSession().put("catetwos", typetwo);
		ActionContext.getContext().getSession().put("AllProductInfo", productContent);
		return "sousuorecord";
		
	}
	
}
