package com.yc.mogujie.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Address;
import com.yc.mogujie.mapper.AddressMapper;
import com.yc.mogujie.service.AddrService;

@Service("addrService")
public class AddressServiceImpl implements AddrService {

	@Autowired
	private AddressMapper addressMapper;
	@Override
	public int addr(Address address) {
		return addressMapper.insertAddr(address);
	}

}
