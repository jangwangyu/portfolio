package com.portfolio.DAO;

import java.util.List;

import com.portfolio.VO.CartVO;
import com.portfolio.VO.GoodsViewVO;

public interface ShopDAO {
	// 카테고리별 상품 리스트: 1차 분류
	public List<GoodsViewVO> itemList(int cateCode, int cateCodeRef)throws Exception;
	
	// 카테고리별 상품 리스트 : 2차분류
	public List<GoodsViewVO> itemList(int cateCode)throws Exception;
	
	// 상품 조회
	public GoodsViewVO goodsView(int gdsNum)throws Exception;
	
	// 장바구니
	public void addCart(CartVO cart)throws Exception;
}
