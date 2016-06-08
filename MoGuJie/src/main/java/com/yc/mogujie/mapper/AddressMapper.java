package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Address;

import java.math.BigDecimal;
import java.util.List;

public interface AddressMapper {

	int insertAddr(Address address);

	List<Address> findAddr();

	int updateAddr(Address address);

	Address getAddressById(int addressid);

	int deleteAddr(int addressid);

	int setMoren(int addressid);

}