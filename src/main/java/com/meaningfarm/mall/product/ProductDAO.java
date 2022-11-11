package com.meaningfarm.mall.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	Logger logger = LoggerFactory.getLogger(ProductDAO.class);
	
	@Autowired
	SqlSessionTemplate sst;
	
	public List<ProductVO> productList() {
		List<ProductVO> productList = null;
		productList = sst.selectList("productSelectAll");
		logger.info("ProductDAO productList " + productList);
		return productList;
	}
	
	public ProductVO productDetail(int product_no) {
		logger.info("ProductDAO productDetail product_no " + product_no);
		return sst.selectOne("productSelectOne", product_no);
	}
	
	public int productInsert(ProductVO productVO) {
		logger.info("ProductDAO productInsert");
		int result = 0;
		result = sst.insert("productInsert", productVO);
		logger.info("ProductDAO productInsert result " + result);
		return result;
	}
	
	public int productUpdate(ProductVO productVO) {
		logger.info("ProductDAO productUpdate " + productVO);
		return sst.update("productUpdate", productVO);
	}
	
	public void productDelete(int product_no) {
		logger.info("ProductService productDelete " + product_no);
		sst.delete("productDelete", product_no);
	}
	
	
	
	
	public List<CategoryLocalVO> CLList() {
		List<CategoryLocalVO> CLList = null;
		CLList = sst.selectList("selectCategoryLocal");
		return CLList;
	}
	
	public List<CategoryTypeVO> CTList() {
		List<CategoryTypeVO> CTList = null;
		CTList = sst.selectList("selectCategoryType");
		return CTList;
		
	}
	
	public List<ProductFileVO> productfileList(int product_no) {
		logger.info("ProductDAO productfileList product_no " + product_no);
		return sst.selectList("productfileList", product_no);
//		return sst.selectOne("productfileList", product_no);
	}
	
	public int productfileInsert(ProductFileVO productfileVO) {
		logger.info("ProductDAO productfileInsert");
		int result = 0;
		result = sst.insert("productfileInsert", productfileVO);
		logger.info("ProductDAO productfileInsert result " + result);
		return result;
	}

	public void productfileDelete(int product_no) {
		logger.info("ProductDAO productfileDelete " + product_no);
		sst.delete("productfileDelete", product_no);
	}
	
	public void productfileDeleteOne(int product_no) {
		logger.info("ProductDAO productfileDeleteOne " + product_no);
		sst.delete("productfileDeleteOne", product_no);
	}
	
	// 게시물 목록 조회
	public List<ProductVO> productListPage(SearchVO searchVO) {
		logger.info("ProductDAO productListPage searchVO " + searchVO);
		return sst.selectList("productListPage", searchVO);
	}
	
	// 게시물 총 갯수
	public int productListCount(SearchVO searchVO) {
		return sst.selectOne("productListCount", searchVO);
	}
	
}