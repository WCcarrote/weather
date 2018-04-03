package com.xinyue.crud.bean;

public class User {
    public Integer userId;

    protected String username;

    protected String password;

    protected String name;

    protected String contact;

    protected Integer del;

    protected String localplace;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public User() {
		super();
	}

	public User(Integer userId, String username, String password, String name,
			String contact, Integer del, String localplace) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.contact = contact;
		this.del = del;
		this.localplace = localplace;
	}

	public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public Integer getDel() {
        return del;
    }

    public void setDel(Integer del) {
        this.del = del;
    }

    public String getLocalplace() {
        return localplace;
    }

    public void setLocalplace(String localplace) {
        this.localplace = localplace == null ? null : localplace.trim();
    }
}