package com.yc.mogujie.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.mapper.UserInfoMapper;
import com.yc.mogujie.service.UserInfoService;
@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	UserInfoMapper userInfoMapper;
	@Override
	public int userRegister(UserInfo userInfo) {
		
		return userInfoMapper.userRegister(userInfo);
	}
	@Override
	public UserInfo login(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.login(userInfo);
	}
	

}
