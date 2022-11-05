package com.meaningfarm.mall.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.QnaReplyVO;

@Repository
public class QnaReplyDaoImpl implements QnaReplyDao {
	
private Logger logger = LoggerFactory.getLogger(QnaReplyDaoImpl.class);
	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//댓글 리스트
	@Override
	public List<QnaReplyVO> readReply(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("readReply", qna_no);
	}

	//댓글 입력
	@Override
	public void writeReply(QnaReplyVO qnaReplyVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("writeReply", qnaReplyVO);
	}
	//특정 댓글조회
	@Override
	public QnaReplyVO readReplySelect(int qnareply_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("readReplySelect", qnareply_no);
	}
	//댓글업데이트
	@Override
	public void replyUpdate(QnaReplyVO qnaReplyVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("replyUpdate", qnaReplyVO);
	}
	//댓글 삭제
	@Override
	public void replyDelete(QnaReplyVO qnaReplyVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("replyDelete", qnaReplyVO);
	}
	
	
	

}
