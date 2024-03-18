package com.portfolio.ServiceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.DAO.AdminDAO;
import com.portfolio.Service.AdminService;
import com.portfolio.VO.CategoryVO;
import com.portfolio.VO.GoodsVO;
import com.portfolio.VO.GoodsViewVO;
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
	// 카테고리
	@Override
	public List<CategoryVO> category()throws Exception{
		return dao.category();
	}
	
	@Override
	public void insertItem(GoodsVO vo)throws Exception{
		dao.insertItem(vo);
	}
	
	@Override
	public List<GoodsVO> itemList()throws Exception{
		return dao.itemList();
	}
	// 상품 보기 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum)throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	// 상품 수정
	public void goodsModify(GoodsVO vo)throws Exception{
		dao.goodsModify(vo);;
	}
	
	// 상품삭제
	public void goodsDelete(int gdsNum)throws Exception{
		dao.goodsDelete(gdsNum);
	}
}
