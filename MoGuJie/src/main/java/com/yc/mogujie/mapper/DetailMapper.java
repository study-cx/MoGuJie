package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Detail;
import java.math.BigDecimal;

public interface DetailMapper {
    int deleteByPrimaryKey(BigDecimal deid);

    int insert(Detail record);

    int insertSelective(Detail record);

    Detail selectByPrimaryKey(BigDecimal deid);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKey(Detail record);
}