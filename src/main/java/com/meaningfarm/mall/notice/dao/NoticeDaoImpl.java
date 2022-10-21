package com.meaningfarm.mall.notice.dao;

import java.util.List;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.meaningfarm.mall.notice.domain.NoticeVO;
import com.meaningfarm.mall.notice.service.NoticeServiceImpl;

@Repository
@Transactional
public class NoticeDaoImpl implements NoticeDao {

	private Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	/*
	 * // 매퍼 private static String namespace = "com.mybatis.mapper.NoticeMapper";
	 */

	@Override
	public List<NoticeVO> list() throws Exception {
		logger.info("daoList 호출 성공");
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("list");
	}

	@Override
	public void register(NoticeVO notice) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("register", notice);
	}

}