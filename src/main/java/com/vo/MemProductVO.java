package com.vo;

import lombok.Data;

@Data
public class MemProductVO {
		private int product_no = 0;
		private String product_name = "";
		private int product_price = 0;
		private String product_detail = "";
		private int product_stock = 0;
		private String product_img = "";
		private int product_dlvyfee = 0;
		private int option_no = 0;
		private int category_local_no = 0;
		private int category_type_no = 0;
		private String m_id = "";
}
