package com.yc.mogujie.service;

import com.yc.mogujie.entity.UserInfo;

public interface UserInfoService {

	int userRegister(UserInfo userInfo);

	UserInfo login(UserInfo userInfo);
	
}
