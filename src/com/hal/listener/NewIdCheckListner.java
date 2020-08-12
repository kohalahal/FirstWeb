package com.hal.listener;

import com.hal.dao.Dao;
import com.hal.dao.User;
import com.hal.dao.UserDao;

public class NewIdCheckListner implements EventListener<User> {
	Dao userDao = UserDao.getInstance();
	
	@Override
	public boolean exists(String userid) {
		if(userDao.selectData(userid)==null) {
			return false;
		} 
		return true;
	}

	@Override
	public User selectData(String userid) {
		return (User) userDao.selectData(userid);
	}

}
