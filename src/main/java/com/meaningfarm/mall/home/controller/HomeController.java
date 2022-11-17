package com.meaningfarm.mall.home.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.home.service.MainProductService;


@Controller
@RequestMapping("/")
public class HomeController {
	Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired(required = false)
	private MainProductService mproductService = null;
	
	/////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 목록 --------------------------*/
	@GetMapping("/home")
//	@RequestMapping(value="/", method={RequestMethod.GET})
	public String mainProductList(Model model,@RequestParam Map<String, Object> pMap) {
	logger.info("productList 호출 성공");
	List<Map<String, Object>> mainProductList = null;
	mainProductList = mproductService.mainProductList(pMap);
	model.addAttribute("mainProductList", mainProductList);
//	return "forward:/resources/layout/main.jsp";
	return "forward:./index.jsp";
	}
}
