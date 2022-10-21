package com.meaningfarm.mall.member.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.member.dao.LoginDao;
import com.vo.MemberVO;

@Service
public class LoginService {
	Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired(required=false)
	private LoginDao loginDao;

	public static MemberVO login(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		
		// vo.set.-- = 0; or 자스에서 하던가 ==> 근데 화면에다가 하는게 나음 44
		// submit 하기전에 if문 ,, ,  -- 자스로 하자
		
		return null;
	}
	
}
