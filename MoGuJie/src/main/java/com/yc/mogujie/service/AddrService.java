package com.yc.mogujie.service;

import java.util.List;
import java.util.Map;

import com.yc.mogujie.entity.Address;

public interface AddrService {
	int  addr(Address address); //添加地址
	
	List<Address> findAddr(); //查找所有的地址信息
	
	Address findAddressById(int addressid); //根据地址id查地址信息
	
	int update(Address address);//修改地址
	
	int delete(int addressid); //删除
	
	List<Address> selectAllAddressid();//查所有的地址id
	
	int moren(int addressid); //设为默认地址：将statue改为0
	
	int updatemoren(int addressid);//当设置另一个地址为默认地址时，将statue为0的地址改为1
}
