package com.yc.mogujie.action;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserOrderBean;
import com.yc.mogujie.service.UserOrderService;

@Controller("userOrderBeanAction")
public class UserOrderBeanAction implements ModelDriven<UserOrderBean>,SessionAware{
	private UserOrderBean userOrderBean;
	private Map<String, Object> session;
	private List<UserOrderBean> allOrders;
	
	public List<UserOrderBean> getAllOrders() {
		return allOrders;
	}
	public void setAllOrders(List<UserOrderBean> allOrders) {
		this.allOrders = allOrders;
	}

	@Autowired
	private UserOrderService userOrderService;
	
	//查询全部订单
	public String findAllOrders(){
	
		LogManager.getLogger().debug("userOrderBean"+userOrderBean);
		//System.out.println("usid==>"+userOrderBean.getUsid());
		allOrders=userOrderService.findAllOrder(userOrderBean.getUsid());
		//System.out.println("获取到的全部订单为："+allOrders);
		return "findSuccess";
	}
	
	//查询未付款订单
	public String findNoPayOrder(){
		LogManager.getLogger().debug(userOrderBean);
		allOrders.clear();
		allOrders=userOrderService.findNoPayOrder(userOrderBean.getUsid());
		//System.out.println("获取到的未付款订单为："+allOrders);
		return "findSuccess";
	}
	
	//查询已付款订单
	public String findPaiedOrder(){
		LogManager.getLogger().debug(userOrderBean);
		allOrders.clear();
		allOrders=userOrderService.findPaiedOrder(userOrderBean.getUsid());
		//System.out.println("获取到的已付款订单为："+allOrders);
		return "findSuccess";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	@Override
	public UserOrderBean getModel() {
		userOrderBean=new UserOrderBean();
		return userOrderBean;
	}
}
