package com.meaningfarm.mall.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vo.QnaReplyVO;

@Service
public interface QnaReplyService {

	//댓글조회
	public List<QnaReplyVO> readReply(int qna_no) throws Exception;
	//댓글작성
	public void writeReply(QnaReplyVO qnaReplyVO) throws Exception;
	//특정 댓글 조회
	public QnaReplyVO readReplySelect(int qnareply_no) throws Exception;
	//댓글 수정 
	public void replyUpdate(QnaReplyVO qnaReplyVO) throws Exception;
	//댓글 삭제
	public void replyDelete(QnaReplyVO qnaReplyVO) throws Exception;
	
}
