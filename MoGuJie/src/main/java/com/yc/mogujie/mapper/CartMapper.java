package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.CartBean;

import java.util.List;

public interface CartMapper {

	List<CartBean> getAllCart(CartBean cartBean);

	int deleteCart(int cid);

	int updateNum(CartBean cartBean);
}