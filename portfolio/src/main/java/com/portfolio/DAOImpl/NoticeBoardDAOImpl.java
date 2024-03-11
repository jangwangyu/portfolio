package com.portfolio.DAOImpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.portfolio.Controller.NoticeBoardController;
import com.portfolio.DAO.NoticeBoardDAO;
import com.portfolio.VO.NoticeBoardVO;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	@Inject
	SqlSession sqlsession;
	
	private static String namespace = "com.portfolio.NoticeBoardMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardDAOImpl.class);
	
	@Override
	public void create(NoticeBoardVO vo) throws Exception {
		sqlsession.insert(namespace + ".insert",vo);
	}

	@Override
	public NoticeBoardVO read(int bno) {
		
		return sqlsession.selectOne(namespace + ".view", bno);
	}

	@Override
	public void updateArticle(NoticeBoardVO vo) throws Exception {
		logger.info("bno: " + vo.getBno()); // bno 값 로그 출력
		sqlsession.update(namespace + ".updateArticle", vo);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlsession.delete(namespace + ".deleteArticle", bno);
		
	}

	@Override
	public List<NoticeBoardVO> listAll() throws Exception {

		return sqlsession.selectList(namespace +".listAll");
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {

		sqlsession.update(namespace +".increaseViewcnt",bno);
	}

}
