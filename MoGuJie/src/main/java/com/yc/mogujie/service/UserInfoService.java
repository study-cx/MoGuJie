package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.entity.UserInfo;

public interface UserInfoService {

	int userRegister(UserInfo userInfo);

	//前台查询用户基本信息
	public UserBean findBasicInfo(String uname);
	
	UserInfo login(UserInfo userInfo);
}
