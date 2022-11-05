package com.meaningfarm.mall.notice.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.vo.Criteria;
import com.vo.NoticeVO;
import com.vo.SearchCriteria;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	private Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);
	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	 private static String namespace = "com.mybatis.mapper.NoticeMapper";
	
//개시물 목록 조회 => 페이징처리
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		logger.info("daoList 호출 성공");
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("listPage",scri); 
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("listCount",scri);
	}
	//글작성
	@Override
	public void write(@ModelAttribute NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		logger.info("post dao write");
		sqlSessionTemplate.insert("write", noticeVO);

	}
	//수정dao
	@Override
	public void update(@ModelAttribute NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("update", noticeVO);
	}
	
	//삭제dao
	@Override
	public void delete(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("delete", notice_no);
	}
	//조회수
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("hit", notice_no); //조회수 증가 쿼리를 추가 상세보기하면 +1된 상태 넘김
		return sqlSessionTemplate.selectOne("read", notice_no);
	}
	// 첨부파일 추가
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("insertFile", map);
	}

 
   	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("selectFileList", notice_no);
	}
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("selectFileInfo", map);
	}
	// 첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("updateFile", map);
	}
	//앞글 뒤글
	@Override
	public NoticeVO movePage(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("movePage", notice_no);
	}
	
	
}
