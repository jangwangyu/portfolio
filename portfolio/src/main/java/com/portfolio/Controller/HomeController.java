package com.portfolio.Controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.portfolio.Service.AdminService;
import com.portfolio.Service.ShopService;
import com.portfolio.VO.GoodsViewVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	AdminService adminService; 
	
	@Inject
	ShopService shopService;
	
	// 카테고리별 상품리스트
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listView(@RequestParam(value="c",defaultValue="100")int cateCode,@RequestParam(value="l",defaultValue="1")int level,Model model)throws Exception{
		logger.info("itemView");
		
		List<GoodsViewVO> list = null;
		list = shopService.itemList(cateCode, level);
		
		model.addAttribute("list",list);
		
		return "/Main/index";
	}
	
}
