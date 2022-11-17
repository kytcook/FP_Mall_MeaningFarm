package com.meaningfarm.mall.notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.meaningfarm.mall.notice.dao.NoticeDao;
import com.util.FileUtils;
import com.vo.NoticeVO;
import com.vo.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeDao dao;
	
//	@Inject
	@Resource(name="fileUtils")
	private FileUtils fileUtils; //com.util.FileUtils; 에서 가져와서 씀
	

	//글목록
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	//글전체갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	//글작성 + 첨부파일 추가 221025
	// 첨부파일 파라미터를 받을 MultipartHttpServletRequest를 추가
	@Override
	public void write(@ModelAttribute NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		logger.info("service post write");
		dao.write(noticeVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(noticeVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ //여러개의 첨부파일을 등록하기 위해 for문 돌려줌
			dao.insertFile(list.get(i)); 
		}
	}

	//수정서비스
	@Override
	public void update(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		logger.info("service post update");
		dao.update(noticeVO);
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(noticeVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}

	//삭제서비스
	@Override
	public void delete(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		logger.info("service post delete");
		dao.delete(notice_no);
	}

	//상세조회
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(notice_no);
	}


	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(notice_no);
	}

	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
	//앞뒤글
	@Override
	public NoticeVO movePage(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.movePage(notice_no);
	}

	

}
