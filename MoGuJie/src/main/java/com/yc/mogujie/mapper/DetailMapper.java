package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Detail;
import com.yc.mogujie.entity.Feedback;
import com.yc.mogujie.entity.FeedbackBean;
import com.yc.mogujie.entity.Product;

import java.math.BigDecimal;
import java.util.List;

public interface DetailMapper {

	List<Product> SelectProductByProid(int proid);

	List<Detail> SelectPsizeByProid(int proid);

	List<Detail> SelectColorByProid(int proid);
	
	String SelectNumberBySizeAndColor(Detail detail);

	List<FeedbackBean> selectFeedBack(int proid);

	


}
