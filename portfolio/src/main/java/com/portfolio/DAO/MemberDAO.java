package com.portfolio.DAO;

import java.sql.Date;
import java.util.List;

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
	
	// 아이디 찾기
	public List<MemberVO> findId(String email) throws Exception;
	
	public int findIdCheck(String email)throws Exception;
	
	// 비밀번호 찾기
	public int findPwCheck(MemberVO memberVO)throws Exception;
	public int findPw(String passwd, String email,String member_id)throws Exception;
	
	// 이메일 인증
	public void createAuthKey(String email,String authKey) throws Exception;
	public void memberAuth(String email)throws Exception;
	
	// 정보조회
	public MemberVO viewMember(String member_id)throws Exception;
	
	// 정보수정
	public void updateMember(MemberVO memberVO)throws Exception;

}