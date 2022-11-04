package com.meaningfarm.mall.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vo.Criteria;
import com.vo.NoticeVO;
import com.vo.SearchCriteria;
@Service
public interface NoticeService {

	//list 조회 페이징
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//write 게시물 작성
	public void write(@ModelAttribute NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 게시물 목록 조회
	public NoticeVO read(int notice_no) throws Exception;
	
	// 게시물 수정
	public void update(@ModelAttribute NoticeVO noticeVO,String[] files, String[] fileNames,MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 게시물 삭제
	public void delete(int notice_no) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception;

	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	//앞뒤글
	 public NoticeVO movePage(int notice_no)throws Exception;
	
}
