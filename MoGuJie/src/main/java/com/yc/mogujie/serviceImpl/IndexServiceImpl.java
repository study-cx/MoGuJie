package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Product;
import com.yc.mogujie.mapper.IndexMapper;
import com.yc.mogujie.service.IndexService;
@Service("indexService")
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexMapper indexMapper;

	@Override
	public List<Categoryone> selectCategoryOne() {
		
		return indexMapper.selectCategoryOne();
	}

	@Override
	public List<Categorytwo> selectCategoryTwo() {
		// TODO Auto-generated method stub
		return indexMapper.selectCategoryTwo();
	}

	@Override
	public List<GuangGaoBean> selectGuanGao() {
		
		return indexMapper.selectGuanGao();
	}

	@Override
	public List<Product> selectProductByobligateone() {
		return indexMapper.selectProductByobligateone();
	}

	
}
