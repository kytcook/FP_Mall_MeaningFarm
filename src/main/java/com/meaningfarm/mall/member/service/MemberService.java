package com.meaningfarm.mall.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.member.dao.MemberDao;
import com.vo.MemberVO;

@Service
public class MemberService {
	Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired(required=false)
	private MemberDao memberDao;

	/* ########## [[ 일반회원 회원가입 ]] ########## */
	public int register(Map<String, Object> pMap) {
		logger.info("MemberService : register 호출 성공");
		int result = 0;
		result = memberDao.register(pMap);
		return result;
	}
	/* ########## [[ 회원 목록]]  ########## */
	public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
		List<Map<String,Object>> memberList = null;
		memberList = memberDao.memberList(pMap);
		logger.info("MemberService : memberList 호출 성공"+memberList);
		logger.info("MemberService : memberDetail 호출 성공");
		return memberList;
	}
	/* ########## [[ 모든 회원 상세보기- memberDetail ]]  ########## */
//	public List<Map<String, Object>> memberDetail(Map<String, Object> pMap) {
//		logger.info("MemberService : memberDetail 호출 성공");
//		List<Map<String,Object>> memberAllList = null;
//		memberAllList = memberDao.memberList(pMap);
//		return memberAllList;
//	}
	public List<Map<String, Object>> memberDetail(Map<String, Object> pMap) {
		logger.info("MemberService : memberDetail 호출 성공");
		List<Map<String,Object>> memberList = null;
		memberList = memberDao.memberList(pMap);
		return memberList;
	}
	
	/* ########## [[ 판매자 회원가입 ]] ########## */
	public int sregister(Map<String, Object> pMap) {
		logger.info("MemberService : sregister 호출 성공");
		int result = 0;
		result = memberDao.sregister(pMap);
		return result;
	}
	/* ########## [[ 로그인 요청 ]] ########## */
	public MemberVO login(@RequestParam Map<String,Object> pMap) {
		logger.info("MemberService : login 호출 성공");
		
		MemberVO mVO = null;
		mVO = memberDao.login(pMap);
		
		return mVO;
	}
	/* ########## [[ 아이디 중복검사]]  ########## */
	public int checkIdDup(Map<String, Object> pMap) {
		logger.info("MemberService : checkIdDup 호출 성공");
		int result = memberDao.checkIdDup(pMap);
		return result;
	}
	
	/* ########## [[ 로그인 유효성 검사 - ajax -- 이거 잠시 보류되었음..... ajax........... ]] ########## */
	public MemberVO getUserById(String m_id, String m_pw) {
		logger.info("MemberService : getUserById 호출 성공");
		return memberDao.getUserById(m_id, m_pw);
	}
	
	/* ########## [[ 회원 탈퇴 - memberDelete ]]  ########## */
	public int memberDelete(MemberVO mVO) {
		logger.info("MemberService : memberDelete 호출 성공");
		int result = 0;
		result = memberDao.memberDelete(mVO);
		return result;
	}

	
	public int deleteId(String m_id) {
		return memberDao.deleteId(m_id);
	}
	public int selectId(String m_id, String m_pw) {
		return memberDao.selectId(m_id, m_pw);
	}
	public int passCheck(MemberVO mVO) {
		logger.info("MemberService : passCheck 호출 성공");
		int result = memberDao.passCeck(mVO);
		return result;
	}
	public int countSocialUser(String socialId) {
		return memberDao.countSocialUser(socialId);
	}
	public int insertSocialUser(HashMap<String, String> map) {
		return memberDao.insertSocialUser(map);
	}
	
	
	



}
