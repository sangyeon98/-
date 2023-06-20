package com.javalab.vo;

public class ProductVo {

	// 필드
	private String item_key; // 상품번호
	private String category_key; // 카테고리번호
	private int manager_key; // 관리자번호
	private String itemname; // 상품명
	private int price; // 상품가격
	private String regdate; // 상품등록일
	private String content; // 상품설명
	private String image1; // 상품이미지
	private String image2; // 상품이미지
	private String image3; // 상품이미지
	private String image4; // 상품이미지
	private String image5; // 상품이미지
	private String image6; // 상품이미지
	private int hitcount; // 조회수
	
	 //pagination field
	 private String pageNum = "1";		//페이지 번호
	 private String searchText = "";	//조회 키워드
	 private Integer listCount = 10;		//1페이지당 게시물수
	 private Integer pagePerBlock = 5;	//한 번에 보여질 페이지번호 갯수
	 

	// 기본 생성자
	public ProductVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 오버로딩 생성자
	public ProductVo(String item_key, String category_key, int manager_key, String itemname, int price, String regdate,
			String content, String image1, String image2, int hitcount) {
		super();
		this.item_key = item_key;
		this.category_key = category_key;
		this.manager_key = manager_key;
		this.itemname = itemname;
		this.price = price;
		this.regdate = regdate;
		this.content = content;
		this.image1 = image1;
		this.image2 = image2;
		this.hitcount = hitcount;

	}

	public ProductVo(String item_key, String category_key, int manager_key, String itemname, int price, String regdate,
			String content, String image1, String image2, String image3, String image4, String image5, String image6,
			int hitcount) {
		super();
		this.item_key = item_key;
		this.category_key = category_key;
		this.manager_key = manager_key;
		this.itemname = itemname;
		this.price = price;
		this.regdate = regdate;
		this.content = content;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.image6 = image6;
		this.hitcount = hitcount;
	}
	
	

	public ProductVo(String item_key, String category_key, int manager_key, String itemname, int price, String regdate,
			String content, String image1, String image2, String image3, String image4, String image5, String image6,
			int hitcount, String pageNum, String searchText, Integer listCount, Integer pagePerBlock) {
		super();
		this.item_key = item_key;
		this.category_key = category_key;
		this.manager_key = manager_key;
		this.itemname = itemname;
		this.price = price;
		this.regdate = regdate;
		this.content = content;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.image6 = image6;
		this.hitcount = hitcount;
		this.pageNum = pageNum;
		this.searchText = searchText;
		this.listCount = listCount;
		this.pagePerBlock = pagePerBlock;
	}

	// 게터/세터

	public String getItem_key() {
		return item_key;
	}

	public void setItem_key(String item_key) {
		this.item_key = item_key;
	}

	public String getCategory_key() {
		return category_key;
	}

	public void setCategory_key(String category_key) {
		this.category_key = category_key;
	}

	public int getManager_key() {
		return manager_key;
	}

	public void setManager_key(int manager_key) {
		this.manager_key = manager_key;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getImage6() {
		return image6;
	}

	public void setImage6(String image6) {
		this.image6 = image6;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Integer getListCount() {
		return listCount;
	}

	public void setListCount(Integer listCount) {
		this.listCount = listCount;
	}

	public Integer getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(Integer pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	
	@Override
	public String toString() {
		return "Product [item_key=" + item_key + ", category_key=" + category_key + ", manager_key=" + manager_key
				+ ", itemname=" + itemname + ", price=" + price + ", regdate=" + regdate + ", content=" + content
				+ ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4
				+ ", image5=" + image5 + ", image6=" + image6 + ", hitcount=" + hitcount + "]";
	}

}
