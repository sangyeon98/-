package com.javalab.vo;

public class BoardVo {

   // 필드
   private String question_key; // 문의글번호
   private String id; // 회원ID
   private String manager_key; // 관리자번호
   private String review_key; // 후기글번호
   private String title; // 제목
   private String content; // 내용
   private String regdate; // 작성일
   private String hit; // 조회수
   
   // 기본생성자
   public BoardVo() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   // 오버로딩생성자
   public BoardVo(String question_key, String id, String manager_key, String review_key, String title, String content,
         String regdate, String hit) {
      super();
      this.question_key = question_key;
      this.id = id;
      this.manager_key = manager_key;
      this.review_key = review_key;
      this.title = title;
      this.content = content;
      this.regdate = regdate;
      this.hit = hit;
   }
   
   // 게터/세터
   public String getQuestion_key() {
      return question_key;
   }
   public void setQuestion_key(String question_key) {
      this.question_key = question_key;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getManager_key() {
      return manager_key;
   }
   public void setManager_key(String manager_key) {
      this.manager_key = manager_key;
   }
   public String getReview_key() {
      return review_key;
   }
   public void setReview_key(String review_key) {
      this.review_key = review_key;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   public String getHit() {
      return hit;
   }
   public void setHit(String hit) {
      this.hit = hit;
   }
   
}