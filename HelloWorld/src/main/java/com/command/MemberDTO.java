package com.command;

public class MemberDTO {
	private String name;
	private String id;
	private String pw;
	private String email;
	private String phone;
	private String status;
	private String user_permission;

	public MemberDTO(String name, String id, String pw, String email, String phone, String status,
			String user_permission) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.user_permission = user_permission;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUser_permission() {
		return user_permission;
	}

	public void setUser_permission(String user_permission) {
		this.user_permission = user_permission;
	}
}
