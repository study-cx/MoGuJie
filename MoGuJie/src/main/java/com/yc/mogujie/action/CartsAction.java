package com.yc.mogujie.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Cart;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.CartService;
import com.yc.mogujie.util.MogujieData;
@Controller("cartsAction")
public class CartsAction implements ModelDriven<Cart>{
	
	private Cart cart;
	private int flag;
	
	
	public int getFlag() {
		return flag;
	}
	@Autowired
	private CartService cartService;
	
	public String AddGouWuChe(){
		UserInfo us=(UserInfo) ActionContext.getContext().getSession().get(MogujieData.LOGIN_USER);
		cart.setUsid(us.getUsid());
		String photo=cartService.selectProphoto(cart);
		cart.setPcolor(photo);
	    flag=cartService.insertIntoCart(cart);
		return "addGouWucheSuccess";
	}
	@Override
	public Cart getModel() {
		cart=new Cart();
		return cart;
	}
	
}
