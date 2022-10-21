package com.meaningfarm.mall.member.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.member.dao.RegisterDao;
@Service
public class RegisterService {
	Logger logger = LoggerFactory.getLogger(RegisterService.class);
	
	@Autowired(required=false)
	private RegisterDao registerDao;
	
	public int registerInsert(Map<String, Object> pMap) {
		logger.info("RegisterService : registerInsert 호출 성공");
		int result = 0;
		result = registerDao.registerInsert(pMap);
		return result;
	}
}
