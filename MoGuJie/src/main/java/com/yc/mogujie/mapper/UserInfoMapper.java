package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.entity.UserInfo;

import java.math.BigDecimal;
import java.util.List;

public interface UserInfoMapper {

	int userRegister(UserInfo userInfo);
	
	//前台查询用户基本信息 
	UserBean findBasicInfo(String uname);

	UserInfo login(UserInfo userInfo);
    
}
