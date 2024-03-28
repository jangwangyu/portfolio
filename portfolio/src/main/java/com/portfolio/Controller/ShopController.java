package com.portfolio.Controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfolio.Service.ShopService;
import com.portfolio.VO.CartVO;
import com.portfolio.VO.GoodsViewVO;
import com.portfolio.VO.MemberVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Inject
	ShopService shopService;
	
	// 카테고리별 상품리스트
	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * listView(@RequestParam("c")int cateCode,@RequestParam("l")int level,Model
	 * model)throws Exception{ logger.info("itemView");
	 * 
	 * List<GoodsViewVO> list = null; list = shopService.itemList(cateCode);
	 * 
	 * model.addAttribute("list",list); }
	 */
	@RequestMapping(value = "/shopView", method = RequestMethod.GET)
	public void itemView(@RequestParam("n")int gdsNum,Model model)throws Exception{
		logger.info("itemView");
		
		GoodsViewVO view = shopService.goodsView(gdsNum);
		model.addAttribute("view",view);
	}
	
	//장바구니
	@ResponseBody
	@RequestMapping(value="/addCart", method = RequestMethod.POST)
	public ResponseEntity<String> addCart(CartVO cart,HttpSession session)throws Exception{
		
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		System.out.println("로그인 정보 : " + (MemberVO)session.getAttribute("login"));
		System.out.println("상품정보 : " + cart.getGdsNum());
		logger.info("상품정보 : " + cart.getGdsNum());
		
		if(member != null) {
	        cart.setMember_id(member.getMember_id());
	        shopService.addCart(cart);
	        return ResponseEntity.ok("true"); // 로그인이 되어 있는 경우
	    } else {
	        return ResponseEntity.ok("false"); // 로그인이 안 되어 있는 경우
	    }
		
	}
}
