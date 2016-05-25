package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Guanggao;
import java.math.BigDecimal;

public interface GuanggaoMapper {
    int deleteByPrimaryKey(BigDecimal gid);

    int insert(Guanggao record);

    int insertSelective(Guanggao record);

    Guanggao selectByPrimaryKey(BigDecimal gid);

    int updateByPrimaryKeySelective(Guanggao record);

    int updateByPrimaryKey(Guanggao record);
}