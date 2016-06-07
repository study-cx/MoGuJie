package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.UserOrderBean;

import java.util.List;

public interface UserOrderMapper {
	List<UserOrderBean> findAllOrder(int usid);

	List<UserOrderBean> findNoPayOrder(int usid);
	
	List<UserOrderBean> findPaiedOrder(int usid);
}