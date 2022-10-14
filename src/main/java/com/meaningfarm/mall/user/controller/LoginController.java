package com.meaningfarm.mall.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/* ########## 로그인 페이지 ##########*/
	@GetMapping("/login")
	public String loginForm() {
		return "loginForm";
	}
}
