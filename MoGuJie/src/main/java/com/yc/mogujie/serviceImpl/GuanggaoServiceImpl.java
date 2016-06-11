package com.yc.mogujie.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Guanggao;
import com.yc.mogujie.mapper.GuanggaoMapper;
import com.yc.mogujie.service.GuanggaoService;

@Service("guanggaoService")
public class GuanggaoServiceImpl implements GuanggaoService {
	@Autowired
	private GuanggaoMapper guanggaoMapper;

	@Override
	public List<Guanggao> find(Integer pageNo, Integer pageSize) {
		Map<String , Object> params=new HashMap<String , Object> ();
		params.put("pageNo",pageNo*pageSize);
		params.put("pageSize",(pageNo-1)*pageSize);
		return guanggaoMapper.find(params);
	}

	@Override
	public GuangGaoBean finds(String gid) {
		return guanggaoMapper.finds(gid);
	}

	@Override
	public int addGuangGao(GuangGaoBean guangGaoBean) {
		return guanggaoMapper.addGuangGao(guangGaoBean);
	}

}