package com.vo;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
   private String m_id           = null;
   private int    auth_id        = 0;
   private String m_pw           = null;
   private String m_name         = null;
   private String m_phone        = null;
   private String m_email        = null;
   private int    m_zipcode      = 0;
   private String m_address      = null;
   private String m_address2     = null;
   private String m_registedate  = null;
   private int    m_type         ;
   private String m_stop         = null;
   private int    m_point        = 0;
   private String m_exitstatus   = null;
   @DateTimeFormat(pattern="yyyy/MM//dd")
   private String	  m_exitdate     = null;
   private String m_status       = null;
   @DateTimeFormat(pattern="yyyy/MM//dd")
   private String	  m_birth		 = null;
}