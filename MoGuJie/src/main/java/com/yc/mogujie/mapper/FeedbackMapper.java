package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.FeedBackBean;
import com.yc.mogujie.entity.Feedback;

import java.math.BigDecimal;
import java.util.List;

public interface FeedbackMapper {
    
	int insertpl(FeedBackBean feedback);

	int updateStatus(int ostatus);

	List<FeedBackBean> selectOrid();
}