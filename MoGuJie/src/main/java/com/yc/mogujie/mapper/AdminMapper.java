package com.yc.mogujie.mapper;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.Admin;

public interface AdminMapper {
	Admin getAdminByAdmin(Admin admin);

	Admin adminLogin(Admin admin);

	int addAdminInfo(Admin admin);

	Admin findByName(String aname);

	Admin findByEmail(String aemail);

	List<Admin> find(Map<String, Object> params);

	int total();

	int del(String s);
}