package com.meaningfarm.mall.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.MemberVO;

@Repository
public class MyPageDao {
	Logger logger = LoggerFactory.getLogger(MyPageDao.class);

	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate;

	public MyPageDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> myinfo(Map<String, Object> mMap) {
		logger.info("MyPageDao : myinfo 호출 성공" + mMap);
		List<Map<String, Object>> myinfo = null;
		myinfo = sqlSessionTemplate.selectList("myinfo", mMap);

		logger.info("MyPageDao : myinfo 호출 성공" + myinfo);
		return myinfo;
	}
	public int updatemyinfo(Map<String, Object> mMap) {
		logger.info("MyPageDao : updatemyinfo 호출 성공" + mMap);
		int result = 0;
		try {
			result = sqlSessionTemplate.update("updatemyinfo", mMap);
			logger.info("result : " + result);
		} catch (Exception e) {
			logger.info("Exception : " + e.toString());
		}
		return result;
	}

}
