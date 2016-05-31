package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Admin;

public interface AdminService {
	Admin login(Admin admin);

	public List<Admin> find(Integer pageNo,Integer pageSize);
	int total();
	int addAdminInfo(Admin admin);
	Admin findByName(String aname);
	Admin findByEmail(String aemail);
	int del(String aid);
}
