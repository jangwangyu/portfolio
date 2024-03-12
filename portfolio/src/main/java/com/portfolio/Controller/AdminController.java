package com.portfolio.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.Service.AdminService;
import com.portfolio.Service.NoticeBoardService;
import com.portfolio.VO.MemberVO;
import com.portfolio.VO.NoticeBoardVO;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	@Inject
	NoticeBoardService boardService;
	
	@Inject
	AdminService adminService;
	
	// 로그인
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public String adminLogin() {
		return "/Admin/adminLogin";
	}
	
	// 로그아웃
	
	// 회원목록
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public String memberList(Model model,MemberVO memberVO)throws Exception {
		logger.info("memberList: " + adminService.memberList(memberVO));
		List<MemberVO> list = adminService.memberList(memberVO);
		
		model.addAttribute("list",list);
		return "/Admin/memberList";
	}
	// 회원 삭제
	@RequestMapping(value="/memberBan", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> memberBan(@RequestParam("member_id") String member_id) 
														throws Exception {
		adminService.memberBan(member_id);
		
		Map<String, String> response = new HashMap<>();
		response.put("result", "success");
		return response;
	}
	
	@RequestMapping(value="/interface", method=RequestMethod.GET)
	public String interfacee() {
		return "/Admin/interface";
	}
	// 게시판 목록
	@RequestMapping("/adminNotice")
	public ModelAndView list() throws Exception{
		logger.info("notice");
		List<NoticeBoardVO> list = boardService.listAll();
		// ModelAndView 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Admin/adminNotice"); // 뷰를 NoticeBoard로 설정
		mav.addObject("list",list); // 데이터 저장
		return mav; // NoticeBoard로 list 전달
	}
	
	// 작성
	@RequestMapping(value="/adminNoticeWrite", method=RequestMethod.GET)
	public String write() {
		logger.info("writer");
		return "/Admin/adminNoticeWrite";
	}
	@RequestMapping(value="/adminNoticeWritePost", method=RequestMethod.POST)
	public String insert(@ModelAttribute NoticeBoardVO vo)throws Exception{
		logger.info("writerPost");
		boardService.create(vo);
		return "redirect:/Admin/adminNotice";
	}
	
	// 내용 조회, 조회수 증가
	@RequestMapping(value="/adminNoticeView",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session)throws Exception{
		logger.info("view");
		// 증가처리
		boardService.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Admin/adminNoticeView");
		mav.addObject("dto",boardService.read(bno));
		return mav;
	}
	
	// 수정
	@RequestMapping(value="/adminNoticeModify",method=RequestMethod.GET)
	public void Modify(@RequestParam("bno") int bno, Model model)throws Exception{
		logger.info("modify");
		NoticeBoardVO vo = boardService.read(bno);
		
		model.addAttribute("view", vo);
	}
	@RequestMapping(value="/adminNoticeUpdate",method=RequestMethod.POST)
	public String update(NoticeBoardVO vo)throws Exception{
		logger.info("update");
		boardService.updateArticle(vo);
		return "redirect:/Admin/adminNoticeView?bno=" + vo.getBno();
	}
	
	// 삭제
	@RequestMapping("/adminNoticeDelete")
	public String delete(@RequestParam int bno) throws Exception{
		logger.info("delete");
		boardService.delete(bno);
		return "redirect:/Admin/adminNotice";
	}
}
