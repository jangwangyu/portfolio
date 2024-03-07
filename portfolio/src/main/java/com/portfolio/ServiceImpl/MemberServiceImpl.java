package com.portfolio.ServiceImpl;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import com.portfolio.DAO.MemberDAO;
import com.portfolio.Mail.MailUtils;
import com.portfolio.Mail.TempKey;
import com.portfolio.Service.MemberService;
import com.portfolio.VO.LoginVO;
import com.portfolio.VO.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Inject 
	JavaMailSender mailSender;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		memberDAO.register(memberVO);
		
		String key = new TempKey().getKey(50,false);
		memberDAO.createAuthKey(memberVO.getEmail(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[이메일 인증메일 입니다.]"); // 메일제목
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+memberVO.getMember_id()+"님 "+
						"<br/>회원가입해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8090/Member/registerEmail?email=" + memberVO.getEmail() +
						"&key=" + key +
						"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("dkfdj01033@gmail.com", "ams");
		sendMail.setTo(memberVO.getEmail());
		sendMail.send();
	}
	@Override
	public void memberAuth(String email)throws Exception{
		memberDAO.memberAuth(email);
	}

	/*
	 * @Override public int idCnt(MemberVO memberVO)throws Exception{ return
	 * memberDAO.idCnt(memberVO); }
	 */
	@Override
	public boolean selectId(String id){
		return memberDAO.selectId(id);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO) throws Exception {
		return memberDAO.login(loginVO);
	}
	
	@Override
	public void keepLogin(String member_id, String session_id, Date session_limit) throws Exception{
	    memberDAO.keepLogin(member_id, session_id, session_limit);
	}
	
	public MemberVO checkLoginBefore(String value) throws Exception{
		return memberDAO.checkUserWithSessionKey(value);
	}
	
	//아이디 찾기
	@Override
	public List<MemberVO> findId(String email)throws Exception{
		return memberDAO.findId(email);
	}
	@Override
	public int findIdCheck(String email)throws Exception{
		return memberDAO.findIdCheck(email);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
		return memberDAO.findPwCheck(memberVO);
	}
	@Override
	public void findPw(String email,String member_id)throws Exception{
		String memberKey = new TempKey().getKey(6, false);
		String passwd = BCrypt.hashpw(memberKey, BCrypt.gensalt());
		memberDAO.findPw(email,member_id,passwd);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[임시 비밀번호 입니다.]");
		sendMail.setText(
				"<h1>임시 비밀번호 발금</h1>" +
						"<br/>"+member_id+"님 "+
						"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
						"<br/>임시비밀번호 : <h2>"+memberKey+"</h2>"+
						"<br/>로그인 후 비밀번호 변경을 해주세요."+
						" + <a href='http://localhost:8090/Member/login" + ">로그인 페이지 </a>");
		sendMail.setFrom("dkfdj01033@gmail.com", "ams");
		sendMail.setTo(email);
		sendMail.send();
	}
	
	// 정보조회
	@Override
	public MemberVO viewMember(String member_id)throws Exception{
		return memberDAO.viewMember(member_id);
	}
	
	// 정보수정
	@Override
	public void updateMember(MemberVO memberVO) throws Exception {

        memberDAO.updateMember(memberVO);
	}	
	// 탈퇴
	public void delete(String member_id)throws Exception{
		memberDAO.delete(member_id);
	}
	@Override
	public String pwCheck(String member_id)throws Exception{
		return memberDAO.pwCheck(member_id);
	}
}
