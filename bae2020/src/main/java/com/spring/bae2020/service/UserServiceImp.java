package com.spring.bae2020.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.UserDao;
import com.spring.bae2020.vo.UserVo;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public UserVo findUserById(String mid) {
		return userDao.findUserById(mid);
	}

	@Override
	public void insertUser(UserVo vo) {
		userDao.insertUser(vo);
		
	}
}
