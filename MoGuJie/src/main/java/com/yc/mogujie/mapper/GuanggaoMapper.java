package com.yc.mogujie.mapper;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Guanggao;


public interface GuanggaoMapper {
	List<Guanggao> find(Map<String, Object> params);//分页查询
	GuangGaoBean finds(String gid);
	int addGuangGao(GuangGaoBean guangGaoBean);
}