package com.hal.dao;

import java.util.Calendar;
import java.util.Date;

public class User {
	final static java.text.SimpleDateFormat sqlDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");

	private String userid;
	private String pwd;
	private String name;
	private String email;
	private Date indate;
	private Date update;
	
	public User() {
		super();
		this.userid = "";
		this.pwd = "";
		this.name = "";
		this.email = "";
		this.indate = removeTime(new Date());
		this.update = indate;
	}
	
	public User(String userid, String pwd, String name, String email, Date indate, Date update) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.indate = removeTime(indate);
		this.update = removeTime(update);
	}
	public User(String userid, String pwd, String name, String email, Date indate) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.indate = removeTime(indate);
		this.update = removeTime(indate);
	}
	public User(String userid, String pwd, String name, String email) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.indate = removeTime(new Date());
		this.update = removeTime(indate);
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	@Override
	public String toString() {
		return "('" + userid + "', '" + pwd + "', '" + name + "', '" + email
				+ "', '" + sqlDateFormat.format(indate) + "', '" + sqlDateFormat.format(update) + "')";
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		User compare = (User)obj;
		System.out.println(toString());
		System.out.println(compare.toString());
		if(userid.equals(compare.getUserid()) && pwd.equals(compare.getPwd()) && name.equals(compare.getName()) 
				&& email.equals(compare.getEmail()) && indate.equals(compare.getIndate()) && update.equals(compare.getUpdate())) {
			return true;
		}
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return userid.hashCode();
	}	
    private static Date removeTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
}
