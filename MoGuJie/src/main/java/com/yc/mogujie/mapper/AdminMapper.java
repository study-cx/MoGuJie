package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Admin;
import java.math.BigDecimal;

public interface AdminMapper {
    int deleteByPrimaryKey(BigDecimal aid);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(BigDecimal aid);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}