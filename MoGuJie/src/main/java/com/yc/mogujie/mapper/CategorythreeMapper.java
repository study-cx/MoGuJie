package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Categorythree;
import java.math.BigDecimal;

public interface CategorythreeMapper {
    int deleteByPrimaryKey(BigDecimal categoryidthree);

    int insert(Categorythree record);

    int insertSelective(Categorythree record);

    Categorythree selectByPrimaryKey(BigDecimal categoryidthree);

    int updateByPrimaryKeySelective(Categorythree record);

    int updateByPrimaryKey(Categorythree record);
}