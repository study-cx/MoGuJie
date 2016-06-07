package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Categorybean;

public interface CategorytwoService {

	//根据1级分类的id获取二级分类的类型
	List<Categorybean> getCatetwoType(Categorybean category);

	List<Categorybean> getAllProductByType(Categorybean category);

	List<Categorybean> getProductByType(Categorybean category);
	
}
