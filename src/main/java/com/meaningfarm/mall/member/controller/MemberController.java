package com.meaningfarm.mall.member.controller;
/* 홈페이지 : home.jps   views아래에 있음 */
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meaningfarm.mall.member.service.MemberService;
import com.vo.MemberVO;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "m_id", "m_pw" })
public class MemberController {
	Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	// http://localhost/mall/member/memberDelete?id=kimgy44


	/* ########## [[ 로그인 화면 ]] ########## */
	@GetMapping("/login")
	public String loginForm() {
		logger.info("MemberController : login - GET 호출 성공");
		return "member/loginForm";
	}

	/* ########## [[ 로그인 요청 ]] ########## */
	@PostMapping("/login")
	public String login(HttpSession session, @RequestParam Map<String, Object> pMap, RedirectAttributes rtt, Model model,
			HttpServletRequest req, HttpServletResponse res, String toURL) throws Exception {
		logger.info("MemberController : login 호출 성공");
		String m_id = req.getParameter("m_id");
		String m_name = req.getParameter("m_name");
		String m_pw = req.getParameter("m_pw");
		logger.info("MemberController : login 호출 성공  ===> 로그인한 사용자 아이디 ==>>>"+m_id);
		logger.info("MemberController : login 호출 성공  ===> 로그인한 사용자 비밀번호 ==>>>"+m_pw);


		MemberVO mVO = null;
		mVO = memberService.login(pMap);

		if (mVO == null) { // 일치하지 않을 경우
			String msg = URLEncoder.encode("id 또는 password가 일치하지 않습니다.", "utf-8");
			rtt.addFlashAttribute("msg", msg);
			int result = 0;
			rtt.addFlashAttribute("result", result);

			return "redirect:/member/login";

		}
		if (mVO != null) { // (일치하면) 널이 아니면 세션담기 // 로그인 성공 !!!!!!!!!!!
			
			model.addAttribute("mVO", mVO);
			//session = req.getSession();
			session.setMaxInactiveInterval(60*6*8); // 8시간 동안 세션상태유지 생략하면 30분유지
			session.setAttribute("m_id", mVO.getM_id());
			session.setAttribute("m_pw", mVO.getM_pw());
			session.setAttribute("m_name", mVO.getM_name());
		}
		return "redirect:/";
	}

	/* ########## [[ 로그인 유효성 검사 - ajax .... 우선 보류]] ########## */
	@ResponseBody
	@GetMapping("/duplogin")
	public String dupLogin(@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw) {
		logger.info("MemberController : dupLogin 호출 성공");

		MemberVO user = memberService.getUserById(m_id, m_pw);
//		String pw = user.getM_pw();
//		String id = user.getM_id();
		if (user == null) {
			return 2 + "";
		} else {
			return 1 + "";
		}
	} // end of loginDuplicateCheck

	
	/* ########## [[ 로그아웃 ]] ########## */
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req) {
		String path = "";
		session.invalidate();
		return path;
	}

	/* ########## [[ 회원가입 화면 ]] ########## */
	@GetMapping("/join")
	public String join() {
		logger.info("MemberController : join 호출 성공");
		return "/member/register";
	}

	/* ########## [[ 일반회원 회원가입 ]] -> 폼으로 이동시 Get! ########## */
	@GetMapping("/registerForm")
	public String register() {
		logger.info("MemberController : register - Get 호출 성공");
		return "/member/registerForm2";
	}

	/* ########## [[ 일반회원 회원가입 ]] -> 버튼 눌렀을 때 Post! ########## */
	@PostMapping("/registerForm")
	public String register(@RequestParam Map<String, Object> pMap, Model model) {
		logger.info("MemberController : register - Post 호출 성공" + pMap);

		int result = 0;
		String path = null;
		if (result == 1) {
			// path = "member/loginForm";
			path = "member/login";
		} else {
			path = "redirect:/member/registerForm";
		}

		result = memberService.register(pMap);
		return path;
	}

	/* ########## [[ 판매자 회원가입 ]] -> 폼으로 이동시 Get! ########## */
//	@GetMapping("/sregisterForm")
	public void sregister() {
		logger.info("MemberController : sregister - Get 호출 성공");
	}

	/* ########## [[ 판매자 회원가입 ]] -> 버튼 눌렀을 때 Post! ########## */
	@PostMapping("/sregisterForm")
	public String sregister(@RequestParam Map<String, Object> pMap, Model model) {
		logger.info("MemberController : sregister - Post 호출 성공" + pMap);

		int result = 0;
		String path = null;
		if (result == 1) {
			path = "member/loginForm";
		} else {
			path = "redirect:/member/sregisterForm";
		}

		result = memberService.sregister(pMap);
		return path;
	}

	/* ########## [[ 회원 목록 ]] ########## */
	@GetMapping("/memberList")
	public String memberList(Model model) {
		logger.info("MemberController : memberList호출 성공");
		model.addAttribute("memberListAll", memberService.memberList());
		// logger.info(memberService.memberList().toString());
		logger.info("MemberController : memberList 호출 성공" + memberService.memberList().toString());
		return "member/memberList";
	}

	/* ########## [[ 아이디 중복검사 ]] ########## */
	@ResponseBody 
	@RequestMapping("/dupId")
//	public int checkIdDup(@RequestParam("m_id") String m_id) {
	public int checkIdDup(@RequestParam Map<String, Object> pMap) {
		logger.info("MemberController : checkIdDup 호출 성공");
		int result = memberService.checkIdDup(pMap);
		// return memberService.checkIdDup(m_id)+"";
		return result;
	}

	/* ########## [[ 회원 탈퇴 - memberDelete ]]  ########## */
	@GetMapping("/memberDelete")
	public Object memberDelete(@RequestParam Map<String, Object> pMap,HttpSession session, HttpServletRequest req) {
		logger.info("MemberController : memberDelete 호출 성공");
		String path = null;
		String m_id = req.getParameter("m_id");
		logger.info("MemberController : memberDelete 호출 성공  ===> 탈퇴할 사용자 아이디 ==>>>"+m_id);


		//mVO = memberService.login(pMap);

		if (m_id == null) { // 일치하지 않을 경우
			return "redirect:/myPage/myPage";
		} else {
			int result = 0;
			result = memberService.memberDelete(pMap);
			session.invalidate();
		}
		return "myPage/memberDelete";
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ########## [[ 아이디 찾기 폼 ]] ########## */
	@RequestMapping("/findIdForm")
	public String findIdForm() {
		logger.info("MemberController : findIdForm 호출 성공");
		return "/member/findId";
	}

	/* ########## [[ 아이디 찾기 ]] - 이름 / 전화번호 / 이메일   ---- 이거 잠시 보류!!!!!!!!!!!!!!!!!!!!!!! ########## */
	@ResponseBody
	@RequestMapping("/findId")
	public String findId(@RequestParam Map<String, Object> pMap, HttpServletRequest req) {
		logger.info("MemberController : findId 호출 성공");
		String m_id = req.getParameter("m_id");
		String m_pw = req.getParameter("m_pw");
//		System.out.println("member의 번호="+memPhone);
//		if(memberService.findId(memName, memPhone)==null) {
//			return null; 
//		}else {
//			return memberService.findId(memName, memPhone).getMemEmail();
//		}
		return "/member/findId";
	}

	
	
	
}
