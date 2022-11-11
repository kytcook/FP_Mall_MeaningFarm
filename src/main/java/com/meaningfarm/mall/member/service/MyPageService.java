package com.meaningfarm.mall.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meaningfarm.mall.member.dao.MyPageDao;
import com.vo.MemberVO;

@Service
public class MyPageService {
	Logger logger = LoggerFactory.getLogger(MyPageService.class);

	@Autowired(required=false)
	private MyPageDao mypageDao;
	
	public MyPageService (MyPageDao mypageDao) {
		this.mypageDao = mypageDao;
	}
	
	@Transactional(readOnly = true)
	public List<MemberVO> mList(String id) throws Exception {
		logger.info("MyPageService : mList 호출 성공");
		List<MemberVO> mList = null;
		mList = mypageDao.mList(id);
		return mList;
	}
	
}
