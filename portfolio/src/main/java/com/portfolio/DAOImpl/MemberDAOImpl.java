package com.portfolio.DAOImpl;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.DAO.MemberDAO;
import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static String namespace = "com.portfolio.memberMapper";
	
	@Inject
	private SqlSession sqlsession;

	@Override
	public void register(MemberVO memberVO) throws Exception {
		sqlsession.insert(namespace + ".register", memberVO);
	}

	/*
	 * @Override public int idCnt(MemberVO memberVO)throws Exception{ return
	 * sqlsession.selectOne(namespace + ".idCnt", memberVO); }
	 */
	@Override
	public boolean selectId(String id){
		return sqlsession.selectOne(namespace + ".selectId", id);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO)throws Exception{
		System.out.println("DAOloginVO"+loginVO.getPasswd());
		return sqlsession.selectOne(namespace + ".login", loginVO);
	}
	
	@Override
	public void keepLogin(String member_id,String session_id, Date session_limit)throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("session_id", session_id);
		paramMap.put("member_id", member_id);
		paramMap.put("session_limit", session_limit);
		
		sqlsession.update(namespace + ".keepLogin",paramMap);
	}
	
	@Override
	public MemberVO checkUserWithSessionKey(String value)throws Exception{
		return sqlsession.selectOne(namespace + ".check" , value);
	}
}
