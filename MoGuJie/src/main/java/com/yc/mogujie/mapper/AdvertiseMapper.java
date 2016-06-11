package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Advertise;

import java.util.List;
import java.util.Map;

public interface AdvertiseMapper {
	public List<Advertise> find(Map<String ,Object> params);
	int addAdvertise(Advertise advertise);//添加
	int updateAdvertise(Advertise advertise);//修改
	int delAdvertise(String aid);//删除
	List<Advertise> finds();
}