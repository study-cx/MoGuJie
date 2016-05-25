package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Active;
import java.math.BigDecimal;

public interface ActiveMapper {
    int deleteByPrimaryKey(BigDecimal activeid);

    int insert(Active record);

    int insertSelective(Active record);

    Active selectByPrimaryKey(BigDecimal activeid);

    int updateByPrimaryKeySelective(Active record);

    int updateByPrimaryKey(Active record);
}