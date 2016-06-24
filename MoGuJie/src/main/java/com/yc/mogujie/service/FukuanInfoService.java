package com.yc.mogujie.service;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;
import com.yc.mogujie.entity.UserInfo;

public interface FukuanInfoService {

	int selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean);

	Address selectMorenAddess(int usid);

	int adduserOrder(FuKuanInfoBean fuKuanInfoBean);

	int addorderdetail(FuKuanInfoBean fuKuanInfoBean);

	int updateOrderStatus(FuKuanInfoBean fuKuanInfoBean);

	int saveCartInfos(int cid);

	void deleteInfos();

	int updateProductValue(int proid);

	int updateDetailValue(int deid);

	int updateUserYuE(UserInfo user);

}
