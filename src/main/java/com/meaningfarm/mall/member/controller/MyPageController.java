package com.meaningfarm.mall.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.meaningfarm.mall.member.service.MemberService;
import com.meaningfarm.mall.member.service.MyPageService;
import com.vo.CartVO;
import com.vo.MemberVO;
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService mypageService;

	@Autowired(required=false)
	MemberVO mVO;
	
	@GetMapping("/myinfo")
	public String myinfo(Model model, @RequestParam Map<String,Object> mMap, HttpServletRequest req) {
		logger.info("MyPageController : myinfo 호출 성공"+mMap);
		
		List<Map<String,Object>> myinfo = null;
		myinfo = mypageService.myinfo(mMap);
		model.addAttribute("myinfo",myinfo);
		logger.info("myinfo"+myinfo);
		logger.info("MyPageController : myinfo 호출 성공" + myinfo.toString());
		return "myPage/mypage2";
	}  
	
	@GetMapping("/updatemyinfo")
	public String updatemyinfo() {
		logger.info("MyPageController : Get요청 _ updatemyinfo 호출 성공");
		
		return "myPage/updatemyinfo";
		//String path = "redirect:mypage2";
		//return path;
	}
	
	@PostMapping("/updatemyinfo")
	public String updatemyinfo(@RequestParam Map<String,Object> mMap, Model model, HttpServletRequest request) {
		logger.info("MyPageController : Post요청 _ updatemyinfo 호출 성공");
		int result = mypageService.updatemyinfo(mMap);
		
		model.addAttribute("myinfo");
		//return "myPage/updatemyinfo";
		
		String path = "redirect:mypage2";
		return path;
	}
	
	
	
	
		
		
}
