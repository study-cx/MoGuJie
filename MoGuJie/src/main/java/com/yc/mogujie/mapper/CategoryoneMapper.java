package com.yc.mogujie.mapper;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.Categoryone;


public interface CategoryoneMapper {
	 List<Categoryone> find(Map<String, Object> params);
	 int addTypeone(Categoryone categoryone);
	 int updateTypeone(Categoryone categoryone);//修改
	 int delete(String categoryidone);//删除
	 List<Categoryone> finds(Map<String, Object> params);
	 List<Categoryone> findtypeone();
} 