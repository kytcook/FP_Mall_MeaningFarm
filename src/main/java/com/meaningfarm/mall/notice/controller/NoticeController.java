package com.meaningfarm.mall.notice.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meaningfarm.mall.member.dao.MemberDao;
import com.meaningfarm.mall.notice.service.NoticeService;
import com.vo.MemberVO;
import com.vo.NoticeVO;
import com.vo.PageMaker;
import com.vo.SearchCriteria;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	NoticeService service;

	// 검색+ 페이징 + 목록 리스트 보여주기(211025)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model,  @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		logger.info(" get list");

		List<NoticeVO> list = service.list(scri);

		model.addAttribute("list", list);
		
		//페이지메이커 새객체생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/list";
	}

//글 작성 get

	@GetMapping("/writeForm")

	public String writeForm() {

		logger.info("get write");

		return "notice/writeForm";

	}
	
// 게시판 글 작성 post 
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("post write");
		
		// 널포인터..?
		service.write(noticeVO, mpRequest);

		return "redirect:/notice/list";
	}

	// 게시판 조회
	@GetMapping("read")
	public String read(@ModelAttribute NoticeVO noticeVO, Model model, @ModelAttribute("scri")SearchCriteria scri) throws Exception {
		logger.info(" GET read");

		model.addAttribute("read", service.read(noticeVO.getNotice_no()));
		model.addAttribute("scri", scri); // 수정 삭제 처리후 그페이지로 돌아가게함
	
		List<Map<String, Object>> fileList = service.selectFileList(noticeVO.getNotice_no());
		model.addAttribute("file", fileList); //jsp로 el태그 file로 넘겨서 씀 글번호의 첨부파일내용 씀
		model.addAttribute("move", service.movePage(noticeVO.getNotice_no()));
		return "/notice/read"; //상세조회 페이지로 이동
	}
	
	//파일다운
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String noticefile_rename = (String) resultMap.get("NOTICEFILE_RENAME");
		String noticefile_name = (String) resultMap.get("NOTICEFILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+noticefile_rename));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(noticefile_name, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	// 게시판 수정 get
	@GetMapping("update")
	public String update(@ModelAttribute NoticeVO noticeVO, @ModelAttribute("scri")SearchCriteria scri, Model model) throws Exception {

		logger.info("get update");
		model.addAttribute("update", service.read(noticeVO.getNotice_no()));
		model.addAttribute("scri", scri); //수정 삭제시 그 페이지로 돌아가기 위해 추가
		
		List<Map<String,Object>> fileList = service.selectFileList(noticeVO.getNotice_no());
		model.addAttribute("file", fileList);
		
		return "notice/update";

	}

	// 게시판 수정 post
	@PostMapping("update")
	public String update(@ModelAttribute NoticeVO noticeVO, @ModelAttribute("scri")SearchCriteria scri, 
						RedirectAttributes rttr, @RequestParam(value="fileNoDel[]") String[] files, 
						@RequestParam(value="fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("update post");

		service.update(noticeVO, files, fileNames, mpRequest); //파라미터로 받아옴
		//잠시 일회성으로 저장해주는 rttr사용
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/notice/list";
	}

	// 게시판 삭제(221024 성공)

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(NoticeVO noticeVO, @ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr ) throws Exception {
		logger.info("delete POST로 글번호 받아옴");

		service.delete(noticeVO.getNotice_no());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list";
	}

}