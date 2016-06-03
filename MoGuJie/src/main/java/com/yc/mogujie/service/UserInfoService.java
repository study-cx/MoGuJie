package com.yc.mogujie.service;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.entity.UserInfo;

public interface UserInfoService {

	int userRegister(UserInfo userInfo);

	//前台查询用户基本信息
	public UserBean findBasicInfo(String uname);
	
	UserInfo login(UserInfo userInfo);

	int updateUserBasic(UserBean userBean);

	int updateUserPwd(Map<String, Object> params);

	int updatePhoto(UserBean userBean);

	int updateuserInfo(String uname);
	
	public List<UserInfo> find(Integer pageNo, Integer pageSize);
	
	UserInfo find(String usid);
	
	int updateUserInfo(UserInfo userInfo);
}
