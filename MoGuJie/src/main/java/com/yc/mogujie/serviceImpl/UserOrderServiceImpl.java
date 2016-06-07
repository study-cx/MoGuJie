package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.UserOrderBean;
import com.yc.mogujie.mapper.UserOrderMapper;
import com.yc.mogujie.service.UserOrderService;

@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService {
	
	@Autowired
	private UserOrderMapper userOrderMapper;

	@Override
	public List<UserOrderBean> findAllOrder(int usid) {
		return userOrderMapper.findAllOrder(usid);
	}

	@Override
	public List<UserOrderBean> findNoPayOrder(int usid) {
		return userOrderMapper.findNoPayOrder(usid);
	}

	@Override
	public List<UserOrderBean> findPaiedOrder(int usid) {
		return userOrderMapper.findPaiedOrder(usid);
	}

}
