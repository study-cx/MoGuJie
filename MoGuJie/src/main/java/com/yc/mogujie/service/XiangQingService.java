package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.Detail;
import com.yc.mogujie.entity.FeedBackBeanS;
import com.yc.mogujie.entity.Product;

public interface XiangQingService {

	List<Product> SelectProductByProid(int proid);

	List<Detail> SelectPsizeByProid(int proid);

	List<Detail> SelectColorByProid(int proid);

	String SelectNumberBySizeAndColor(Detail detail);

	List<FeedBackBeanS> SelectFeedBack(int proid);

}
