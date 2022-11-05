package com.meaningfarm.mall.qna.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meaningfarm.mall.qna.service.QnaReplyService;
import com.meaningfarm.mall.qna.service.QnaService;
import com.vo.LikeVO;
import com.vo.PageMaker;
import com.vo.QnaReplyVO;
import com.vo.QnaVO;
import com.vo.SearchCriteria;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	Logger logger = LoggerFactory.getLogger(QnaController.class);
	//qna list뷰 띄우기
	@Autowired
	private QnaService qnaService;	
	
	@Autowired
	private QnaReplyService qrs;
	
	//게시판 리스트
	@GetMapping("/list")
	public String list(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {		
		logger.info(" get list");

		List<QnaVO> list = qnaService.list(scri);
		
		model.addAttribute("list", list);	
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker); //모델 객체에 페이지 넘기기
		
		return "qna/list";
	}
	
	
	
	
	//qna 글작성 getMapping
	@GetMapping("/writeForm")

	public String writeForm() {

		logger.info(" qna get write");

		return "qna/writeForm";

	}
	
	// 게시판 글 작성 post
		@PostMapping("/write")
		public String write(@ModelAttribute QnaVO qnaVO) throws Exception {
			logger.info("qna post write");
			// 널포인터..?
			qnaService.write(qnaVO);

			return "redirect: list";
		}
		
		//상세보기 get 221031 좋아요 추가
		@GetMapping("/read")
		public String read(@ModelAttribute QnaVO qnaVO, Model model, SearchCriteria scri) throws Exception{
			
			logger.info(" qna GET read");

			model.addAttribute("read", qnaService.read(qnaVO.getQna_no()));
			model.addAttribute("scri", scri);
			
			LikeVO like =new LikeVO();
			like.setQna_no(qnaVO.getQna_no());
			like.setM_id(qnaVO.getM_id());
			like.setLikenum(1);
			
			model.addAttribute("like", qnaService.findLike(qnaVO.getQna_no(),qnaVO.getM_id()));
			model.addAttribute("getLike", qnaService.getLike(qnaVO.getQna_no(),1));
			
			List<QnaReplyVO> replyList = qrs.readReply(qnaVO.getQna_no());
			model.addAttribute("replyList", replyList);
			
			return "/qna/read"; //상세조회 페이지로 이동
		}
		
		// 게시판 수정 get
		@GetMapping("update")
		public String update(@ModelAttribute("scri") SearchCriteria scri, QnaVO qnaVO, Model model ) throws Exception {

			logger.info("qna get update");
			
			model.addAttribute("update", qnaService.read(qnaVO.getQna_no()));
			model.addAttribute("scri", scri);
			
			return "qna/update";

		}
		
		// 게시판 수정 post 221030 추가
		@PostMapping("update")
		public String update( Model model, @ModelAttribute("scri") SearchCriteria scri, QnaVO qnaVO ,RedirectAttributes rttr) throws Exception {
			logger.info("update qna post");

			qnaService.update(qnaVO); //파라미터로 받아옴
			//잠시 일회성으로 저장해주는 rttr사용
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/qna/list";
		}
		
		//삭제 
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("delete POST로 글번호 받아옴");

			qnaService.delete(qnaVO.getQna_no());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/qna/list";
		}
		
		//댓글 작성 221030 추가
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(QnaReplyVO qnaReplyVO, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			qrs.writeReply(qnaReplyVO);
			
			rttr.addAttribute("qna_no", qnaReplyVO.getQna_no());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/read";
		}	
	
		//댓글 수정 추가 221031
		//댓글 수정 GET
		@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
		public void getReplyUpdate(@RequestParam("qnareply_no") int qnareply_no,
		      @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		 logger.info("get reply update");
		 
		 QnaReplyVO qnaReplyVO = null;
		 
		 qnaReplyVO = qrs.readReplySelect(qnareply_no);
		 
		 model.addAttribute("readReply", qnaReplyVO);
		 model.addAttribute("scri", scri);
		 
		}

		
		// 댓글 수정 POST
		@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(QnaReplyVO qnaReplyVO, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		   logger.info("reply update");
		   
		   qrs.replyUpdate(qnaReplyVO);
		   
		   rttr.addAttribute("qna_no", qnaReplyVO.getQna_no());
		   rttr.addAttribute("page", scri.getPage());
		   rttr.addAttribute("perPageNum", scri.getPerPageNum());
		   rttr.addAttribute("searchType", scri.getSearchType());
		   rttr.addAttribute("keyword", scri.getKeyword());
		   
		   return "redirect:/qna/read";
		}
		
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(QnaReplyVO qnaReplyVO, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", qrs.readReplySelect(qnaReplyVO.getQnareply_no()));
			model.addAttribute("scri", scri);
			

			return "qna/replyDeleteView";
		}
		
		
		
		// 댓글 삭제 POST
		@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
		public String replyDelete(QnaReplyVO qnaReplyVO, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		   logger.info("reply delete");
		   
		   qrs.replyDelete(qnaReplyVO);
		   
		   rttr.addAttribute("qna_no", qnaReplyVO.getQna_no());
		   rttr.addAttribute("page", scri.getPage());
		   rttr.addAttribute("perPageNum", scri.getPerPageNum());
		   rttr.addAttribute("searchType", scri.getSearchType());
		   rttr.addAttribute("keyword", scri.getKeyword());
		   
			return "redirect:/qna/read";
		}
		

//좋아요 업다운 추가 221031
		
	@ResponseBody 
	@PostMapping("/likeUp")
	public void likeup(@RequestBody LikeVO vo) throws Exception {
		System.out.println("컨트롤러 연결 성공");
		System.out.println(vo.getQna_no());
		System.out.println(vo.getM_id());
		System.out.println(vo.getLikenum());
		
		qnaService.likeUp(vo.getQna_no(), vo.getM_id(),vo.getLikenum());
	
	}
	
	@ResponseBody
	@PostMapping("/likeDown")
	public void likeDown(@RequestBody LikeVO vo) throws Exception  {
		System.out.println("컨트롤러 연결 성공");
		System.out.println("좋아요 싫어요!");
		System.out.println(vo.getQna_no());
		System.out.println(vo.getM_id());
		System.out.println(vo.getLikenum());
		qnaService.likeDown(vo.getQna_no(), vo.getM_id(),vo.getLikenum());
	}
		
		
		
}
