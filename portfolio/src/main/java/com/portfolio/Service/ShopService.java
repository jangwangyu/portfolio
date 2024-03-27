package com.portfolio.Service;

import java.util.List;

import com.portfolio.VO.CartVO;
import com.portfolio.VO.GoodsViewVO;

public interface ShopService {
	// 카테고리별 상품 리스트
	public List<GoodsViewVO> itemList(int cateCode, int level)throws Exception;
	
	// 상품조회
	public GoodsViewVO goodsView(int gdsNum)throws Exception;
	
	// 장바구니
	public void addCart(CartVO cart)throws Exception;
}
