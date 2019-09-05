package com.qhrc.exam.service;

import com.qhrc.exam.domain.User;

public interface UserService {
	public User getUserById(Integer id);
	public User getUserByAcctName(String acctName);
}
