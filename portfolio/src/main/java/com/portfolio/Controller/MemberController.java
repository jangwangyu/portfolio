package com.portfolio.Controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.portfolio.Service.MemberService;
import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

@Controller
@RequestMapping("/Member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	private final MemberService memberService;

	@Inject
	public MemberController(MemberService memberService) {
	    this.memberService = memberService;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() throws Exception{
		logger.info("join");
		return "/Member/join";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(MemberVO memberVO, RedirectAttributes rttr)throws Exception{
		logger.info("register");
		String hashedPw = BCrypt.hashpw(memberVO.getPasswd(), BCrypt.gensalt());
		memberVO.setPasswd(hashedPw);
		memberService.register(memberVO);
		
		rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		
		return "redirect:/login";
	}
	// 중복확인 버튼
	/*
	 * @RequestMapping(value="/idCnt", method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String idCnt(@RequestBody String
	 * filterJSON,HttpServletResponse response, ModelMap model)throws Exception{
	 * JSONObject resMap= new JSONObject();
	 * 
	 * try { ObjectMapper mapper = new ObjectMapper(); MemberVO searchVO =
	 * (MemberVO) mapper.readValue(filterJSON, new TypeReference<MemberVO>(){});
	 * logger.info("searchVO: " + searchVO); int idCnt =
	 * memberService.idCnt(searchVO); logger.info("idCnt" + idCnt);
	 * 
	 * resMap.put("res", "ok"); resMap.put("idCnt", idCnt);
	 * 
	 * }catch(Exception e) { System.out.println(e.toString());
	 * resMap.put("res","error"); }
	 * 
	 * logger.info("idCnt"+resMap);
	 * response.setContentType("text/html: charset=UTF-8"); PrintWriter out =
	 * response.getWriter(); out.print(resMap);
	 * 
	 * return null; }
	 */
	//Id 중복 확인
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String id) {
		logger.info("ConfirmId.........");
		logger.info("id : " + id);
		boolean result = true;
		
		if(id.trim().isEmpty()) {
			logger.info("id : " + id);
			result = false;
		} else {
			if (memberService.selectId(id)) {
				result = false;
			} else {
				result = true;
			}
		}
			
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// 로그인
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginView(@ModelAttribute("loginVO")LoginVO loginVO,HttpServletRequest request,Model model)throws Exception{
		logger.info("loginView");
			
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		return "/Member/login";
	}
	
	@RequestMapping(value="/loginPost",method = RequestMethod.POST)
	public void loginPost(LoginVO loginVO, HttpSession httpSession, Model model)throws Exception{
		logger.info("loginVO"+loginVO.getMember_id());
		MemberVO memberVO = memberService.login(loginVO);
		logger.info("Pw"+memberVO);
		if(memberVO == null || !BCrypt.checkpw(loginVO.getPasswd(), memberVO.getPasswd())) {
			return;
		}
		
		model.addAttribute("member", memberVO);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession session)throws Exception{
		logger.info("logout");
		
		Object URL = session.getAttribute("URL");
		session.invalidate();
		
		return "redirect:"+(String)URL;
	}
}
