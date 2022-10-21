package com.meaningfarm.mall.product;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	Logger logger = LoggerFactory.getLogger(ProductService.class);
	
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductVO> productList() {
		List<ProductVO> productList = null;
		productList = productDAO.productList();
		logger.info("ProductService productList " + productList);
		return productList;
	}
	
	public ProductVO productDetail(int product_no) {
		logger.info("ProductService productDetail");
		ProductVO productDetail = productDAO.productDetail(product_no);
		return productDetail;
	}
	
	public int productInsert(ProductVO productVO) {
		logger.info("ProductService productInsert");
		int result = productDAO.productInsert(productVO);
		logger.info("result " + result);
		return result;
	}
	
	public void productUpdate(ProductVO productVO) {
		productDAO.productUpdate(productVO);
	}
	
	public void productDelete(int product_no) {
		productDAO.productDelete(product_no);
	}
	
	public List<OptionVO> optionList() {
		List<OptionVO> optionList = null;
		optionList = productDAO.optionList();
		logger.info("ProductService optionList " + optionList);
		return optionList;
	}
	
//	public List<Map<String, Object>> optionList(Map<String, Object> optionListMap) {
//		logger.info("ProductService optionList");
//		List<Map<String, Object>> optionList = null;
//		optionList = productDAO.optionList(optionListMap);
//		return optionList;
//	}
	
	public int optionInsert(OptionVO optionVO) {
		logger.info("ProductService optionInsert");
		int result = productDAO.optionInsert(optionVO);
		return result;
	}
}
