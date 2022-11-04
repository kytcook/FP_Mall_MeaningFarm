package com.meaningfarm.mall.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.vo.Criteria;
import com.vo.QnaVO;
import com.vo.SearchCriteria;

@Repository
public interface QnaDao {
	  // 목록조회
		public List<QnaVO> list(SearchCriteria scri)  throws Exception;
		//글 총갯수
		public int listCount(SearchCriteria scri) throws Exception; 
		//글작성	
		public void write(QnaVO qnaVO) throws Exception;
		//상세조회
		public QnaVO read(int qna_no) throws Exception;
		//삭제
		public void delete(int qna_no) throws Exception;
		//수정
		public void update(QnaVO qnaVO)throws Exception;
		//좋아요 체크
		public int findLike(Map<String, Object> map) throws Exception;
		//좋아요 리스트
		public int getLike(Map<String, Object> map) throws Exception;
		//좋아요 업
		public void likeUp(Map<String, Object> map) throws Exception;
		//좋아요 다운
		public void likeDown(Map<String, Object> map)throws Exception;
}
