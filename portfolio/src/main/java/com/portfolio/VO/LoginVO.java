package com.portfolio.VO;

public class LoginVO {
	private String member_id;
	private String passwd;
	private boolean useCookie;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginVO [member_id=" + member_id + ", passwd=" + passwd + ", useCookie=" + useCookie + "]";
	}
	
	
	
}
