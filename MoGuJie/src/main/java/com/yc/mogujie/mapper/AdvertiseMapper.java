package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Advertise;
import java.math.BigDecimal;

public interface AdvertiseMapper {
    int deleteByPrimaryKey(BigDecimal aid);

    int insert(Advertise record);

    int insertSelective(Advertise record);

    Advertise selectByPrimaryKey(BigDecimal aid);

    int updateByPrimaryKeySelective(Advertise record);

    int updateByPrimaryKey(Advertise record);
}