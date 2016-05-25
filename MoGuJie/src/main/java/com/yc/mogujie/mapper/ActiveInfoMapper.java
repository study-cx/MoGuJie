package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.ActiveInfo;
import java.math.BigDecimal;

public interface ActiveInfoMapper {
    int deleteByPrimaryKey(BigDecimal activeinfo);

    int insert(ActiveInfo record);

    int insertSelective(ActiveInfo record);

    ActiveInfo selectByPrimaryKey(BigDecimal activeinfo);

    int updateByPrimaryKeySelective(ActiveInfo record);

    int updateByPrimaryKey(ActiveInfo record);
}