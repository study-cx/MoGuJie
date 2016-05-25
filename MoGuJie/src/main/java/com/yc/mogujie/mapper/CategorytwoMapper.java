package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Categorytwo;
import java.math.BigDecimal;

public interface CategorytwoMapper {
    int deleteByPrimaryKey(BigDecimal categoryidtwo);

    int insert(Categorytwo record);

    int insertSelective(Categorytwo record);

    Categorytwo selectByPrimaryKey(BigDecimal categoryidtwo);

    int updateByPrimaryKeySelective(Categorytwo record);

    int updateByPrimaryKey(Categorytwo record);
}