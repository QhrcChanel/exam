package com.qhrc.exam.dao;

import com.qhrc.exam.domain.User;

public interface IUserDao {

    public User selectById(Integer userId);
    public User selectByAcctName(String acctName);
}