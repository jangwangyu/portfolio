package com.portfolio.Service;

import java.sql.Date;

import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

public interface MemberService {
	
	public void register(MemberVO memberVO)throws Exception;
	
	/* public int idCnt(MemberVO memberVO)throws Exception; */
	public boolean selectId(String id); //중복 Id 검색

	public MemberVO login(LoginVO loginVO) throws Exception;
	
	public void keepLogin(String member_id, String session_id, Date session_limit) throws Exception;
	
	public MemberVO checkLoginBefore(String value)throws Exception;
}
