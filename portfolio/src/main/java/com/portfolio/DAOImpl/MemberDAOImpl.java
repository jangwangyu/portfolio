package com.portfolio.DAOImpl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
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
		
		System.out.println("keepLogin called. member_id: " + member_id + ", session_id: " + session_id + ", session_limit: " + session_limit);
		
		sqlsession.update(namespace + ".keepLogin",paramMap);
	}
	
	@Override
	public MemberVO checkUserWithSessionKey(String value)throws Exception{
		return sqlsession.selectOne(namespace + ".check" , value);
	}
	
	// 아이디 찾기
	@Override
	public List<MemberVO> findId(String email) throws Exception{
		return sqlsession.selectList(namespace + ".findId", email);
	}
	@Override
	public int findIdCheck(String email)throws Exception{
		return sqlsession.selectOne(namespace+".findIdCheck",email);
	}
	
	//비밀번호 찾기
	public int findPwCheck(MemberVO memberVO)throws Exception{
		return sqlsession.selectOne(namespace + ".findPwCheck",memberVO);
	}
	public int findPw(String email, String member_id,String passwd)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("email", email);
		map.put("member_id", member_id);
		map.put("passwd", passwd);
		return sqlsession.update(namespace + ".findPw", map);
		
	}
	
	// 이메일 인증
	@Override
	public void createAuthKey(String email,String authKey)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("email", email);
		map.put("authKey", authKey);
		
		sqlsession.selectOne(namespace+ ".createAuthKey",map);
	}
	@Override
	public void memberAuth(String email)throws Exception{
		sqlsession.update(namespace +".memberAuth", email);
	}
	
	// 정보조회
	@Override
	public MemberVO viewMember(String member_id) throws Exception{
		return sqlsession.selectOne(namespace +".viewMember", member_id);
	}
	// 정보수정
	public void updateMember(MemberVO memberVO)throws Exception{
		sqlsession.update(namespace + ".updateMember", memberVO);
	}
	
	// 탈퇴
	public void delete(String member_id)throws Exception{
		sqlsession.delete(namespace + ".delete" ,member_id);
	}
	@Override
	public String pwCheck(String member_id)throws Exception{
		return sqlsession.selectOne(namespace + ".pwCheck", member_id);
	}
	
}
