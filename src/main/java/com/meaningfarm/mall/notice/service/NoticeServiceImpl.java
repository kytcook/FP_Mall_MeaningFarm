package com.meaningfarm.mall.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meaningfarm.mall.notice.dao.NoticeDao;
import com.meaningfarm.mall.notice.domain.NoticeVO;

@Transactional
@Service
public class NoticeServiceImpl implements NoticeService {
	
	private Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);	
	
	@Inject
	private NoticeDao dao;

	@Override
	public List<NoticeVO> list() throws Exception {
		logger.info("service List 호출 성공");
		// TODO Auto-generated method stub
		  return dao.list();
	}

	@Override
	public void register(NoticeVO notice) throws Exception {
		// TODO Auto-generated method stub
		dao.register(notice);
	}
	
}
