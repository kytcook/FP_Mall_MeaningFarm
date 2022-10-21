package com.meaningfarm.mall.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.member.service.LoginService;
import com.vo.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired(required=false)
	private LoginService service;
	
	/* ########## 로그아웃 ##########*/
	
	
	/* ########## 로그인 페이지 ##########*/
	
	// 원래는 Post방식이지만, 단위테스트로 인해서 Get으로!!!!!
	//localhost/mall/login/login
	@GetMapping("/login") 
	public Object login(HttpSession session, @RequestParam Map<String, Object> pMap) {
	// (파라미터를 통해서) 사용자로부터 아이디와 비번받기
	// 세션필요
		logger.info("LoginController : login호출 성공"+pMap );
		
		MemberVO mVO;
		mVO = LoginService.login(pMap);
		
		return "/login/login";
	}
	
	/* ########## 로그인 페이지 ##########*/
	
}
