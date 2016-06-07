package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.FuKuanInfoBean;

public interface FuKuanInfoMapper {


	String selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean);

	Address selectMorenAddress(int usid);

}
