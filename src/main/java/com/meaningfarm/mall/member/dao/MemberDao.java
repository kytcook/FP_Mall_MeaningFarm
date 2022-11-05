package com.meaningfarm.mall.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.vo.MemberVO;

@Repository
public class MemberDao {
Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* ########## [[ 회원 목록]]  ########## */
	public List<MemberVO> memberList() {
		List<MemberVO> memberList = null;
		memberList = sqlSessionTemplate.selectList("memberListAll");
		logger.info("MemberDao : memberList 호출 성공" +memberList );
		return memberList;
	}
	
	/* ########## [[ 일반회원 회원가입 ]] ##########*/
	public int register(Map<String, Object> pMap) {
		logger.info("MemberDao : register 호출 성공");
		int result = 0;
		try {
			sqlSessionTemplate.selectOne("register", pMap);
			if(pMap.get("result") != null ) {
				result = Integer.parseInt(pMap.get("result").toString());
				logger.info("result : "+result);
			}
		}catch(DataAccessException e) {
				logger.info("Exception :"+e.toString());
		}
		//result = sqlSessionTemplate.insert("register",pMap);
		return result;
	}

	/* ########## [[ 판매자 회원가입 ]] ##########*/
	public int sregister(Map<String, Object> pMap) {
		logger.info("MemberDao : sregister 호출 성공");
		int result = 0;
		try {
			sqlSessionTemplate.selectOne("sregister", pMap);
			if(pMap.get("result") != null ) {
				result = Integer.parseInt(pMap.get("result").toString());
				logger.info("result : "+result);
			}
		}catch(DataAccessException e) {
				logger.info("Exception :"+e.toString());
		}
		//result = sqlSessionTemplate.insert("register",pMap);
		return result;
	}
	/* ########## [[ 로그인 요청 ]] ########## */
	public MemberVO login(@RequestParam Map<String,Object> pMap) {
		logger.info("MemberDao : login 호출 성공");
		MemberVO mVO = null;
		mVO = sqlSessionTemplate.selectOne("login", pMap);
		
		return mVO;
	}
	/* ########## [[ 아이디 중복검사]]  ########## */
	public int checkIdDup(Map<String, Object> pMap) {
		logger.info("MemberDao : checkIdDup 호출 성공");
		int result = sqlSessionTemplate.selectOne("checkIdDup", pMap);
		return result;
	}

	/* ########## [[ 로그인 유효성 검사 - ajax ]] ########## */
	public MemberVO getUserById(String m_id, String m_pw) {
		logger.info("MemberDao : getUserById 호출 성공");
		return sqlSessionTemplate.selectOne("getUserById", m_id);
	}
	
	/* ########## [[ 회원 탈퇴 - memberDelete ]]  ########## */
	public int memberDelete(Map<String, Object> pMap) {
		logger.info("MemberDao : memberDelete 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.delete("memberDelete", pMap);
		
		return result;
	}


	
	
	
	
}
