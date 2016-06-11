package com.yc.mogujie.serviceImpl;

import java.util.List;

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
	@Override
	public List<Address> findAddr() {
		return addressMapper.findAddr();
	}
	@Override
	public int update(Address address) {
		return addressMapper.updateAddr(address);
	}
	@Override
	public Address findAddressById(int addressid) {
		return addressMapper.getAddressById(addressid);
	}
	@Override
	public int delete(int addressid) {
		return addressMapper.deleteAddr(addressid);
	}
	@Override
	public int moren(int addressid) {
		return addressMapper.setMoren(addressid);
	}

}
