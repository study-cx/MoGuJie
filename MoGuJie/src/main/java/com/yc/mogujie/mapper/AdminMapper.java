package com.yc.mogujie.mapper;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.Admin;



public interface AdminMapper {

	Admin adminLogin(Admin admin);
	public List<Admin> find(Map<String ,Object> params);
	int addAdminInfo(Admin admin);
	Admin findByName(String aname);
	Admin findByEmail(String aemail);
	int total();
	int del(String aid);
	int del2(String aid);
}

