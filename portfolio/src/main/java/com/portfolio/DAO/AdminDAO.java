package com.portfolio.DAO;

import java.util.List;

import com.portfolio.VO.CategoryVO;
import com.portfolio.VO.GoodsVO;
import com.portfolio.VO.GoodsViewVO;
import com.portfolio.VO.MemberVO;

public interface AdminDAO {
	// 회원목록
	public List<MemberVO> memberList(MemberVO memberVO)throws Exception;
	
	// 회원삭제
	public void memberBan(String member_id)throws Exception;
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void insertItem(GoodsVO vo)throws Exception;
	
	// 상품 목록
	public List<GoodsVO> itemList() throws Exception;
	
	// 상품 보기 + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum)throws Exception;
	
	// 상품 수정
	public void goodsModify(GoodsVO vo)throws Exception;
	
	// 상품 수정
	public void goodsDelete(int gdsNum)throws Exception;
}
