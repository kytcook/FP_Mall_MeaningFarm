package com.meaningfarm.mall.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.vo.Criteria;
import com.vo.NoticeVO;
import com.vo.QnaVO;
import com.vo.SearchCriteria;

@Service
public interface QnaService {
	//list 조회 페이징
	public List<QnaVO> list(SearchCriteria scri) throws Exception;
	//글 총갯수
	public int listCount(SearchCriteria scri) throws Exception;
	//글작성
	public void write(QnaVO qnaVO) throws Exception;
	//상세조회
	public QnaVO read(int qnaVO) throws Exception;
	//삭제
	public void delete(int qna_no) throws Exception;
	//수정
	public void update(@ModelAttribute QnaVO qnaVO)throws Exception;
	//댓글 좋아요 체크
	public int findLike(int qna_no, String m_id) throws Exception;
	//  좋아요 리스트 가져오기
	public int getLike(int qna_no, int likenum) throws Exception;
	// 좋아요 업
	public void likeUp(int qna_no, String m_id, int likenum) throws Exception;
	//좋아요 다운
	public void likeDown(int qna_no , String m_id, int likenum) throws Exception;
	
	
}
