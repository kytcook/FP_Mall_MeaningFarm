package com.meaningfarm.mall.member.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.member.service.RegisterService;
@Transactional
@RequestMapping("/login/*")
@Controller
public class RegisterController {
	Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired(required=false)
	private RegisterService registerService;
	
	/* ########## 회원가입 페이지 이동 ##########*/
	/*
	 * @GetMapping("/register") public String register() { return "login/register";
	 * // WEB-INF/views/login/register.jsp }
	 */
	

	
	/* ########## 회원가입 페이지 이동 ##########*/
	@GetMapping("/register")
	public String register() {
		return "/login/register";
	}
	
	/* ########## 회원가입 폼 이동 ##########*/
	@GetMapping("/registerForm")
	public String registerForm() {
		logger.info("RegisterController : registerForm 호출 성공");
		return "/login/registerForm";
	}
	
	/* ########## 일반회원 회원가입  ##########*/
	@PostMapping("/registerForm")
	public String registerInsert(@RequestParam Map<String, Object> pMap, Model model) {
		logger.info("RegisterController : registerInsert 호출 성공"+pMap);
		int result = 0;
		result = registerService.registerInsert(pMap);
		
		return "redirect:/login/login";
	}
}
