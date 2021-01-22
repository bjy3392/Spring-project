package com.spring.bae2020.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.UserDao;
import com.spring.bae2020.vo.AskManagerVo;
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

	@Override
	public void insertAskManager(AskManagerVo vo) {
		userDao.insertAskManager(vo);		
	}

	@Override
	public void updateUserByLevel(String mid, String level) {
		userDao.updateUserByLevel(mid, level);
	}

	@Override
	public List<UserVo> findUserByLevel(String level) {
		return userDao.findUserByLevel(level);
	}

	@Override
	public List<UserVo> findUserByName(String name) {
		return userDao.findUserByName(name);
	}

	@Override
	public List<AskManagerVo> findAskManagerByMid(String mid) {
		return userDao.findAskManagerByMid(mid);
	}

	@Override
	public void updateUser(UserVo vo) {
		userDao.updateUser(vo);		
	}

	@Override
	public void deleteUser(String mid) {
		userDao.deleteUser(mid);		
	}

	@Override
	public void insertDeleteUser(String reason, String message) {
		userDao.insertDeleteUser(reason,message);			
	}
}
