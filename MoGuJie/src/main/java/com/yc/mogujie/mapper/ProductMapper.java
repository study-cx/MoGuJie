package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Product;
import java.math.BigDecimal;

public interface ProductMapper {
    int deleteByPrimaryKey(BigDecimal proid);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(BigDecimal proid);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}