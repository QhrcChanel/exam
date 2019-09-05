package com.qhrc.exam.domain;

import java.io.Serializable;

public class User implements Serializable {
    private Integer userId;
    private String userName;
    private String password;

    private static final long serialVersionUID = 1L;
    
    public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}