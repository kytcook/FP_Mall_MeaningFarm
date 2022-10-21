package com.meaningfarm.mall.notice.dao;

import java.util.List;

import com.meaningfarm.mall.notice.domain.NoticeVO;

public interface NoticeDao {
	// 목록조회
	public List<NoticeVO> list() throws Exception;

	public void register(NoticeVO notice) throws Exception;
}
