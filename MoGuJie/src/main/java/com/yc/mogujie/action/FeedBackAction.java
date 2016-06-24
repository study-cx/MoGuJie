package com.yc.mogujie.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.FeedBackBean;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.FeedBackService;
import com.yc.mogujie.util.MogujieData;

@Controller("feedBackAction")
public class FeedBackAction implements ModelDriven<FeedBackBean>,SessionAware{
	
	@Autowired
	private FeedBackService feedBackService;
	private FeedBackBean feedback;
	
	private Map<String,Object> session;
	private int addPingJia;
	public int getAddPingJia() {
		return addPingJia;
	}
	public String lala(){
		int proid=feedback.getProid();
		int orderid=feedback.getOrderid();
		int orid=feedback.getOrid();
		session.put("proid", proid);
		session.put("orderid", orderid);
		session.put("orid", orid);
		return "tiaozhuanpinglun";
	}
	public String addPingJia(){
		UserInfo us=(UserInfo) session.get(MogujieData.LOGIN_USER);
		int usid=us.getUsid();
		feedback.setUsid(usid);
		
		int proid=(int) session.get("proid");
		feedback.setProid(proid);
		
		int orderid=(int) session.get("orderid");
		feedback.setOrderid(orderid);
		
		int orid=(int) session.get("orid");
		
		addPingJia=feedBackService.addpl(feedback);
		if(addPingJia>0){
			int updatepinglunStatus=feedBackService.updatepingjia(orid);
			if(updatepinglunStatus>0){
				addPingJia=1;
			}else{
				addPingJia=-1;
			}
			
		}
			
			
			return "addPingJia";
	}

	@Override
	public FeedBackBean getModel() {
		feedback=new FeedBackBean();
		return feedback;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
}
