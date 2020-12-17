package com.spring.bae2020.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.UserVo;

public interface UserDao {

	UserVo findUserById(@Param("mid")String mid);

	void insertUser(@Param("vo")UserVo vo);

}
