package com.meaningfarm.mall.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.vo.Criteria;
import com.vo.NoticeVO;
import com.vo.SearchCriteria;
@Repository
public interface NoticeDao {
   // 목록조회
	public List<NoticeVO> list(SearchCriteria scri)  throws Exception;
	//게시물 총갯수
	public int listCount(SearchCriteria scri) throws Exception;
   // 게시글 작성
	public void write(@ModelAttribute NoticeVO noticeVO) throws Exception;
	
	// 게시물 수정
	public void update(@ModelAttribute NoticeVO noticeVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int notice_no) throws Exception;
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
    // 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception;
	// 첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	//상세조회
	public NoticeVO read(int notice_no) throws Exception;
	//앞뒤글
	public NoticeVO movePage(int notice_no)throws Exception;
	
	
	//코드 보관
	/* public List<NoticeVO> list() throws Exception; 
	 * 	public List<NoticeVO> list(Criteria cri)  throws Exception;
	 * 
	 * */
}