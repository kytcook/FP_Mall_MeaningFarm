package com.meaningfarm.mall.member.service;

import java.util.List;
import java.util.Map;

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

	public List<Map<String, Object>> myinfo(Map<String, Object> mMap) {
		logger.info("MyPageService : myinfo 호출 성공");
		List<Map<String, Object>> myinfo = null;
		myinfo = mypageDao.myinfo(mMap);
		
		return myinfo;
	}

	public int updatemyinfo(Map<String, Object> mMap) {
		logger.info("MyPageService : updatemyinfo 호출 성공");
		int result = mypageDao.updatemyinfo(mMap);
		return result;
	}

	
}
