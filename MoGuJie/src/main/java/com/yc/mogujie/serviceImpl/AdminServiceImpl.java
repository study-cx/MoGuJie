package com.yc.mogujie.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return adminMapper.adminLogin(admin);
	}
	@Override
	public int addAdminInfo(Admin admin) {
		return adminMapper.addAdminInfo(admin);
	}
	@Override
	public Admin findByName(String aname) {
		return adminMapper.findByName(aname);
	}
	@Override
	public Admin findByEmail(String aemail) {
		return adminMapper.findByEmail(aemail);
	}
	@Override
	public List<Admin> find(Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return adminMapper.find(params);
	}
	@Override
	public int total() {
		return adminMapper.total();
	}
	@Override
	public int del(String aid) {
		int result = 0;
		if(aid.contains(",") && aid.indexOf("or")<=0){//说明同时删除多个
			String[] a=aid.split(",");
			for(String s:a){
				result += adminMapper.del(s);
			}
		}else{
			result = adminMapper.del(aid);
		}
		return result;
		
	}

}
