package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Guanggao;


public interface GuanggaoService {
	List<Guanggao> find(Integer pageNo, Integer pageSize);//分页查询
	GuangGaoBean finds(String gid);
	int addGuangGao(GuangGaoBean guangGaoBean);
}
