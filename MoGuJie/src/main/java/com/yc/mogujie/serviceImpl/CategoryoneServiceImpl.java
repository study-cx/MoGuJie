package com.yc.mogujie.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.mapper.CategoryoneMapper;
import com.yc.mogujie.service.CategoryoneService;

@Service("categoryoneService")
public class CategoryoneServiceImpl implements CategoryoneService {
	@Autowired
	private CategoryoneMapper categoryoneMapper;
	
	@Override
	public List<Categoryone> find(Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return categoryoneMapper.find(params);
	}

	@Override
	public int addTypeone(Categoryone categoryone) {
		return categoryoneMapper.addTypeone(categoryone);
	}

	@Override
	public int updateTypeone(Categoryone categoryone) {
		return categoryoneMapper.updateTypeone(categoryone);
	}

	@Override
	public int delete(String categoryidone) {
		int result = 0;
		if(categoryidone.contains(",") && categoryidone.indexOf("or")<=0){
			String[] a=categoryidone.split(",");
			for(String s:a){
				result += categoryoneMapper.delete(s);
			}
		}else{
			result = categoryoneMapper.delete(categoryidone);
		}
		return result;
	}

	@Override
	public List<Categoryone> finds(String categorytypeone, int categoryidone,Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("categorytypeone", categorytypeone);
		params.put("categoryidone", categoryidone);
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return categoryoneMapper.finds(params);
	}

	@Override
	public List<Categoryone> findtypeone() {
		return categoryoneMapper.findtypeone();
	}


}
