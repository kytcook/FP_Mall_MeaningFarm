package com.meaningfarm.mall.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.MemberVO;

@Service
public class LoginDao {
	Logger logger = LoggerFactory.getLogger(LoginDao.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO login(Map<String, Object> pMap) {
		logger.info("LoginDao : login 호출 성공"+pMap);
		MemberVO mVO;
		mVO = sqlSessionTemplate.selectOne("login", pMap);
		return mVO;
	}
	
}
