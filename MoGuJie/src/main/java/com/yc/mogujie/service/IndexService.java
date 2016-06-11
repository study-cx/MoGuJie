package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.entity.Categorytwo;
import com.yc.mogujie.entity.GuangGaoBean;
import com.yc.mogujie.entity.Product;

public interface IndexService {

	List<Categoryone> selectCategoryOne();

	List<Categorytwo> selectCategoryTwo();

	List<GuangGaoBean> selectGuanGao();

	List<Product> selectProductByobligateone();
	List<Product> selectRenqiNvxie();

}
