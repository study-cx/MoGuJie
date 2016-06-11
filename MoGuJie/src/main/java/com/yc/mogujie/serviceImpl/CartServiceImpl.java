package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Cart;
import com.yc.mogujie.entity.CartBean;
import com.yc.mogujie.mapper.CartMapper;
import com.yc.mogujie.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public List<CartBean> findAllCart(CartBean cartBean) {
		return cartMapper.getAllCart(cartBean);
	}

	@Override
	public int delete(int cid) {
		return cartMapper.deleteCart(cid);
	}

	@Override
	public int update(CartBean cartBean) {
		return cartMapper.updateNum(cartBean);
	}

	@Override
	public int insertIntoCart(Cart cart) {
		
		return cartMapper.insertIntoCart(cart);
	}

	@Override
	public String selectProphoto(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.selectProphoto(cart);
	}

}
