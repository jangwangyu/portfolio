package com.portfolio.VO;

import java.util.Date;

public class CartVO {
	/*
	create table cart(
    cartNum number not null,
    member_id varchar(50) not null,
    gdsNum number not null,
    cartStock number not null,
    addDate date default sysdate,
    primary key(cartNum, member_id)
	);
	 */
	
	private int cartNum;
	private String member_id;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
}
