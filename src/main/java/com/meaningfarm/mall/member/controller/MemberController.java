package com.meaningfarm.mall.member.controller;
/* 홈페이지 : home.jps   views아래에 있음 */

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meaningfarm.mall.member.service.MemberService;
import com.vo.MemberVO;

@Controller
@RequestMapping("/member")
//@SessionAttributes({ "m_id", "m_pw" })   /* @@@@@@ 이걸 붙이니까 아이디찾기때 자동 세션 부여됨... @@@@@*/
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
			HttpServletRequest req, HttpServletResponse res, String toURL, MemberVO member) throws Exception {
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
			//MemberVO mVO1 = (MemberVO) session.setAttribute("mVO",mVO1);
			model.addAttribute("mVO", mVO);
			
			session.setMaxInactiveInterval(60*6*8); // 8시간 동안 세션상태유지 생략하면 30분유지
			session.setAttribute("m_id", mVO.getM_id());
			session.setAttribute("m_pw", mVO.getM_pw());
			session.setAttribute("m_name", mVO.getM_name());
			
			session.setAttribute("mVO", mVO); // 11.13 잠시추가함
			
		}
		return "redirect:/";
	}

	/* ########## [[ 로그인 유효성 검사 ]] ########## */
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

	
	/* ########## [[ 카카오 로그인 ]] ########## */
//	@RequestMapping("kakaologin")
//	public String kakaoLogin(HttpServletRequest req,
//							@RequestParam("kakaoId") String kakaoId,
//							@RequestParam("kakaoNickname") String kakaoNickname, Model model) {
//		if(kakaoId != null) {
//			HttpSession session = req.getSession();
//			session.setAttribute("kakaoId",  kakaoId);
//			session.setAttribute("kakaoNickname", kakaoNickname);
//			return "/";
//		}else {
//			model.addAttribute("msg", "로그인 실패");
//			return "common/errorPage";
//				
//		}
//	}
//	
	
	/* ########## [[ 카카오 로그인 - 있냐없냐 ]] ########## */
