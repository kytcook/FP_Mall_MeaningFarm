package com.meaningfarm.mall.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class RegisterDao {
	Logger logger = LoggerFactory.getLogger(RegisterDao.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* ########## [ 회원가입 ] ########## */
	public int registerInsert(Map<String, Object> pMap) {
		logger.info("RegisterDao : registerInsert 호출 성공");
		int result = 0;
		try {
			sqlSessionTemplate.selectOne("registerInsert", pMap);
			if (pMap.get("result") != null) {
				result = Integer.parseInt(pMap.get("result").toString());
			}
			logger.info("result : "+result);
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return result;
	}
}
