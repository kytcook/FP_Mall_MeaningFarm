package com.meaningfarm.mall.notice.service;

import java.util.List;

import com.meaningfarm.mall.notice.domain.NoticeVO;

public interface NoticeService {
	 // 목록
	 public List<NoticeVO> list() throws Exception;
	 //글입력
	public void register(NoticeVO notice) throws Exception;
}
