package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.AskManagerVo;
import com.spring.bae2020.vo.UserVo;

public interface UserDao {

	UserVo findUserByMid(@Param("mid")String mid);

	void insertUser(@Param("vo")UserVo vo);

	void insertAskManager(@Param("vo")AskManagerVo vo);

	void updateUserByLevel(@Param("mid")String mid, @Param("level")String level);

	List<UserVo> findUserByLevel(@Param("level")String level);

	List<UserVo> findUserByName(@Param("name")String name);

	List<AskManagerVo> findAskManagerByMid(@Param("mid")String mid);

	void updateUser(@Param("vo")UserVo vo);

	void deleteUser(@Param("mid")String mid);

	void insertDeleteUser(@Param("reason")String reason, @Param("message")String message);

}
