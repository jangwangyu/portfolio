package com.portfolio.Service;

import java.sql.Date;
import java.util.List;

import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

public interface MemberService {
	
	public void register(MemberVO memberVO)throws Exception;
	
	/* public int idCnt(MemberVO memberVO)throws Exception; */
	public boolean selectId(String id); //중복 Id 검색

	public MemberVO login(LoginVO loginVO) throws Exception;
	
	public void keepLogin(String member_id, String session_id, Date session_limit) throws Exception;
	
	public MemberVO checkLoginBefore(String value)throws Exception;
	
	//아이디찾기
	public List<MemberVO> findId(String email) throws Exception;
	public int findIdCheck(String email)throws Exception;
	
	//비밀번호 찾기
	public void findPw(String email,String member_id)throws Exception;
	public int findPwCheck(MemberVO memberVO)throws Exception;
	
	// 이메일인증
	public void memberAuth(String email)throws Exception;
	
	// 정보 조회
	public MemberVO viewMember(String member_id)throws Exception;
	// 정보수정
	public void updateMember(MemberVO memberVO)throws Exception;
}
