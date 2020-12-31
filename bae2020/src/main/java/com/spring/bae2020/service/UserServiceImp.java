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
	public UserVo findUserByMid(String mid) {
		return userDao.findUserByMid(mid);
	}

	@Override
	public void insertUser(UserVo vo) {
		userDao.insertUser(vo);
		
	}
}
