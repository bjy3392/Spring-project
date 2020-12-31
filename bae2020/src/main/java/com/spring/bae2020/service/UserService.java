package com.spring.bae2020.service;

import com.spring.bae2020.vo.UserVo;

public interface UserService {

	UserVo findUserByMid(String mid);

	void insertUser(UserVo vo);

}
