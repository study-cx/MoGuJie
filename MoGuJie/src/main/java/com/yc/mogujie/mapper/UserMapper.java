package com.yc.mogujie.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.yc.mogujie.entity.UserBean;

@Repository("userMapper")
public interface UserMapper {

	List<UserBean> findBasicInfo(String uname);
	
}
