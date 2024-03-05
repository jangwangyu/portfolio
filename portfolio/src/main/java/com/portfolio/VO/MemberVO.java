package com.portfolio.VO;

public class MemberVO {
	/*
	create table member(
    member_id varchar(100) NOT NULL ,
    passwd varchar(100)NOT NULL,
    name varchar(100)NOT NULL,
    postcode1 varchar(100),
    addr1 varchar(100),
    addr2 varchar(100),
    mobile1 varchar(10),
    mobile2 varchar(10),
    mobile3 varchar(10),
    email varchar(100)NOT NULL,
    is_sex char(1),
    birth_year varchar(100),
    birth_month varchar(100),
    birth_day varchar(100),
    bank_account_owner varchar(100),
    refund_bank_code varchar(100),
    bank_account_no varchar(100),
    primary key(member_id)
	);
	 */
	private String member_id;
	private String passwd;
	private String name;
	private String postcode1;
	private String addr1;
	private String addr2;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	private String email;
	private String is_sex;
	private String birth_year;
	private String birth_month;
	private String birth_day;
	private String bank_account_owner;
	private String refund_bank_code;
	private String bank_account_no;
	private String authKey;
	private int member_auth;

	
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public int getMember_auth() {
		return member_auth;
	}
	public void setMember_auth(int member_auth) {
		this.member_auth = member_auth;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode1() {
		return postcode1;
	}
	public void setPostcode1(String postcode1) {
		this.postcode1 = postcode1;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIs_sex() {
		return is_sex;
	}
	public void setIs_sex(String is_sex) {
		this.is_sex = is_sex;
	}
	public String getBirth_year() {
		return birth_year;
	}
	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}
	public String getBirth_month() {
		return birth_month;
	}
	public void setBirth_month(String birth_month) {
		this.birth_month = birth_month;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public String getBank_account_owner() {
		return bank_account_owner;
	}
	public void setBank_account_owner(String bank_account_owner) {
		this.bank_account_owner = bank_account_owner;
	}
	public String getRefund_bank_code() {
		return refund_bank_code;
	}
	public void setRefund_bank_code(String refund_bank_code) {
		this.refund_bank_code = refund_bank_code;
	}
	public String getBank_account_no() {
		return bank_account_no;
	}
	public void setBank_account_no(String bank_account_no) {
		this.bank_account_no = bank_account_no;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", passwd=" + passwd + ", name=" + name + ", postcode1=" + postcode1
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", mobile1=" + mobile1 + ", mobile2=" + mobile2
				+ ", mobile3=" + mobile3 + ", email=" + email + ", is_sex=" + is_sex + ", birth_year=" + birth_year
				+ ", birth_month=" + birth_month + ", birth_day=" + birth_day + ", bank_account_owner="
				+ bank_account_owner + ", refund_bank_code=" + refund_bank_code + ", bank_account_no=" + bank_account_no
				+ ", authKey=" + authKey + ", member_auth=" + member_auth + "]";
	}

	
	
}
