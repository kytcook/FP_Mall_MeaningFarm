package com.meaningfarm.mall.product;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
//	@GetMapping("/list")
//	public void productList() {
//		logger.info("게시판 목록");
//	}
	// product 상품 목록 페이지 띄우기
	@GetMapping("/productlist")
	public String productList(Model model) {
		logger.info("ProductController productList");
		model.addAttribute("productSelectAll", productService.productList());
		logger.info(productService.productList().toString());
		return "product/productlist";
	}
	// product 상품 등록 창 띄우기
	@GetMapping("/write")
	public void productWrite() {
		logger.info("글 작성");
	}
	// product 상품 등록 버튼 누를 때
	@PostMapping("/write")
	public String productInsert(ProductVO productVO) {
		logger.info("글 작성 버튼 누름 ProductVO " + productVO);
		productService.productInsert(productVO);
		return "redirect:/product/productlist";
	}
	// product 상품 상세 창으로 가는 거
	@GetMapping("/productdetail")
	public String productDetail(ProductVO productVO, Model model) {
		logger.info("ProductController productDetail");
		model.addAttribute("productSelectOne", productService.productDetail(productVO.getProduct_no()));
		return "product/productdetail";
	}
	// product 상품 수정
	@PostMapping("/productupdate")
	public String productUpdate(ProductVO productVO) {
		logger.info("ProductController productUpdate");
		productService.productUpdate(productVO);
		return "redirect:/product/productlist";
	}
	// product 상품 삭제
	@PostMapping("/productdelete")
	public String productDelete(ProductVO productVO) {
//		logger.info("ProductController productDelete");
		logger.info("ProductController productDelete " + productVO);
		productService.productDelete(productVO.getProduct_no());
		return "redirect:/product/productlist";
	}
	// product 옵션 설정 창으로 이동
	@RequestMapping("/product/optionpopup")
	public String optionPopup() {
		return "product/optionpopup";
	}
	// option 목록 창으로 이동
	@GetMapping("/optionlist")
	public String optionList(Model model) {
		logger.info("ProductController optionList");
		model.addAttribute("optionSelectAll", productService.optionList());
		logger.info(productService.optionList().toString());
		return "product/optionlist";
	}
	
//	@GetMapping("/optionpopup")
//	public String optionList(@RequestParam Map<String, Object> optionListMap, Model model) {
//		logger.info("ProductController optionList " + optionListMap.toString());
//		List<Map<String, Object>> optionList = null;
//		optionList = productService.optionList(optionListMap);
//		logger.info("ProductController optionList " + optionListMap.toString());
//		return "forward:optionpopup";
//	}
	// option 등록 창 띄우기
	@GetMapping("/optioninsert")
	public void optionInsert() {
		logger.info("ProductController get-optioninsert");
	}
	// option 등록 버튼 누를 때
	@PostMapping("/optioninsert")
	public String optionInsert(OptionVO optionVO) {
		logger.info("글 작성 버튼 누름 OptionVO " + optionVO);
		productService.optionInsert(optionVO);
		return "redirect:/product/optionpopup";
	}
}
