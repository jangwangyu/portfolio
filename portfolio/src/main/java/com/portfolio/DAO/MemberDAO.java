package com.portfolio.DAO;

import java.sql.Date;

import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

public interface MemberDAO {
	
	public void register(MemberVO memberVO) throws Exception;
	
	/* public int idCnt(MemberVO memberVO)throws Exception; */
	public boolean selectId(String id); //중복 Id 검색
	// 로그인
	public MemberVO login(LoginVO loginVO) throws Exception;
	
	// 로그인 유지
	void keepLogin(String member_id, String session_id,Date session_limit)throws Exception;
	
	// 세션키 검증
	MemberVO checkUserWithSessionKey(String value)throws Exception;

}
