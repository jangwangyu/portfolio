package com.portfolio.ServiceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.DAO.AdminDAO;
import com.portfolio.Service.AdminService;
import com.portfolio.VO.MemberVO;
@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	public List<MemberVO> memberList(MemberVO memberVO) throws Exception {
		return dao.memberList(memberVO);
	}
	
	@Override
	public void memberBan(String member_id)throws Exception{
		dao.memberBan(member_id);
	}

}
