package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.UserInfo;
import java.math.BigDecimal;

public interface UserInfoMapper {
    int deleteByPrimaryKey(BigDecimal usid);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(BigDecimal usid);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}