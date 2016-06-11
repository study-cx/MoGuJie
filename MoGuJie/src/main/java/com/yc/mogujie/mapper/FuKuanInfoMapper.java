package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.Cart;
import com.yc.mogujie.entity.FuKuanInfoBean;

public interface FuKuanInfoMapper {


	String selectFuKuanInfo(FuKuanInfoBean fuKuanInfoBean);

	Address selectMorenAddress(int usid);

	FuKuanInfoBean findInfo(int cid);

}
