package com.javalab.vo;

public class MemberVo {

   // 필드
   private String id; // 회원ID
   private String pwd; // 회원비밀번호
   private String name; // 회원이름
   private String jumin; // 주민번호
   private String address; // 주소
   private String gender; // 성별
   private String phone; // 전화번호
   private String email; // 이메일
   private String signup; // 가입일
   
   // 기본 생성자
   public MemberVo() {
      super();
      // TODO Auto-generated constructor stub
      
   }
   
   
   
   
   public MemberVo(String id, String pwd) {
	super();
	this.id = id;
	this.pwd = pwd;
}




public MemberVo(String id, String pwd, String name, String jumin, String address, String gender, String phone,
		String email) {
	super();
	this.id = id;
	this.pwd = pwd;
	this.name = name;
	this.jumin = jumin;
	this.address = address;
	this.gender = gender;
	this.phone = phone;
	this.email = email;
}



// 오버로딩 생성자
   public MemberVo(String id, String pwd, String name, String jumin, String address, String gender, String phone,
         String email, String signup) {
      super();
      this.id = id;
      this.pwd = pwd;
      this.name = name;
      this.jumin = jumin;
      this.address = address;
      this.gender = gender;
      this.phone = phone;
      this.email = email;
      this.signup = signup;
   }
   
   // 게터/세터
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPwd() {
      return pwd;
   }
   public void setPwd(String pwd) {
      this.pwd = pwd;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getJumin() {
      return jumin;
   }
   public void setJumin(String jumin) {
      this.jumin = jumin;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getSignup() {
      return signup;
   }
   public void setSignup(String signup) {
      this.signup = signup;
   }
}