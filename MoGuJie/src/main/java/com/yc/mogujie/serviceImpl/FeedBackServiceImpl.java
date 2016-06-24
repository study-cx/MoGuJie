package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.FeedBackBean;
import com.yc.mogujie.entity.Feedback;
import com.yc.mogujie.mapper.FeedbackMapper;
import com.yc.mogujie.service.FeedBackService;

@Service("feedBackService")
public class FeedBackServiceImpl implements FeedBackService {

	@Autowired
	private FeedbackMapper feedbackMapper;
	@Override
	public int updatepingjia(int ostatus) {
		return feedbackMapper.updateStatus(ostatus);
	}
	@Override
	public int addpl(FeedBackBean feedback) {
		return feedbackMapper.insertpl(feedback);
	}
	@Override
	public List<FeedBackBean> selectOrid() {
		return feedbackMapper.selectOrid();
	}

}
