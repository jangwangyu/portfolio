package com.portfolio.DAO;

import java.util.List;

import com.portfolio.VO.NoticeBoardVO;

public interface NoticeBoardDAO {

	// 작성
	public void create(NoticeBoardVO vo)throws Exception;
	// 상세보기
	public NoticeBoardVO read(int bno);
	// 수정
	public void updateArticle(NoticeBoardVO vo)throws Exception;
	// 삭제
	public void delete(int bno)throws Exception;
	// 목록
	public List<NoticeBoardVO> listAll() throws Exception;
	// 조회
	public void increaseViewcnt(int bno)throws Exception;
}
