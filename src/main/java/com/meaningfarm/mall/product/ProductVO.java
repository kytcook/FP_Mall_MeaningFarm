package com.meaningfarm.mall.product;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {

	private int product_no = 0;
	private String product_name = "";
	private int product_price = 0;
	private String product_detail = "";
	private int product_stock = 0;
	private Integer product_dlvyfee = 0;
	private Integer product_dlvylimit = 0;
	private int category_local_no = 0;
	private int category_type_no = 0;
//	private Integer option_no = 0;
	private String m_id = "";
	private String category_local_name = "";
	private String category_type_name = "";
	private List<ProductFileVO> productfileVO = null;
//	public int getProduct_no() {
//		return product_no;
//	}
//	public void setProduct_no(int product_no) {
//		this.product_no = product_no;
//	}
//	public String getProduct_name() {
//		return product_name;
//	}
//	public void setProduct_name(String product_name) {
//		this.product_name = product_name;
//	}
//	public int getProduct_price() {
//		return product_price;
//	}
//	public void setProduct_price(int product_price) {
//		this.product_price = product_price;
//	}
//	public String getProduct_type() {
//		return product_type;
//	}
//	public void setProduct_type(String product_type) {
//		this.product_type = product_type;
//	}
//	public String getProduct_detail() {
//		return product_detail;
//	}
//	public void setProduct_detail(String product_detail) {
//		this.product_detail = product_detail;
//	}
//	public int getProduct_stock() {
//		return product_stock;
//	}
//	public void setProduct_stock(int product_stock) {
//		this.product_stock = product_stock;
//	}
//	public String getProduct_img() {
//		return product_img;
//	}
//	public void setProduct_img(String product_img) {
//		this.product_img = product_img;
//	}
//	public int getProduct_dlvyfee() {
//		return product_dlvyfee;
//	}
//	public void setProduct_dlvyfee(int product_dlvyfee) {
//		this.product_dlvyfee = product_dlvyfee;
//	}
//	public int getCategory_no() {
//		return category_no;
//	}
//	public void setCategory_no(int category_no) {
//		this.category_no = category_no;
//	}
//	@Override
//	public String toString() {
//		return "BoardVO [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
//				+ product_price + ", product_type=" + product_type + ", product_detail=" + product_detail
//				+ ", product_stock=" + product_stock + ", product_img=" + product_img + ", product_dlvyfee="
//				+ product_dlvyfee + ", category_no=" + category_no + "]";
//	}
	
}
