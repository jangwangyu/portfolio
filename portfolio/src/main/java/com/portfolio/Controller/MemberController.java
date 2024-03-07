package com.portfolio.Controller;

import java.sql.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.WebUtils;

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
	public String register(MemberVO memberVO, RedirectAttributes rttr,Model model)throws Exception{
		logger.info("register");
		String hashedPw = BCrypt.hashpw(memberVO.getPasswd(), BCrypt.gensalt());
		memberVO.setPasswd(hashedPw);
		memberService.register(memberVO);
		
		model.addAttribute("member",memberVO);
		
		rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		rttr.addAttribute("email",memberVO.getEmail());
		rttr.addAttribute("member_id",memberVO.getMember_id());
		
		return "redirect:/Member/registerAuth";
	}
	
	@RequestMapping(value="registerEmail",method=RequestMethod.GET)
	public String emailConfirm(String email,Model model)throws Exception{
		memberService.memberAuth(email);
		model.addAttribute("email",email);
		
		return "/Member/registerEmail";
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
	public String loginPost(LoginVO loginVO, HttpSession httpSession, Model model)throws Exception{
		logger.info("loginVO"+loginVO.getMember_id());
		MemberVO memberVO = memberService.login(loginVO);
		logger.info("Pw"+memberVO);
		if(memberVO == null || !BCrypt.checkpw(loginVO.getPasswd(), memberVO.getPasswd())) {
			return "/Member/loginCheck";
		}
		if(memberVO.getMember_auth() == 0) {
			model.addAttribute("Auth",memberVO.getMember_auth());
			return "/Member/registerReady";
		}
		model.addAttribute("member", memberVO);
		
		logger.info("Use cookie: " + loginVO.isUseCookie());
		
		if(loginVO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date session_limit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.keepLogin(memberVO.getMember_id(), httpSession.getId(), session_limit);
		}
		return "/Main/index";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response,ModelMap model)throws Exception{
		logger.info("logout");
		
		Object URL = session.getAttribute("URL");
		// session.invalidate();
		Object object = session.getAttribute("login");
		
		if(object != null) {
			MemberVO memberVO = (MemberVO) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "member_id");
	        if(loginCookie != null) {
	            loginCookie.setPath("/");
	            loginCookie.setMaxAge(0);
	            response.addCookie(loginCookie);
	            memberService.keepLogin(memberVO.getMember_id(),"none",new Date(0));
	        }
		}
		logger.info("URL", URL);
		String requestURL = "/";
			if(StringUtils.isNotBlank((String)URL))
				requestURL = (String)URL;
		
		return "redirect:"+(String)URL;
	}
	
	@RequestMapping(value = "/registerAuth", method= RequestMethod.GET)
	public String loginView(HttpServletRequest request,Model model,@RequestParam("email")String email, @RequestParam(value = "member_id", required = false)String member_id)throws Exception{
		logger.info("loginView");
		
		model.addAttribute("member_id",member_id);
		model.addAttribute("email",email);
		
		return "/Member/registerAuth";
	}
	
	@RequestMapping(value = "/errorLogin", method = RequestMethod.GET)
	public String home() {
		
		return "Member/errorLogin";
	}
	// 마이페이지
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() throws Exception{
		logger.info("mypage");
		return "/Member/mypage";
	}
	// 정보 수정
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(HttpServletRequest request, Model model) throws Exception{
	    String member_id = null;

	    // 요청에 포함된 쿠키를 확인합니다.
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("member_id".equals(cookie.getName())) {
	                member_id = cookie.getValue();
	                break;
	            }
	        }
	    }
	    if (member_id == null) {
	        // member_id 쿠키가 없는 경우의 처리...
	        throw new Exception("member_id 쿠키가 없습니다.");
	    }

	    logger.info("modify");

	    model.addAttribute("member", memberService.viewMember(member_id));
	    return "/Member/modify";
	}
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public String updateMember(MemberVO memberVO, HttpSession session, HttpServletResponse response, RedirectAttributes rttr,HttpServletRequest request) throws Exception{
	    logger.info("updateMember");
	    
	    String hashedPw = BCrypt.hashpw(memberVO.getPasswd(), BCrypt.gensalt());
	    memberVO.setPasswd(hashedPw);
	    memberService.updateMember(memberVO);
	    
		// session.invalidate();
		Object object = session.getAttribute("login");
	    
	    // 쿠키 만료
	    if(object != null) {
			MemberVO memberVO1 = (MemberVO) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "member_id");
	        if(loginCookie != null) {
	            loginCookie.setPath("/");
	            loginCookie.setMaxAge(0);
	            response.addCookie(loginCookie);
	            memberService.keepLogin(memberVO1.getMember_id(),"none",new Date(0));
	        }
		}
	    
	    rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
	    return "redirect:/Member/login";
	}

	
	// 아이디 찾기
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findId() throws Exception{
		logger.info("findId");
		return "/Member/findId";
	}
	
	@RequestMapping(value="/findIdPost",method=RequestMethod.POST)
	public String findIdPOst(MemberVO memberVO,Model model)throws Exception{
		logger.info("email" + memberVO.getEmail());
		
		if(memberService.findIdCheck(memberVO.getEmail())==0){
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/Member/findId";
		}else {
			model.addAttribute("member", memberService.findId(memberVO.getEmail()));
			return "/Member/findIdPost";
		}
	}
	//비밀번호 찾기
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public String findPw() throws Exception{
		logger.info("findPw");
		return "/Member/findPw";
	}
	@RequestMapping(value="/findPwPost", method=RequestMethod.POST)
	public String findPwPost(MemberVO memberVO,Model model)throws Exception{
		logger.info("Pw" + memberVO.getPasswd());
		
		if(memberService.findPwCheck(memberVO)==0) {
			logger.info("memberPwCheck");
			model.addAttribute("msg","아이디와 메일을 확인해주세요");
			
			return "/Member/findPw";
		}else {
			memberService.findPw(memberVO.getEmail(),memberVO.getMember_id());
			model.addAttribute("member",memberVO.getEmail());
			return "/Member/findPwPost";
		}
	}
	
	// 탈퇴
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete() throws Exception{
		return "/Member/delete";
	}
	@RequestMapping(value="/deletePost", method=RequestMethod.POST)
	public String deletePost(String member_id,RedirectAttributes rttr,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
		memberService.delete(member_id);
		
		Object object = session.getAttribute("login");
	    
	    // 쿠키 만료
	    if(object != null) {
			MemberVO memberVO1 = (MemberVO) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "member_id");
	        if(loginCookie != null) {
	            loginCookie.setPath("/");
	            loginCookie.setMaxAge(0);
	            response.addCookie(loginCookie);
	            memberService.keepLogin(memberVO1.getMember_id(),"none",new Date(0));
	        }
		}
	    
		rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
		return "redirect:/Member/login";
	}
	
	@RequestMapping(value="/pwCheck" , method=RequestMethod.POST)
	@ResponseBody
	public int pwCheck(MemberVO memberVO) throws Exception{
		String memberPw = memberService.pwCheck(memberVO.getMember_id());
		
		if(memberVO == null || !BCrypt.checkpw(memberVO.getPasswd(), memberPw)) {
			return 0;
		}
		
		return 1;
	}
	
}
