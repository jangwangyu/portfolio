package com.portfolio.ServiceImpl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.portfolio.DAO.NoticeBoardDAO;
import com.portfolio.Service.NoticeBoardService;
import com.portfolio.VO.NoticeBoardVO;
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	NoticeBoardDAO dao;
	
	@Override
	public void create(NoticeBoardVO vo) throws Exception {
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();
		
		// *태그 문자 처리 (< ==> &lt; > ==> &gt;)
		// replace(A, B) A를 B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "gt;");
		// *공백 문자 처리
		title = title.replace(" ", "&nbsp;&nbsp;");
		writer = writer.replace(" ", "&nbsp;&nbsp;");
		// *줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		dao.create(vo);
	}

	@Override
	public NoticeBoardVO read(int bno) {
		return dao.read(bno);
	}

	@Override
	public void updateArticle(NoticeBoardVO vo) throws Exception {
		dao.updateArticle(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<NoticeBoardVO> listAll() throws Exception {

		return dao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 떄문에 if문은 실행X
		if(session.getAttribute("update_time_" + bno) != null) {
			update_time = (long)session.getAttribute("update_time_" + bno);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템 현재 시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(bno);
			// 세션에 시간을 저장 : "update_time_" + bno는 다른변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + bno, current_time);
		}
		
	}

}
