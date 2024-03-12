package com.portfolio.DAOImpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.DAO.AdminDAO;
import com.portfolio.VO.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
private static String namespace = "com.portfolio.adminMapper";
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<MemberVO> memberList(MemberVO memberVO) throws Exception {
		return sqlsession.selectList(namespace + ".memberList", memberVO);
	}

	@Override
	public void memberBan(String member_id)throws Exception{
		sqlsession.delete(namespace + ".memberBan", member_id);
	}
}
