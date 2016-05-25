package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Cart;
import java.math.BigDecimal;

public interface CartMapper {
    int deleteByPrimaryKey(BigDecimal cid);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(BigDecimal cid);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}