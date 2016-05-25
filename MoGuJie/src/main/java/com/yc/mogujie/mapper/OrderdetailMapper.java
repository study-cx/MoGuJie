package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Orderdetail;
import java.math.BigDecimal;

public interface OrderdetailMapper {
    int deleteByPrimaryKey(BigDecimal orid);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    Orderdetail selectByPrimaryKey(BigDecimal orid);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
}