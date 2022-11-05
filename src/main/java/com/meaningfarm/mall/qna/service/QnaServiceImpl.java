package com.meaningfarm.mall.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.qna.dao.QnaDao;
import com.vo.QnaVO;
import com.vo.SearchCriteria;

@Service
public class QnaServiceImpl implements QnaService {
	
	Logger logger = LoggerFactory.getLogger(QnaServiceImpl.class);
	
	@Autowired
	private QnaDao qnaDao;
	
	//리스트
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		logger.info("qna service list호출");
		return qnaDao.list(scri);
	}
//글갯수조회
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.listCount(scri);
	}
	
//글작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.write(qnaVO);
	}
//상세조회
	@Override
	public QnaVO read(int qnaVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.read(qnaVO);
	}
	//삭제
	@Override
	public void delete(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.delete(qna_no);
	}
	//수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.update(qnaVO);
	}
	
	//좋아요부분
	//좋아요 체크
	
	@Override
	public int findLike(int qna_no, String m_id) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_no", qna_no);
		map.put("m_id", m_id);
		
		return qnaDao.findLike(map);
	}
	//좋아요 리스트
	@Override
	public int getLike(int qna_no, int likenum) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_no", qna_no);
		map.put("likenum", likenum);
		
		return qnaDao.getLike(map);
	}
	@Override
	public void likeUp(int qna_no, String m_id, int likenum) throws Exception {
		// TODO Auto-generated method stub
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("qna_no", qna_no);
			map.put("m_id", m_id);
			map.put("likenum", likenum);
		qnaDao.likeUp(map);
	}
	
	
	@Override
	public void likeDown(int qna_no, String m_id, int likenum) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_no", qna_no);
		map.put("m_id", m_id);
		map.put("likenum", likenum);
		qnaDao.likeDown(map);
	}


}
