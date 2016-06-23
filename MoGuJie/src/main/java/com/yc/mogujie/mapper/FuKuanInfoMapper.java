package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;
import com.yc.mogujie.entity.UserInfo;

public interface FuKuanInfoMapper {

	String selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean);

	Address selectMorenAddress(int usid);

	int adduserOrder(FuKuanInfoBean fuKuanInfoBean);

	int addorderdetail(FuKuanInfoBean fuKuanInfoBean);

	int selectDeidBysizeColor(FuKuanInfoBean fuKuanInfoBean);

	int updateOrderStatus(FuKuanInfoBean fuKuanInfoBean);
	
	FuKuanInfoBean findInfo(int cid);

	int updateProductValue(int proid);

	int updateDeidValue(int deid);

	int updateUserYuE(UserInfo user);

}
