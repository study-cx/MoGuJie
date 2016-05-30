package com.yc.mogujie.service;

import java.util.List;

import com.yc.mogujie.entity.Address;

public interface AddrService {
	int  addr(Address address); //添加地址
	
	List<Address> findAddr(); //查找所有的地址信息
	
	Address findAddressById(int addressid); //根据地址id查地址信息
	
	int update(Address address);//修改地址
	
	int delete(int addressid); //删除
	
	int moren(int addressid); //设为默认地址：0表示默认地址
}
