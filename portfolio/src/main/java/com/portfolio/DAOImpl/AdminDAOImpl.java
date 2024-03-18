package com.portfolio.DAOImpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.DAO.AdminDAO;
import com.portfolio.VO.CategoryVO;
import com.portfolio.VO.GoodsVO;
import com.portfolio.VO.GoodsViewVO;
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
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return sqlsession.selectList(namespace + ".category");
	}
	
	@Override
	public void insertItem(GoodsVO vo)throws Exception{
		sqlsession.insert(namespace + ".insertItem", vo);
	}
	
	@Override
	public List<GoodsVO> itemList()throws Exception{
		return sqlsession.selectList(namespace +".itemList");
	}
	// 상품 보기 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum)throws Exception{
		return sqlsession.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		sqlsession.update(namespace + ".goodsModify", vo);
	}
	
	@Override
	public void goodsDelete(int gdsNum)throws Exception{
		sqlsession.delete(namespace + ".goodsDelete", gdsNum);
	}
}
