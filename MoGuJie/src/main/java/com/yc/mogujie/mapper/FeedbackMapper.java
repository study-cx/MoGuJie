package com.yc.mogujie.mapper;

import com.yc.mogujie.entity.Feedback;
import java.math.BigDecimal;

public interface FeedbackMapper {
    int deleteByPrimaryKey(BigDecimal fid);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(BigDecimal fid);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKeyWithBLOBs(Feedback record);

    int updateByPrimaryKey(Feedback record);
}