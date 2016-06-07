package com.yc.mogujie.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Admin;
import com.yc.mogujie.entity.UserBean;
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
	public UserBean findBasicInfo(String uname) {
		return userInfoMapper.findBasicInfo(uname);
	}
	
	@Override
	public UserInfo login(UserInfo userInfo) {
		return userInfoMapper.login(userInfo);
	}

	@Override
	public int updateUserBasic(UserBean userBean) {
		return userInfoMapper.updateUser(userBean);
	}

	@Override
	public int updateUserPwd(Map<String, Object> params) {
		return userInfoMapper.updatePwd(params);
	}

	@Override
	public int updatePhoto(UserBean userBean) {
		return userInfoMapper.updatePhoto(userBean);
	}
	@Override
	public int updateuserInfo(String uname) {
		return userInfoMapper.update(uname);
	}
	
	@Override
	public List<UserInfo> find(Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return userInfoMapper.finds(params);
	}

	@Override
	public UserInfo find(String usid) {
		return userInfoMapper.find(usid);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		return userInfoMapper.updateUserInfo(userInfo);
	}
}
