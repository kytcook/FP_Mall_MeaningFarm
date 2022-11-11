package com.meaningfarm.mall.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.meaningfarm.mall.member.service.MyPageService;
import com.vo.MemberVO;
//@SessionAttributes({ "m_id", "m_pw" })
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService mypageService;
	/* 마이페이지 - 사용저ㅏ정보 / 개인정보 / 주문 배송 / 정보수정 / 장바구니 / 구매내역/ 문의내역*/
	public MyPageController(MyPageService mypageService) {
		this.mypageService = mypageService;
	}
	
	/* ########## [[ 회원 정보 ]]  ########## */
	@GetMapping("/myinfo")
	public String myinfo(Model m, HttpSession session) throws Exception{
		logger.info("MyPageController : myinfo 호출 성공");
		MemberVO member = (MemberVO) session.getAttribute("MemberVO");
		
		List<MemberVO> myinfo = null;
		if(member != null) {
			String id = member.getM_id();
			myinfo = mypageService.mList(id);
			logger.info("member"+id);
		}
		logger.info("myinfo, controller"+myinfo);
		m.addAttribute("myinfo",myinfo);
//		return "myPage/myInfo";
		return "myPage/mypage2";
	}

}
