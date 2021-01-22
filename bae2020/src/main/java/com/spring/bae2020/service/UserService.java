package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.AskManagerVo;
import com.spring.bae2020.vo.UserVo;

public interface UserService {

	UserVo findUserByMid(String mid);

	void insertUser(UserVo vo);

	void insertAskManager(AskManagerVo vo);

	void updateUserByLevel(String mid, String level);

	List<UserVo> findUserByLevel(String level);

	List<UserVo> findUserByName(String name);

	List<AskManagerVo> findAskManagerByMid(String mid);

	void updateUser(UserVo vo);

	void deleteUser(String mid);

	void insertDeleteUser(String reason, String message);

}
