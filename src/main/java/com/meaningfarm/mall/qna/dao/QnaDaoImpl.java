package com.meaningfarm.mall.qna.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.vo.Criteria;
import com.vo.QnaVO;
import com.vo.SearchCriteria;

@Repository
public class QnaDaoImpl implements QnaDao {

	
	private Logger logger = LoggerFactory.getLogger(QnaDaoImpl.class);
	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	 private static String namespace = "com.mybatis.mapper.QnaMapper";
	
	//리스트
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		logger.info("qnadaoList 호출 성공");
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("QnalistPage", scri); 
	}

	//글전체갯수조회
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qnaListCount", scri);
	}
	
	
//글작성
	@Override
	public void write(@ModelAttribute QnaVO qnaVO) {
		// TODO Auto-generated method stub
		logger.info("post dao qna");
		sqlSessionTemplate.insert("qnaWrite",qnaVO);
	}

	//글작성
	@Override
	public QnaVO read(int qna_no) {
		// TODO Auto-generated method stub
		logger.info("post dao READ qna");
		return 	sqlSessionTemplate.selectOne("qnaRead", qna_no);
	}

	//글삭제
	@Override
	public void delete(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("qnaDelete",qna_no);
	}

	//문의사항 수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("qnaUpdate", qnaVO);
	}
//좋아요 구현
	
	//좋아요 체크
	@Override
	public int findLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("findLike", map);
	}
	
	//좋아요 불러오기
	@Override
	public int getLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("getLike", map);
	}
	//좋아요 업
	@Override
	public void likeUp(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("likeUp", map);
	}

	//좋아요 다운
	@Override

	public void likeDown(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("likeDown", map);
	}
	
	
	
	
}
