package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Detail;
import com.yc.mogujie.entity.FeedBackBeanS;
import com.yc.mogujie.entity.Product;
import com.yc.mogujie.mapper.DetailMapper;
import com.yc.mogujie.service.XiangQingService;
@Service("xiangQingService")
public class XiangQingServiceImpl implements XiangQingService{
	@Autowired
	private DetailMapper detailMapper;

	@Override
	public List<Product> SelectProductByProid(int proid) {
		
		return detailMapper.SelectProductByProid(proid);
	}


	@Override
	public List<Detail> SelectPsizeByProid(int proid) {
		return detailMapper.SelectPsizeByProid(proid);
	}

	@Override
	public List<Detail> SelectColorByProid(int proid) {
		return detailMapper.SelectColorByProid(proid);
	}


	@Override
	public String SelectNumberBySizeAndColor(Detail detail) {
		return detailMapper.SelectNumberBySizeAndColor(detail);
	}


	@Override
	public List<FeedBackBeanS> SelectFeedBack(int proid) {
		return detailMapper.selectFeedBack(proid);
	}
	
}
