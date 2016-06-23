package com.yc.mogujie.mapper;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.Categorybean;
import com.yc.mogujie.entity.Categorytwo;


public interface CategorytwoMapper {
	List<Categorytwo> find(Map<String, Object> params);

	List<Categorybean> getCatetwoType(Categorybean category);

	List<Categorybean> getAllProductByType(Categorybean category);

	List<Categorybean> getProductByType(Categorybean category);
}