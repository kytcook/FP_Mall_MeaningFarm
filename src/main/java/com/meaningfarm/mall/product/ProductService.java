package com.meaningfarm.mall.product;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


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
		// if문을 vo.set~~을 0으로
		if(productVO.getProduct_dlvyfee() == null) {
			productVO.setProduct_dlvyfee(0);
		}
//		if(productVO.getProductfileVO() == null || productVO.getProductfileVO().size() <= 0) {
//			return productVO.setProductfileVO(0);
//		}
		int result = 0;
		result = productDAO.productInsert(productVO);
		productVO.getProductfileVO().forEach(productfileVO -> {
			productfileVO.setProduct_no(productVO.getProduct_no());
			productDAO.productfileInsert(productfileVO);
		});
		logger.info("ProductService productInsert result" + productVO);
		return result;
	}
	
	@Transactional
	public int productUpdate(ProductVO productVO) {
		logger.info("ProductService productUpdate " + productVO);
		int result = productDAO.productUpdate(productVO);
		
		System.out.println("첨부파일 result " + result);
		System.out.println("첨부파일 productVO.getProductfileVO() " + productVO.getProductfileVO());
		
		if(result == 1 && productVO.getProductfileVO() != null && productVO.getProductfileVO().size() > 0) {
			productDAO.productfileDelete(productVO.getProduct_no());
			System.out.println(productVO.getProductfileVO().toString());
			
			productVO.getProductfileVO().forEach(productfileVO -> {
				productfileVO.setProduct_no(productVO.getProduct_no());
				productDAO.productfileInsert(productfileVO);
			});
		}
		return result;
	}
	
	public void productDelete(int product_no) {
		logger.info("ProductService productDelete " + product_no);
		productDAO.productDelete(product_no);
	}
	
	public void productCheckDelete(int option_no) {
		logger.info("ProductService productCheckDelete " + option_no);
		productDAO.productDelete(option_no);
	}
	
	
	
	
	public List<CategoryTypeVO> CTList() {
		List<CategoryTypeVO> CTList = null;
		CTList = productDAO.CTList();
		return CTList;
	}

	public List<CategoryLocalVO> CLList() {
		List<CategoryLocalVO> CLList = null;
		CLList = productDAO.CLList();
		return CLList;
	}
	
		public List<ProductFileVO> productfileList(int product_no) {
		List<ProductFileVO> PFList = null;
		PFList = productDAO.productfileList(product_no);
		return PFList;
	}

//	public int productfileInsert(ProductFileVO productfileVO) {
//		logger.info("ProductService productfileInsert");
//		int result = productDAO.productfileInsert(productfileVO);
//		logger.info("ProductService productfileInsert result" + productfileVO);
//		logger.info("result " + result);
//		return result;
//	}

	public void productfileDelete(int product_no) {
		logger.info("ProductService productDelete " + product_no);
		productDAO.productfileDelete(product_no);		
	}

	public void productfileDeleteOne(int productfile_no) {
		logger.info("ProductService productDelete " + productfile_no);
		productDAO.productfileDeleteOne(productfile_no);		
	}
	
	
	// 페이지
	public List<ProductVO> list(SearchVO searchVO) {
		logger.info("ProductService productListPage " + searchVO);
		return productDAO.productListPage(searchVO);
	}
	
	public int productListCount(SearchVO searchVO) {
		return productDAO.productListCount(searchVO);
	}
}