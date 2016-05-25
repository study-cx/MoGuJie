package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Address;
import java.math.BigDecimal;

public interface AddressMapper {
    int deleteByPrimaryKey(BigDecimal addressid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(BigDecimal addressid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}