//	@ResponseBody 
//	@GetMapping("countSocialUser")
//	public String countKakaoUser(HttpServletRequest request,
//								@RequestParam("socialId") String socialId,
//								@RequestParam("socialNickname") String socialNickname,  Model model) {
//		if(socialId != null && socialNickname != null) {
//			int result= memberService.countSocialUser(socialId);
//			
//			if (result == 0) {
//				HashMap<String, String> map = new HashMap<String, String>();
//				map.put("socialId", socialId);
//				map.put("socialNickname", socialNickname);
//				String socialPw = null;
//				map.put("socialPw", socialPw);
//				//map.put("socialPw", socialPw);
//				int insertResult= memberService.insertSocialUser(map);
//				if (insertResult>0) {
//					return "success";
//				}else {
//					System.out.println("insertResult:"+insertResult);
//					return "fail";
//				}
//			}else {
//				return "success";
//			}
//		}else {
//			return "fail";
//		}
//	}	
//	
	// 구글 로그인
	@GetMapping("/googlelogin")
	public String googleLogin(HttpServletRequest request, @RequestParam("googleId") String googleId,
			@RequestParam("googleName") String googleName, Model model) {
		if (googleId != null) {
			HttpSession session = request.getSession();
			session.setAttribute("googleId", googleId);
			session.setAttribute("googleName", googleName);
			return "/";
		} else {
			model.addAttribute("msg", "구글로그인 실패");
			return "common/errorPage";
		}
	}	
	
	
	
	
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
		//return path;
		return "member/joinresult";
		
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

	/* ########## [[ 전체회원 목록 ]] ########## */
	@GetMapping("/memberList")
	public String memberList(Model model, @RequestParam Map<String,Object> pMap) {
		logger.info("MemberController : memberList호출 성공");
		List<Map<String,Object>> memberList = null;
		memberList =memberService.memberList(pMap);
		model.addAttribute("memberList", memberList);
		// logger.info(memberService.memberList().toString());
		//logger.info("MemberController : memberList 호출 성공" + memberList().toString());
		return "member/memberList";
	}
	
	/* ########## [[ 모든 회원 상세보기- memberDetail ]]  ########## */
	@GetMapping("memberDetail")
	public String memberDetail(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("MemberController : memberDetail 호출 성공");
		List<Map<String, Object>> memberList = null;
		memberList = memberService.memberDetail(pMap);
		model.addAttribute("memberList", memberList);
		//return "member/memberDetail";
		return "member/memberDetail";
	}

	/* ########## [[ 아이디 중복검사 ]] ########## */
	@ResponseBody 
	@RequestMapping("/dupId")
	public int checkIdDup(@RequestParam Map<String, Object> pMap) {
		logger.info("MemberController : checkIdDup 호출 성공");
		int result = memberService.checkIdDup(pMap);
		// return memberService.checkIdDup(m_id)+"";
		return result;
	}
	
	/* ########## [[ 회원 탈퇴 전 비밀번호 입력하는 부분 ]]  ########## */
	@RequestMapping("/writepw")
	public String writepw() {
		
		return "myPage/memberDelete";
				
	}
	
	/* ########## [[ 회원 탈퇴 - memberDelete ]]  ########## */
	
	//@ResponseBody
	@PostMapping("/memberDelete")
	public String memberDelete(@RequestBody MemberVO mVO, HttpSession session) {
		logger.info("MemberController : memberDelete 호출 성공"+mVO.getM_id());
		int result = 0;
		result = memberService.memberDelete(mVO);	
		String path = "/";
		if(result == 1) {
			//session.invalidate();
			return path;
			
		}else{
			return "redirect:common/errorPage.jsp";
		}
		
	}
	
	/* ########## [[ 회원 탈퇴 전 비밀번호 체크 <-- 필요없는 코드가 되어버렸음 ]] ########## */
	@ResponseBody
	@RequestMapping("pwCheck")
	public int passChect(MemberVO mVO) {
		int result = memberService.passCheck(mVO);
		return result;
	}
	

	/* ########## [[ 아이디 찾기 ]]  ########## */
	@GetMapping("/findId")
	public String findId() {
		logger.info("MemberController : findId 호출 성공");
		return "member/findId";
	}
	@PostMapping("/findId")
	public String findId(@RequestParam("m_name") String m_name, @RequestParam("m_email") String m_email, Model model) {
		logger.info("MemberController : findID 호출 성공");
	
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		
		String m_id =  memberService.findId(map);
		if(m_id != null) {
			
			model.addAttribute("m_name", m_name);
			model.addAttribute("m_id", m_id);
			return "member/findIdResult";
		}else {
			model.addAttribute("msg", "아이디찾기 실패");
			return "common/errorPage";
		}
	}

	@ResponseBody
	@GetMapping("/dupfindId")
	public String findId(@RequestParam("m_name") String m_name, @RequestParam("m_email") String m_email) {
		logger.info("MemberController : findId 호출 성공");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		
		int dupId = memberService.dupId(map);
		if(dupId == 0) {
			return 0+"";
		} else {
			return 1+"";
		}
		
	}

	/* ########## [[ 비밀번호 찾기 ]]  ########## */
	@GetMapping("/findPw")
	public String findPw() {
		logger.info("MemberController : findPw 호출 성공");
		return "member/findPw";
	}
	
	@GetMapping("/dupfindPw")
	public String findPwCheck(@RequestParam("m_id") String m_id, @RequestParam("m_email") String m_email) {
		logger.info("MemberController : findPwCheck 호출 성공");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_email", m_email);
		int findPwCheck = memberService.findPwCheck(map);
		if(findPwCheck == 0){
			return 0+"";
		}else {
			return 1+"";
		}		
	}
	//메일보내기
	@PostMapping("/sendEmail")
	public String sendEmail(@RequestParam("m_email") String m_email, @RequestParam("m_id") String m_id, Model model) {
		logger.info("MemberController : sendEmail 호출 성공");
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "kimgy44@naver.com"); // 서버 아이디만 쓰기(발신인 이메일)
		props.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP
		props.put("mail.smtp.port", "465");  //네이버포트 
		props.put("mail.smtp.starttls.enable", "true"); // true
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true"); //////////////
		props.put("mail.transport.protocol","smtp" ); 
		
		// 메일 인증
		Authenticator auth = new MyAuthentication();
		Session session = Session.getDefaultInstance(props); // getInst...
		
		session.setDebug(true); // 메일 전송 시 상세상황 콘솔에 출력 ///////////
		MimeMessage msg = new MimeMessage(session);
		int randomCode = 0;
		try { 
			// 편지 보낸 시간
			msg.setSentDate(new Date());
			
			InternetAddress from = new InternetAddress("kimgy44@naver.com"); //보내는 사람(메일주소?)
		
			// 이메일 발신자
			msg.setFrom(from);
			
			// 이메일 수신자
			String email = m_email; // 사용자가 입력한 이메일 받아오기
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 이메일 제목
			msg.setSubject("[MeaningFarm] 인증코드 메일입니다.", "UTF-8");
			
			// 이메일 내용
			randomCode = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
						// 5자리 숫자로 이루어진 인증번호 랜덤 생성
			//String code = request.getParameter("code-check");
			String content = "인증코드는 " + randomCode + " 입니다."; // 인증번호 값 받기
			msg.setText(content, "UTF-8");
			
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			
			// 메일 보내기
			Transport.send(msg);
			System.out.println("보냄!!");
		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		}catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		}
		
		model.addAttribute("m_id", m_id);
		model.addAttribute("m_email", m_email);
		model.addAttribute("randomCode", randomCode);
		return "member/findPw";
	}	
	
	
	// 아이디 패스워드 인증받기 함수 국.ㄹ...
	class MyAuthentication extends Authenticator{
		PasswordAuthentication pa;
		public MyAuthentication() {
			String id = "kimgy44"; //  ID(발신인 이메일-도메인 제외)
			String pw = ""; // 비밀번호(발신인 이메일 비번)
			// ID와 비밀번호 입력하기
//			pa = new PasswordAuthentication(id, pw);
		}
		// 시스템에서 사용하는 인증정보
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}	
	
	
}
