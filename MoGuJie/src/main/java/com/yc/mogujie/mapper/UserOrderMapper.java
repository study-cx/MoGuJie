package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.UserOrder;
import java.math.BigDecimal;

public interface UserOrderMapper {
    int deleteByPrimaryKey(BigDecimal orderid);

    int insert(UserOrder record);

    int insertSelective(UserOrder record);

    UserOrder selectByPrimaryKey(BigDecimal orderid);

    int updateByPrimaryKeySelective(UserOrder record);

    int updateByPrimaryKey(UserOrder record);
}