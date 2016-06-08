package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Categorytwo;

public interface CategorytwoService {
	List<Categorytwo> find(Integer pageNo, Integer pageSize);
}
