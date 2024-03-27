package com.portfolio.ServiceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.DAO.ShopDAO;
import com.portfolio.Service.ShopService;
import com.portfolio.VO.CartVO;
import com.portfolio.VO.GoodsViewVO;
@Service
public class ShopServiceImpl implements ShopService {
	
	@Inject
	private ShopDAO dao;
	
	@Override
	public List<GoodsViewVO> itemList(int cateCode, int level) throws Exception {
		int cateCodeRef = 0;
		
		if(level == 1) { // 1차분류
			
			cateCodeRef = cateCode;
			return dao.itemList(cateCode,cateCodeRef);
			
		}else { // 2차분류
			
			return dao.itemList(cateCode);
		}
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum)throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	@Override
	public void addCart(CartVO cart)throws Exception{
		dao.addCart(cart);
	}
}
