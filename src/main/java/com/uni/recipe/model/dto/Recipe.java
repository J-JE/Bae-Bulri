package com.uni.recipe.model.dto;

public class Recipe {

	private int recipeNo; //레시피번호
	private int category; //게시판분류번호
	private int rCategoryNo; //카테고리번호
	private String recipeTitle; //레시피제목
	private String recipeTag; //레시피태그
	private String recipeDes; //레시피한줄설명
	private String recipePro; //레시피재료
	private int recipeTime; //조리시간
	private String recipeContent; //조리과정설명
	private int count;	//조회수
	private String status;	//상태값
	
	private String thImg;	//썸네일이미지
	private String rCategoryName;	//카테고리이름
	
	public Recipe() {	}

	public Recipe(int recipeNo, int category, int rCategoryNo, String recipeTitle, String recipeTag, String recipeDes,
			String recipePro, int recipeTime, String recipeContent, int count, String status, String thImg,
			String rCategoryName) {
		super();

		this.recipeNo = recipeNo;
		this.category = category;
		this.rCategoryNo = rCategoryNo;
		this.recipeTitle = recipeTitle;
		this.recipeTag = recipeTag;
		this.recipeDes = recipeDes;
		this.recipePro = recipePro;
		this.recipeTime = recipeTime;
		this.recipeContent = recipeContent;
		this.count = count;
		this.status = status;
		
		this.thImg = thImg;
		this.rCategoryName = rCategoryName;
	}

	public Recipe(int recipeNo, String rCategoryName, String recipeTitle, String recipeTag, String recipeDes, String recipePro,
			int recipeTime, String recipeContent, String thImg) {
		super();
		this.recipeNo = recipeNo;
		this.rCategoryName = rCategoryName;
		this.recipeTitle = recipeTitle;
		this.recipeTag = recipeTag;
		this.recipeDes = recipeDes;
		this.recipePro = recipePro;
		this.recipeTime = recipeTime;
		this.recipeContent = recipeContent;
		this.thImg = thImg;
	}

	public Recipe(int recipeNo, String rCategoryName, String recipeTitle, String recipeTag, String recipeDes, String recipePro, int recipeTime,
			String recipeContent) {
		super();
		this.recipeNo = recipeNo;
		this.rCategoryName = rCategoryName;
		this.recipeTitle = recipeTitle;
		this.recipeTag = recipeTag;
		this.recipeDes = recipeDes;
		this.recipePro = recipePro;
		this.recipeTime = recipeTime;
		this.recipeContent = recipeContent;
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

	public int getrCategoryNo() {
		return rCategoryNo;
	}

	public void setrCategoryNo(int rCategoryNo) {
		this.rCategoryNo = rCategoryNo;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeTag() {
		return recipeTag;
	}

	public void setRecipeTag(String recipeTag) {
		this.recipeTag = recipeTag;
	}

	public String getRecipeDes() {
		return recipeDes;
	}

	public void setRecipeDes(String recipeDes) {
		this.recipeDes = recipeDes;
	}

	public String getRecipePro() {
		return recipePro;
	}

	public void setRecipePro(String recipePro) {
		this.recipePro = recipePro;
	}

	public int getRecipeTime() {
		return recipeTime;
	}

	public void setRecipeTime(int recipeTime) {
		this.recipeTime = recipeTime;
	}

	public String getRecipeContent() {
		return recipeContent;
	}

	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
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
		return "Recipe [recipeTitle=" + recipeTitle + ", recipeTag=" + recipeTag + ", recipeDes=" + recipeDes
				+ ", recipePro=" + recipePro + ", recipeTime=" + recipeTime + ", recipeContent=" + recipeContent
				+ ", count=" + count + ", rCategoryName=" + rCategoryName + "]";
	}
	
	
	
}
