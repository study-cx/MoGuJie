package com.yc.mogujie.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Advertise;
import com.yc.mogujie.mapper.AdvertiseMapper;
import com.yc.mogujie.service.AdvertiseService;
@Service("advertiseService")
	      
public class AdvertiseServiceImpl implements AdvertiseService {
	@Autowired
	private AdvertiseMapper advertiseMapper;
	
	@Override
	public List<Advertise> find(Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return advertiseMapper.find(params);
	}

	@Override
	public int addAdvertise(Advertise advertise) {
		return advertiseMapper.addAdvertise(advertise);
	}

	@Override
	public int updateAdvertise(Advertise advertise) {
		return advertiseMapper.updateAdvertise(advertise);
	}

	@Override
	public int delAdvertise(String aid) {
		int result = 0;
		if(aid.contains(",") && aid.indexOf("or")<=0){
			String[] a=aid.split(",");
			for(String s:a){
				result += advertiseMapper.delAdvertise(s);
			}
		}else{
			result = advertiseMapper.delAdvertise(aid);
		}
		return result;
	}

	@Override
	public List<Advertise> finds() {
		return advertiseMapper.finds();
	}

}
