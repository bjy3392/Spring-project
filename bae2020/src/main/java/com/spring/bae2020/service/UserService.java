package com.spring.bae2020.service;

import com.spring.bae2020.vo.UserVo;

public interface UserService {

	UserVo findUserById(String mid);

	void insertUser(UserVo vo);

}
