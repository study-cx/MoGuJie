package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.FeedBackBean;

public interface FeedBackService {
	int addpl(FeedBackBean feedback);
	
	int updatepingjia(int ostatus);
	
	List<FeedBackBean> selectOrid();
}
