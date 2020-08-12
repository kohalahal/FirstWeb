package com.hal.dao;

import com.hal.dao.UserDao;

public class Test {
	public static void main(String[] args) {
		UserDao dao = (UserDao) UserDao.getInstance();
		System.out.println(dao.selectAll().toString());
	}
}
