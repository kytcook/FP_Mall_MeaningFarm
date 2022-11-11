package com.meaningfarm.mall.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.MemberVO;

@Repository
public class MyPageDao {
	Logger logger = LoggerFactory.getLogger(MyPageDao.class);
	
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MyPageDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<MemberVO> mList(String id) throws Exception {
		logger.info("MyPageDao : mList 호출 성공");
		List<MemberVO> mList = null;
		mList = sqlSessionTemplate.selectList("myinfo", id);
		return mList;
	}
	
}
