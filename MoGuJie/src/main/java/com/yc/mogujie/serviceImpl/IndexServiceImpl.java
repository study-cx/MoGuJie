package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Categorybean;
import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.entity.Categorytwos;
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
	@Override
	public List<Product> selectRenqiNvxie() {
		
		return indexMapper.selectRenqiNvxie();
	}

	@Override
	public List<Categorybean> selectProductByCateOne(String souSuoContent) {
		
		return indexMapper.selectProductByCateOne(souSuoContent);
	}

	@Override
	public List<Categorybean> selectProductByCateTwo(String souSuoContent) {
		// TODO Auto-generated method stub
		return indexMapper.selectProductByCateTwo(souSuoContent);
	}

	@Override
	public List<Categorybean> selectProductByCateThree(String souSuoContent) {
		// TODO Auto-generated method stub
		return indexMapper.selectProductByCateThree(souSuoContent);
	}

	@Override
	public List<Categorybean> selectProductByProname(String souSuoContent) {
		// TODO Auto-generated method stub
		return indexMapper.selectProductByProname(souSuoContent);
	}

	@Override
	public List<Categorybean> selectProductByProContent(String souSuoContent) {
		// TODO Auto-generated method stub
		return indexMapper.selectProductByProContent(souSuoContent);
	}

	@Override
	public List<Categorytwos> selectCateTwoByIdOne(String categoryidone) {
		
		return indexMapper.selectCateTwoByIdOne(categoryidone);
	}

	
}
