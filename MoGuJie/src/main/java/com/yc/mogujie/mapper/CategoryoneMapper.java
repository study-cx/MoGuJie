package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Categoryone;
import com.yc.mogujie.entity.Categorytwo;

import java.math.BigDecimal;
import java.util.List;

public interface CategoryoneMapper {
    int deleteByPrimaryKey(BigDecimal categoryidone);

    int insert(Categoryone record);

    int insertSelective(Categoryone record);

    Categoryone selectByPrimaryKey(BigDecimal categoryidone);

    int updateByPrimaryKeySelective(Categoryone record);

    int updateByPrimaryKey(Categoryone record);

}