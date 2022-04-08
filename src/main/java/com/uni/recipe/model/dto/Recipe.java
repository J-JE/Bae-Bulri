package com.uni.recipe.model.dto;

public class Recipe {

	private int recipeNo;	//레시피번호
	private int category;	//게시판분류번호
	private String recipeTitle;	//레시피제목
	private String recipeContent;	//레시피내용
	private String recipeTag;	//레시피 태그
	private String recipePro;	//레시피 재료
	private int rCategoryNo;	//카테고리번호
	private int count;	//조회수
	private String status;	//상태값
	
	private String thImg;	//썸네일 이미지
	private String rCategoryName;	//레시피 카테고리 이름
	
	public Recipe() {	}
	
	public Recipe(int recipeNo, int category, String recipeTitle, String recipeContent, String recipeTag,
			String recipePro, int rCategoryNo, int count, String status) {
		super();
		this.recipeNo = recipeNo;
		this.category = category;
		this.recipeTitle = recipeTitle;
		this.recipeContent = recipeContent;
		this.recipeTag = recipeTag;
		this.recipePro = recipePro;
		this.rCategoryNo = rCategoryNo;
		this.count = count;
		this.status = status;
	}
	
	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeContent() {
		return recipeContent;
	}

	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}

	public String getRecipeTag() {
		return recipeTag;
	}

	public void setRecipeTag(String recipeTag) {
		this.recipeTag = recipeTag;
	}

	public String getRecipePro() {
		return recipePro;
	}

	public void setRecipePro(String recipePro) {
		this.recipePro = recipePro;
	}

	public int getrCategoryNo() {
		return rCategoryNo;
	}

	public void setrCategoryNo(int rCategoryNo) {
		this.rCategoryNo = rCategoryNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getThImg() {
		return thImg;
	}

	public void setThImg(String thImg) {
		this.thImg = thImg;
	}

	public String getrCategoryName() {
		return rCategoryName;
	}

	public void setrCategoryName(String rCategoryName) {
		this.rCategoryName = rCategoryName;
	}

	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", category=" + category + ", recipeTitle=" + recipeTitle
				+ ", recipeContent=" + recipeContent + ", recipeTag=" + recipeTag + ", recipePro=" + recipePro
				+ ", rCategoryNo=" + rCategoryNo + ", count=" + count + ", status=" + status + ", thImg=" + thImg + "]";
	}

}
