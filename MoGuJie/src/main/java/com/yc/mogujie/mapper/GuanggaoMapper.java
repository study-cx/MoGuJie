package com.yc.mogujie.mapper;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.Guanggao;


public interface GuanggaoMapper {
	public List<Guanggao> find(Map<String, Object> params);//分页查询
}