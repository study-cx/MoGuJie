package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.CartBean;

public interface CartService {
	List<CartBean> findAllCart(CartBean cartBean); //查询所有的购物车信息
	
	int delete(int cid); //根据cid删除购物车信息
	
	int update(CartBean cartBean);//在购物车中更新商品数量
}
