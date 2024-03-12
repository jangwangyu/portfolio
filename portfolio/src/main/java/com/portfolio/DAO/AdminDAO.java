package com.portfolio.DAO;

import java.util.List;

import com.portfolio.VO.MemberVO;

public interface AdminDAO {
	// 회원목록
	public List<MemberVO> memberList(MemberVO memberVO)throws Exception;
	
	// 회원삭제
	public void memberBan(String member_id)throws Exception;
}
