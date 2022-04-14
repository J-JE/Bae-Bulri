package com.uni.store.model.dto;


public class Store {
	
	private int productNo;//상품번호
	private int category;//2 게시판분류번호
	private String productName;//상품명
	private int price;//가격
	private int stock;//재고
	private String status;//상태값
	private String StroeImg;//스토어의 타이틀 사진
	private String recipeTitle;//레시피 제목
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public Store(int productNo, int category, String productName, int price, int stock, String status, String stroeImg,
			String recipeTitle) {
		super();
		this.productNo = productNo;
		this.category = category;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.StroeImg = stroeImg;
		this.recipeTitle = recipeTitle;
		
	}
	
	

	

	public Store(int productNo, String productName, int price, int stock, String stroeImg) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.StroeImg = stroeImg;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStroeImg() {
		return StroeImg;
	}

	public void setStroeImg(String stroeImg) {
		StroeImg = stroeImg;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	@Override
	public String toString() {
		return "Store [productNo=" + productNo + ", category=" + category + ", productName=" + productName + ", price="
				+ price + ", stock=" + stock + ", status=" + status + ", StroeImg=" + StroeImg + ", recipeTitle="
				+ recipeTitle + "]";
	}

	

	
	
	
	

	
	
	
}
