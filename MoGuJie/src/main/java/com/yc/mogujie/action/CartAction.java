package com.yc.mogujie.action;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.Aware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Cart;
import com.yc.mogujie.entity.CartBean;
import com.yc.mogujie.serviceImpl.CartServiceImpl;

@Controller("cartAction")
public class CartAction implements ModelDriven<CartBean>,SessionAware{
	
	@Autowired
	private CartServiceImpl cartServiceImpl;
	private CartBean cartBean;
	private Map<String,Object> session;
	
	private List<CartBean> cartList;
	public List<CartBean> getCartList() {
		return cartList;
	}
	
	public int deleteCart;
	public int getDeleteCart() {
		return deleteCart;
	}
	
	public int update;
	public int getUpdate() {
		return update;
	}

	public String shopping() {
		LogManager.getLogger().debug("取到的购物车信息==》"+cartBean);
		cartList= cartServiceImpl.findAllCart(cartBean);
		System.out.println(cartList);
		return "cartList";
	}

	public String deleteCart(){
		deleteCart=cartServiceImpl.delete(cartBean.getCid());
		return "deleteCart";
	}
	
	public String updateCart(){
		update=cartServiceImpl.update(cartBean);
		return "update";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public CartBean getModel() {
		cartBean=new CartBean();
		return cartBean;
	}
}
