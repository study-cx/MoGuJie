package com.yc.mogujie.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.mapper.UserMapper;
import com.yc.mogujie.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	//前台查询用户基本信息
	@Override
	public List<UserBean> findBasicInfo(String uname) {
		return userMapper.findBasicInfo(uname);
	}
}
