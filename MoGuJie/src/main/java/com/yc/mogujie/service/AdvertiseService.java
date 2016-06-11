package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Advertise;

public interface AdvertiseService {
	public List<Advertise> find(Integer pageNo,Integer pageSize);//分页查询
	int addAdvertise(Advertise advertise);//添加
	int updateAdvertise(Advertise advertise);//修改
	int delAdvertise(String aid);//删除
	List<Advertise> finds();
}
