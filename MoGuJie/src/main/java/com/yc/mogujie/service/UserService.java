package com.yc.mogujie.service;

import java.util.List;
import com.yc.mogujie.entity.UserBean;

public interface UserService {
	//前台查询用户基本信息
	public List<UserBean> findBasicInfo(String uname);
}
