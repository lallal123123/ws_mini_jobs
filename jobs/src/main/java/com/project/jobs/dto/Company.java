package com.project.jobs.dto;

import java.util.Date;

public class Company {
   private Long com_no;
   private String com_id;
   private String com_pw;
   private String com_name;
   private String com_size;
   private String com_ceo;
   private String com_addr;
   private String com_companynum;
   private String com_tel;
   private String com_email;
   private String com_url;
   private Date make_date;
   
   private boolean notInterest;
   private boolean interest; 
    
   public boolean isInterest() {
      return interest;
   }

   public void setInterest(boolean interest) {
      this.interest = interest;
   }

   public boolean isNotInterest() {
      return notInterest;
   }

   public void setNotInterest(boolean notInterest) {
      this.notInterest = notInterest;
   }

   

   

   public Long getCom_no() {
      return com_no;
   }

   public void setCom_no(Long com_no) {
      this.com_no = com_no;
   }

   public String getCom_id() {
      return com_id;
   }

   public void setCom_id(String com_id) {
      this.com_id = com_id;
   }

   public String getCom_pw() {
      return com_pw;
   }

   public void setCom_pw(String com_pw) {
      this.com_pw = com_pw;
   }

   public String getCom_name() {
      return com_name;
   }

   public void setCom_name(String com_name) {
      this.com_name = com_name;
   }

   public String getCom_size() {
      return com_size;
   }

   public void setCom_size(String com_size) {
      this.com_size = com_size;
   }

   public String getCom_ceo() {
      return com_ceo;
   }

   public void setCom_ceo(String com_ceo) {
      this.com_ceo = com_ceo;
   }

   public String getCom_addr() {
      return com_addr;
   }

   public void setCom_addr(String com_addr) {
      this.com_addr = com_addr;
   }

   public String getCom_companynum() {
      return com_companynum;
   }

   public void setCom_companynum(String com_companynum) {
      this.com_companynum = com_companynum;
   }

   public String getCom_tel() {
      return com_tel;
   }

   public void setCom_tel(String com_tel) {
      this.com_tel = com_tel;
   }

   public String getCom_email() {
      return com_email;
   }

   public void setCom_email(String com_email) {
      this.com_email = com_email;
   }

   public String getCom_url() {
      return com_url;
   }

   public void setCom_url(String com_url) {
      this.com_url = com_url;
   }

   public Date getMake_date() {
      return make_date;
   }

   public void setMake_date(Date make_date) {
      this.make_date = make_date;
   }

   
}