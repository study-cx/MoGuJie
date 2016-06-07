package com.yc.mogujie.service;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;

public interface FukuanInfoService {

	int selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean);

	Address selectMorenAddess(int usid);

}
