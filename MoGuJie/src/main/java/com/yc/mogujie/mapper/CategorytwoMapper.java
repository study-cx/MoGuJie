package com.yc.mogujie.mapper;

import java.util.List;

import com.yc.mogujie.entity.Categorybean;

public interface CategorytwoMapper {
	//根据1级分类的id获取二级分类的类型
	List<Categorybean> getCatetwoType(Categorybean categorytwo);

	//根据一级分类查询所有商品
	List<Categorybean> getAllProductByType(Categorybean category);

	//根据二级分类，分类查询
	List<Categorybean> getProductByType(Categorybean category);
    
}