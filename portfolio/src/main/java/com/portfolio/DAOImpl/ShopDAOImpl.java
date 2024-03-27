package com.portfolio.DAOImpl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.DAO.ShopDAO;
import com.portfolio.VO.CartVO;
import com.portfolio.VO.GoodsViewVO;
@Repository
public class ShopDAOImpl implements ShopDAO {
	
private static String namespace = "com.portfolio.ShopMapper";
	
	@Inject
	private SqlSession sqlsession;
	
	// 1차 분류
	@Override
	public List<GoodsViewVO> itemList(int cateCode, int cateCodeRef) throws Exception {
		HashMap<String, Object>map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sqlsession.selectList(namespace + ".itemList_1", map);
	}
	
	// 2차 분류
	@Override
	public List<GoodsViewVO> itemList(int cateCode)throws Exception{
		return sqlsession.selectList(namespace + ".itemList_2", cateCode);
	}
	
	// 상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum)throws Exception{
		return sqlsession.selectOne(namespace +".goodsView", gdsNum);
	}
	
	// 장바구니
	@Override
	public void addCart(CartVO cart)throws Exception{
		sqlsession.insert(namespace + ".addCart", cart);
	}
}
