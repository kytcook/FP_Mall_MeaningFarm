package com.meaningfarm.mall.member.dao;

import java.util.HashMap;
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
	
	public List<Map<String,Object>> memberList(Map<String, Object> pMap) {
		List<Map<String,Object>> memberList = null;
		memberList = sqlSessionTemplate.selectList("memberList",pMap);
		logger.info("MemberDao : memberList 호출 성공" +memberList );
		logger.info(memberList.toString());
		return memberList;
	}
	
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
		return result;
	}

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
		return result;
	}
	public MemberVO login(@RequestParam Map<String,Object> pMap) {
		logger.info("MemberDao : login 호출 성공");
		MemberVO mVO = null;
		mVO = sqlSessionTemplate.selectOne("login", pMap);
		
		return mVO;
	}
	public int checkIdDup(Map<String, Object> pMap) {
		logger.info("MemberDao : checkIdDup 호출 성공");
		int result = sqlSessionTemplate.selectOne("checkIdDup", pMap);
		return result;
	}

	public MemberVO getUserById(String m_id, String m_pw) {
		logger.info("MemberDao : getUserById 호출 성공");
		return sqlSessionTemplate.selectOne("getUserById", m_id);
	}
	
	public String findId(HashMap<String, String> map) {
		logger.info("MemberDao : findId 호출 성공");
		return sqlSessionTemplate.selectOne("findId",map);
		
	}
	
	public int dupId(HashMap<String, String> map) {
		logger.info("MemberDao : dupId 호출 성공");
		
		return sqlSessionTemplate.selectOne("dupId", map);
	}
	
	public int memberDelete(MemberVO mVO) {
		logger.info("MemberDao : memberDelete 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.delete("memberDelete", mVO);
		return result;
	}

	public int deleteId(String m_id) {
		logger.info("MemberDao : deleteId 호출 성공");
		return sqlSessionTemplate.delete("memberDelete",m_id);
	}

	public int selectId(String m_id, String m_pw) {
		logger.info("MemberDao : selectId 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.delete("memberDelete", m_id);   
		return result;
	}

	public int passCeck(MemberVO mVO) {
		logger.info("MemberDao : passCeck 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.delete("passCheck",mVO);
		return 0;
	}

	
	public int countSocialUser(String socialId) {
		logger.info("MemberDao : countSocialUser 호출 성공");
		return sqlSessionTemplate.selectOne("countSocialUser", socialId);
	}

	public int insertSocialUser(HashMap<String, String> map) {
		logger.info("MemberDao : insertSocialUser 호출 성공");
		return  sqlSessionTemplate.insert("insertSocialUser", map);
	}
	
	public int findPwCheck(HashMap<String, String> map) {
		logger.info("MemberDao : findPwCheck 호출 성공");
		return sqlSessionTemplate.selectOne("findPw", map);
	}
	//11.14추가함... 세션담을때 ID에 정보가...
	public MemberVO getUserById(String m_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("getUserById", m_id);
	}

	
	
	



	
	
	
	
}
