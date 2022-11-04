package com.meaningfarm.mall.product;

import lombok.Data;

@Data
public class ProductFileVO {
	private int productfile_no = 0;
	private String productfile_name = "";
	private String productfile_sname = "";
	private String productfile_path = "";
	private int product_no = 0;
}