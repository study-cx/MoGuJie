package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Product;

import java.math.BigDecimal;
import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(BigDecimal proid);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(BigDecimal proid);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

	List<Product> findAllProduct();
}