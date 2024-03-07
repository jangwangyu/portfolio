package com.portfolio.VO;

import java.util.Date;

public class NoticeBoardVO {
	/*	
	 create table notice_board(
		bno number not null,
		title varchar2(200) not null,
		content varchar2(4000),
		writer varchar(50) not null,
		regdate date default sysdate,
		viewcnt number default 0,
		primary key(bno)
		); 
	 */
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}
	
	
	
}
