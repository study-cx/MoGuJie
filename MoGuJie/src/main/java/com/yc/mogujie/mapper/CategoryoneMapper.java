package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Categoryone;
import java.math.BigDecimal;

public interface CategoryoneMapper {
    int deleteByPrimaryKey(BigDecimal categoryidone);

    int insert(Categoryone record);

    int insertSelective(Categoryone record);

    Categoryone selectByPrimaryKey(BigDecimal categoryidone);

    int updateByPrimaryKeySelective(Categoryone record);

    int updateByPrimaryKey(Categoryone record);
}