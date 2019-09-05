package com.qhrc.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhrc.exam.dao.IUserDao;
import com.qhrc.exam.domain.User;
import com.qhrc.exam.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
    IUserDao userDao;
	
	@Override
	public User getUserById(Integer userId) {
		return userDao.selectById(userId);
	}

	@Override
	public User getUserByAcctName(String userName) {
		return userDao.selectByAcctName(userName); 
	}
}
