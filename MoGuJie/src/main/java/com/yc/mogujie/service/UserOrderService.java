package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.UserOrderBean;

public interface UserOrderService {
	List<UserOrderBean> findAllOrder(int usid);

	List<UserOrderBean> findNoPayOrder(int usid);

	List<UserOrderBean> findPaiedOrder(int usid);
}
