package com.portfolio.Service;

import java.util.List;

import com.portfolio.VO.CategoryVO;
import com.portfolio.VO.GoodsVO;
import com.portfolio.VO.GoodsViewVO;
import com.portfolio.VO.MemberVO;

public interface AdminService {
	// 회원목록
	public List<MemberVO> memberList(MemberVO memberVO)throws Exception;
	
	// 삭제
	public void memberBan(String member_id)throws Exception;
	// 카테고리
	public List<CategoryVO> category()throws Exception;
	public void insertItem(GoodsVO vo)throws Exception;
	
	// 상품목록
	public List<GoodsVO> itemList() throws Exception;
	
	// 상품 보기 + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	// 상품수정
	public void goodsModify(GoodsVO vo)throws Exception;
	
	// 상품 삭제
	public void goodsDelete(int gdsNum)throws Exception;
}
