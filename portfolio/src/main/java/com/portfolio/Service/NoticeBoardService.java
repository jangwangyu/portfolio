package com.portfolio.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.portfolio.VO.NoticeBoardVO;

public interface NoticeBoardService {
	// 작성
	public void create(NoticeBoardVO vo)throws Exception;
	// 상세보기
	public NoticeBoardVO read(int bno);
	// 수정
	public void update(NoticeBoardVO vo)throws Exception;
	// 삭제
	public void delete(int bno)throws Exception;
	// 목록
	public List<NoticeBoardVO> listAll() throws Exception;
	// 조회
	public void increaseViewcnt(int bno, HttpSession session)throws Exception;
}
