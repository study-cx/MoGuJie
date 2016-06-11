package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.Detail;
import com.yc.mogujie.entity.FeedbackBean;
import com.yc.mogujie.entity.Product;

public interface XiangQingService {

	List<Product> SelectProductByProid(int proid);

	List<Detail> SelectPsizeByProid(int proid);

	List<Detail> SelectColorByProid(int proid);

	String SelectNumberBySizeAndColor(Detail detail);

	List<FeedbackBean> SelectFeedBack(int proid);

}
