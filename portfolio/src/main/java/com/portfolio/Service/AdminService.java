package com.portfolio.Service;

import java.util.List;

import com.portfolio.VO.MemberVO;

public interface AdminService {
	// 회원목록
	public List<MemberVO> memberList(MemberVO memberVO)throws Exception;
	
	// 삭제
	public void memberBan(String member_id)throws Exception;
}
