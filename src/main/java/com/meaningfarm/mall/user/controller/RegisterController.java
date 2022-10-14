package com.meaningfarm.mall.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class RegisterController {
	Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	public String register() {
		return "RegesterForm";  // WEB-INF/views/registerForm.jsp
	}
}
