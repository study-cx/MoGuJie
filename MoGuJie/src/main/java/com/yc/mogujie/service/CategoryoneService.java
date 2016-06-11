package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Categoryone;

public interface CategoryoneService {
	List<Categoryone> find(Integer pageNo, Integer pageSize);//分页查询
	int addTypeone(Categoryone categoryone);//添加
	int updateTypeone(Categoryone categoryone);//修改
	int delete(String categoryidone);//删除
	List<Categoryone> finds(String categorytypeone,int categoryidone,Integer pageNo, Integer pageSize);
	List<Categoryone> findtypeone();
}
