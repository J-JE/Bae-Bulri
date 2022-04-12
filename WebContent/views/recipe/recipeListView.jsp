<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8" import = "java.util.ArrayList, com.uni.recipe.model.dto.Recipe, com.uni.common.PageInfo"%>
<% 
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>메인페이지</title>
	<style>
		header {
			color: black;
			text-shadow: 1px 1px 2px lightgray;
			width:80%;
			left:0; right:0;
			margin-left:auto;
			margin-right:auto;
		}
		
		img{
			height:200px;
		}
		
		.pagination {
			margin-top: 55px;
			width:200px;
			left:0; right:0;
			margin-left:auto;
			margin-right:auto;
		} /* 가로 중앙 정렬 */
		
		.pagination li a {
			color:#1fc7d6;
			background-color: white;
			margin-left: 1px;
			margin-right: 1px;
		}
		
		.pagination li a:hover {
			color:white;
			background-color: #bce7eb;
			margin-left: 1px;
			margin-right: 1px;
		}
		
		#insertRecipeBtn{
			color: white;
			background-color:#9372A1;
			border: solid 2px rgba(255, 255, 255, 0);
			border-radius: 5px;
			float: right;
		}
		#insertRecipeBtn:hover{ color: white;}
		#searchBtn{background-color: #bce7eb; color: white; border: none; border-radius: unset;}
		.input-group{width: 50% !important; margin: auto;}
	</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="container-fluid" style="margin-top: 55px;">
    <header>
    	<!-- 레시피 카테고리 -->
	    <h2>#카테고리</h2>
	    <hr>
	    
	    	<!-- list 없음 -->
	    	<%if(list.isEmpty()){ %>
	    	<h3 style="margin:50px;">결과가 없습니다.</h3>
	    	<%}%>
			
	    	<!-- 레시피 목록 -->
		    <div class="row row-cols-1 row-cols-md-4 g-4">
	    		<%for(Recipe r : list){%>
	    		<div class="col" style="margin-top: 15px; margin-bottom: 15px;">
			        <div class="card h-100">
			        	<input type="hidden" value="<%=r.getRecipeNo()%>">
			            <img src="<%=contextPath%>/resources/images/recipeFiles/<%=r.getThImg()%>" class="card-img-top">
			            <div class="card-body">
			              <h6 class="card-title"><%=r.getRecipeTag()%></h6>
			              <h5 class="card-text"><%=r.getRecipeTitle()%></h5>
			            </div>
			        </div>
		        </div>
	    		<%} %>
		    </div>
		    
		<!-- 레시피 상세 페이지 이동 스크립트 -->
	    <script type="text/javascript">
	        $(function(){
				$(".card").click(function(){
					var rId = $(this).children().eq(0).val();
					location.href="<%=contextPath%>/recipeDetail.do?rId=" + rId;
					});
				});
        </script>
        
        <hr style="margin-bottom: 30px;">
		
		<!-- 레시피 검색 -->
		<div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchInput">
		  <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
		</div>
		<script>
		$(function(){
			$("#searchBtn").click(function(){
				var keyword = $("#searchInput").val();
				console.log(keyword);
				location.href="<%=contextPath%>/recipeSearch.do?keyword=" + keyword;
				});
			});
		</script>
        
        <!-- 레시피 추가 버튼 -->
        <br>
		<button id="insertRecipeBtn" onclick="location.href='<%=contextPath %>/insertRecipeForm.do'">레시피 추가</button>
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> <!-- 관리자 아이디-->
		<% } %>
		
		<!-- 페이징바 -->
	    <nav aria-label="Page navigation example">
			<ul class="pagination">
				<!-- 이전페이지로(<) -->
	        	<%if(currentPage == 1){ %>
					<li class="page-item"><a class="page-link" disabled> &lt; </a></li>
				<%}else{ %>
					<li class="page-item"><a class="page-link" href="<%=contextPath %>/recipeList.do?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item"><a class="page-link" disabled"><%= p %></a></li>
					<%}else{ %>
						<li class="page-item"><a class="page-link" href="<%=contextPath %>/recipeList.do?currentPage=<%= p %>"><%= p %></a></li>
					<%} %>
				<%} %>
				
				<!-- 다음페이지로(>) -->
				<%if(currentPage == maxPage){ %>
					<li class="page-item"><a class="page-link" disabled> &gt; </a></li>
				<%}else { %>
					<li class="page-item"><a class="page-link" href="<%=contextPath %>/recipeList.do?currentPage=<%=currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
			</ul>
	    </nav>
    </header>
    </div>
	<%@ include file = "../common/footer.jsp" %>   
</body>
</html>