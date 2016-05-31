package com.yc.mogujie.mapper;

import java.util.Map;

import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.entity.UserInfo;

public interface UserInfoMapper {

	int userRegister(UserInfo userInfo);
	
	//前台查询用户基本信息 
	UserBean findBasicInfo(String uname);

	UserInfo login(UserInfo userInfo);

	//前台修改用户基本信息 
	int updateUser(UserBean userBean);
	
	int update(String uname);
    
	//前台  修改用户密码
	int updatePwd(Map<String, Object> params);
	
	//前台  修改用户头像
	int updatePhoto(UserBean userBean);
}
