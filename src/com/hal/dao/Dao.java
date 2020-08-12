package com.hal.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class Dao<T> {	
	

	public Connection conn;

	protected boolean autoCommit = true;

	protected Dao() {
		this(null);
	}
	
	protected Dao(Connection conn) {
		getConn(conn);
	}
	
	/* 상속시 오버라이드, 똑같이 써서 메소드 가리기 필수 */
	public static Dao getInstance() {
		return null;
	}
	
	public abstract int insertData(T t);
	public abstract int updateData(T t);
	public abstract T deleteData(T t);
	public abstract T deleteData(String primaryKey);
	public abstract T selectData(T t);
	public abstract T selectData(String primaryKey);
	public abstract List<T> deleteAll();
	public abstract List<T> selectAll();
	
	public abstract String getTableName();
	public abstract void setTableName(String tableName);

	void getConn() {
		getConn(null, autoCommit);
	}
	
	void getConn(Connection conn) {
		getConn(conn, autoCommit);
	}
	
	void getConn(Connection conn, boolean autoCommit) {
		if(conn==null) {
			try {
				this.conn = ConnectionFactory.getConn();
				System.out.println("NewConnection");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			this.conn = conn;
		}
		setAutoCommit(autoCommit);
	}
	
	void setAutoCommit(boolean autoCommit) {
		if(conn!=null) {
			try {
				conn.setAutoCommit(autoCommit);
				this.autoCommit = autoCommit;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	boolean getAutoCommit() {
		return Boolean.valueOf(autoCommit);
	}
	
	void rollback() {
		if(conn!=null) {
			try {
				System.out.println("rollback");
				conn.rollback();
			} catch(SQLException e){
			   
			}
		}
	}
	
	void commit() {
		if(conn!=null) {
			try {
				System.out.println("commit");
				conn.commit();
			} catch(SQLException e){
			   
			}
		}
	}
	 
	void close(AutoCloseable... acs)  {
		for(AutoCloseable a:acs) {
			if (a != null)
				try {
					a.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
		}
	}
	
}
