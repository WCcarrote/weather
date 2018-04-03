package com.xinyue.crud.bean;

public class UserWithBLOBs extends User {
    private String remarks;

    private String saveplaces;

    public String getRemarks() {
        return remarks;
    }

    public UserWithBLOBs() {
		super();
	}

	public UserWithBLOBs(Integer userId, String username, String password, String name,
			String contact, Integer del, String localplace,String remarks, String saveplaces) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.contact = contact;
		this.del = del;
		this.localplace = localplace;
		this.remarks = remarks;
		this.saveplaces = saveplaces;
	}

	public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getSaveplaces() {
        return saveplaces;
    }

    public void setSaveplaces(String saveplaces) {
        this.saveplaces = saveplaces == null ? null : saveplaces.trim();
    }
}