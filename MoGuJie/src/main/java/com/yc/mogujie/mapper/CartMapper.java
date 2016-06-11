package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Cart;

import com.yc.mogujie.entity.CartBean;

import java.util.List;

import java.math.BigDecimal;


public interface CartMapper {
    int deleteByPrimaryKey(BigDecimal cid);

    int insert(Cart record);

    int insertSelective(Cart record);


	int updateNum(CartBean cartBean);

	int insertIntoCart(Cart cart);

	String selectProphoto(Cart cart);

    Cart selectByPrimaryKey(BigDecimal cid);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    
    
    List<CartBean> getAllCart(CartBean cartBean);

	int deleteCart(int cid);

	
}
