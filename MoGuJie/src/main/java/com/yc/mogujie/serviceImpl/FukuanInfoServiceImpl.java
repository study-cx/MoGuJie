package com.yc.mogujie.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.ActionContext;
import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;
import com.yc.mogujie.mapper.FuKuanInfoMapper;
import com.yc.mogujie.service.FukuanInfoService;
@Service("fukuanInfoService")
public class FukuanInfoServiceImpl implements FukuanInfoService {
	
	@Autowired
	private FuKuanInfoMapper fuKuanInfoMapper;
	@Override
	public int selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean) {
		String prophoto=fuKuanInfoMapper.selectFuKuanInfo(fuKuanInfoBean);
		fuKuanInfoBean.setProphoto(prophoto);
		List<FuKuanInfoBean> fu=new ArrayList<FuKuanInfoBean>();
		fu.add(fuKuanInfoBean);
		ActionContext.getContext().getSession().put("fuKuanInfoBean", fu);
		System.out.println(fuKuanInfoBean);
		return 1;
		
	}
	@Override
	public Address selectMorenAddess(int usid) {
		
		return fuKuanInfoMapper.selectMorenAddress(usid);
	}
	

}
