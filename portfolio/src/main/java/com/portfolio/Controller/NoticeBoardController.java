package com.portfolio.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.Service.NoticeBoardService;
import com.portfolio.VO.NoticeBoardVO;

@Controller
@RequestMapping("/Board")
public class NoticeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	//의존관계 주입 -> NoticeBoardServiceImpl 생성
	//Ioc 의존관계 역전
	@Inject
	NoticeBoardService boardService;
	
	// 목록
	@RequestMapping("/notice")
	public ModelAndView list() throws Exception{
		logger.info("notice");
		List<NoticeBoardVO> list = boardService.listAll();
		// ModelAndView 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/notice"); // 뷰를 NoticeBoard로 설정
		mav.addObject("list",list); // 데이터 저장
		return mav; // NoticeBoard로 list 전달
	}
	
	// 작성
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() {
		logger.info("writer");
		return "/Board/write";
	}
	@RequestMapping(value="/writePost", method=RequestMethod.POST)
	public String insert(@ModelAttribute NoticeBoardVO vo)throws Exception{
		logger.info("writerPost");
		boardService.create(vo);
		return "redirect:/Board/notice";
	}
	
	// 내용 조회, 조회수 증가
	@RequestMapping(value="/noticeView",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session)throws Exception{
		logger.info("view");
		// 증가처리
		boardService.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/noticeView");
		mav.addObject("dto",boardService.read(bno));
		return mav;
	}
	
	// 수정
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@ModelAttribute NoticeBoardVO vo)throws Exception{
		logger.info("update");
		boardService.update(vo);
		return "redirect:/Board/notice";
	}
	
	// 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int bno) throws Exception{
		logger.info("delete");
		boardService.delete(bno);
		return "redirect:/Board/notice";
	}
}
