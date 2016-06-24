package com.yc.mogujie.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionContext;
import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.mapper.FuKuanInfoMapper;
import com.yc.mogujie.service.FukuanInfoService;
@Service("fukuanInfoService")
public class FukuanInfoServiceImpl implements FukuanInfoService {
	private int totalnumber = 0;
	private int totalprice = 0;
	private List<FuKuanInfoBean> fukuanInfo=new ArrayList<FuKuanInfoBean>();
	
	@Autowired
	private FuKuanInfoMapper fuKuanInfoMapper;
	@Override
	public int selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean) {
		String prophoto=fuKuanInfoMapper.selectFuKuanInfo(fuKuanInfoBean);
		fuKuanInfoBean.setProphoto(prophoto);
		fuKuanInfoBean.setTotalnumber(fuKuanInfoBean.getNumber());
		fuKuanInfoBean.setTotalprice(fuKuanInfoBean.getNumber()*fuKuanInfoBean.getPrice());
		int deid=fuKuanInfoMapper.selectDeidBysizeColor(fuKuanInfoBean);
		fuKuanInfoBean.setDeid(deid);
		List<FuKuanInfoBean> fu=new ArrayList<FuKuanInfoBean>();
		fu.add(fuKuanInfoBean);
		ActionContext.getContext().getSession().put("fuKuanInfoBean", fu);
		//System.out.println(fuKuanInfoBean);
		return 1;
		
	}
	
	@Override
	public Address selectMorenAddess(int usid) {
		return fuKuanInfoMapper.selectMorenAddress(usid);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int adduserOrder(FuKuanInfoBean fuKuanInfoBean) {
		return fuKuanInfoMapper.adduserOrder(fuKuanInfoBean);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int addorderdetail(FuKuanInfoBean fuKuanInfoBean) {
		return fuKuanInfoMapper.addorderdetail(fuKuanInfoBean);
	}
	@Override
	public int updateOrderStatus(FuKuanInfoBean fuKuanInfoBean) {
		return fuKuanInfoMapper.updateOrderStatus(fuKuanInfoBean);
	}
	@Override
	public int saveCartInfos(int cid) {
		FuKuanInfoBean cart=fuKuanInfoMapper.findInfo(cid);
		String prophoto=fuKuanInfoMapper.selectFuKuanInfo(cart);
		cart.setProphoto(prophoto);
		fukuanInfo.add(cart);
		
		for(int i=0;i<fukuanInfo.size();i++){
			totalnumber+=fukuanInfo.get(i).getNumber();
			totalprice+=fukuanInfo.get(i).getNumber()*fukuanInfo.get(i).getPrice();
		}
		for(int i=0;i<fukuanInfo.size();i++){
			fukuanInfo.get(i).setTotalnumber(totalnumber);
			fukuanInfo.get(i).setTotalprice(totalprice);
		}
		totalnumber = 0;
		totalprice = 0;
		ActionContext.getContext().getSession().put("fuKuanInfoBean",fukuanInfo);
		return 1;
	}
	@Override
	public void deleteInfos() {
		ActionContext.getContext().getSession().remove("fuKuanInfoBean");
		totalnumber = 0;
		totalprice = 0;
		fukuanInfo.clear();
	}
	@Override
	public int updateProductValue(int proid) {
		return fuKuanInfoMapper.updateProductValue(proid);
	}
	@Override
	public int updateDetailValue(int deid) {
		return fuKuanInfoMapper.updateDeidValue(deid);
	}
	@Override
	public int updateUserYuE(UserInfo user) {
		return fuKuanInfoMapper.updateUserYuE(user);
	}

}
