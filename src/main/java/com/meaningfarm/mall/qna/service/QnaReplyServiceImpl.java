package com.meaningfarm.mall.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.qna.dao.QnaReplyDao;
import com.vo.QnaReplyVO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	@Autowired
	private QnaReplyDao qrd;
	
	@Override
	public List<QnaReplyVO> readReply(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return qrd.readReply(qna_no);
	}
	//댓글 작성
	@Override
	public void writeReply(QnaReplyVO qnaReplyVO) throws Exception {
		// TODO Auto-generated method stub
		qrd.writeReply(qnaReplyVO);
	}
	//특정댓글 조회
	@Override
	public QnaReplyVO readReplySelect(int qnareply_no) throws Exception {
		// TODO Auto-generated method stub
		return qrd.readReplySelect(qnareply_no);
	}
	//댓글 수정
	@Override
	public void replyUpdate(QnaReplyVO qnaReplyVO) throws Exception {
		// TODO Auto-generated method stub
		qrd.replyUpdate(qnaReplyVO);
	}
	//댓글 삭제
	@Override
	public void replyDelete(QnaReplyVO qnaReplyVO) throws Exception {
		// TODO Auto-generated method stub
		qrd.replyDelete(qnaReplyVO);
	}

}
