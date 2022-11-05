package com.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {

	//private static final long serialVersionUID = 1L;
	
	private String m_id;
	private String auth_id;
	private String m_pw;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String m_zipcode;
	private String m_address;
	private String m_address2;
	private String m_registedate;
	private String m_type = null;
	private String m_stop;
	private int m_point = 0;
	private String m_exitstatus;
	@DateTimeFormat(pattern = "yyyy/MM//dd")
	private String m_exitdate;
	private String m_status;
	private String m_birth;
	
	private String m_bankowner;
	private String m_bank;
	private String m_banknum;
	
	private String auth_name;
	private String admin_name = "관리자";
	
	
	@Override
	public String toString() {
		return "MemberVO [m_id=" + m_id + ", auth_id=" + auth_id + ", m_pw=" + m_pw + ", m_name=" + m_name
				+ ", m_phone=" + m_phone + ", m_email=" + m_email + ", m_zipcode=" + m_zipcode + ", m_address="
				+ m_address + ", m_address2=" + m_address2 + ", m_registedate=" + m_registedate + ", m_type=" + m_type
				+ ", m_stop=" + m_stop + ", m_point=" + m_point + ", m_exitstatus=" + m_exitstatus + ", m_exitdate="
				+ m_exitdate + ", m_status=" + m_status + ", m_birth=" + m_birth + "]";
	}

	
	

	
	
}