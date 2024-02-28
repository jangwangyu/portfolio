package com.portfolio.ServiceImpl;

import java.sql.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.DAO.MemberDAO;
import com.portfolio.Service.MemberService;
import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		memberDAO.register(memberVO);
	}

	/*
	 * @Override public int idCnt(MemberVO memberVO)throws Exception{ return
	 * memberDAO.idCnt(memberVO); }
	 */
	@Override
	public boolean selectId(String id){
		return memberDAO.selectId(id);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO) throws Exception {
		return memberDAO.login(loginVO);
	}
	
	@Override
	public void keepLogin(String userId, String session_id, Date session_limit)throws Exception{
		memberDAO.keepLogin(userId, session_id, session_limit);
	}
	
	public MemberVO checkLoginBefore(String value) throws Exception{
		return memberDAO.checkUserWithSessionKey(value);
	}
}
