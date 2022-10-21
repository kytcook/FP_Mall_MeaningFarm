package com.meaningfarm.mall.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meaningfarm.mall.notice.domain.NoticeVO;
import com.meaningfarm.mall.notice.service.NoticeService;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {

	@Inject
	private NoticeService service;

	private Logger logger = LoggerFactory.getLogger(NoticeController.class);

	// 글 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(NoticeVO notice, Model model) throws Exception {
		logger.info("get list");

		List<NoticeVO> list = service.list();

		model.addAttribute("list", list);
	}

	// 글 작성 get

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGet(HttpSession session, Model model) throws Exception {
		logger.info("get register");

		Object loginInfo = session.getAttribute("member");

	}

	// 글 작성 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(NoticeVO notice) throws Exception {
		logger.info("post write");
		
		service.register(notice);
		
		logger.info("notice: "+notice);
		
		return "redirect:/notice/list";
	}
}
