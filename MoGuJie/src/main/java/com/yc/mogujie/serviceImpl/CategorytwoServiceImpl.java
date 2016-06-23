package com.yc.mogujie.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Categorybean;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.mapper.CategoryoneMapper;
import com.yc.mogujie.mapper.CategorytwoMapper;
import com.yc.mogujie.service.CategorytwoService;

@Service("categorytwoService")
public class CategorytwoServiceImpl implements CategorytwoService {
	
	@Autowired
	private CategorytwoMapper categorytwoMapper;

	@Override
	public List<Categorybean> getCatetwoType(Categorybean category) {
		return categorytwoMapper.getCatetwoType(category);
	}

	@Override
	public List<Categorybean> getAllProductByType(Categorybean category) {
		return categorytwoMapper.getAllProductByType(category);
	}

	@Override
	public List<Categorybean> getProductByType(Categorybean category) {
		return categorytwoMapper.getProductByType(category);
	}
	
	@Override
	public List<Categorytwo> find(Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return categorytwoMapper.find(params);
	}

}