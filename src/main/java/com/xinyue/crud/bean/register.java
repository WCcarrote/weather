package com.xinyue.crud.bean;

public class register {

	private String username;
	
	private String password;
	
	private String contact;

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

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public register(String username, String password, String contact) {
		super();
		this.username = username;
		this.password = password;
		this.contact = contact;
	}

	public register() {
		super();
	}
}
