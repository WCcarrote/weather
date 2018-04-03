package com.xinyue.crud.bean;

public class login {
	private String username;
	
	private String password;

	public login(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public login() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
