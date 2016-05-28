package com.yc.mogujie.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Admin;
import com.yc.mogujie.mapper.AdminMapper;
import com.yc.mogujie.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public Admin login(Admin admin) {
		return adminMapper.getAdminByAdmin(admin);
	}

}
