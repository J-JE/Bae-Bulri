<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.recipe.model.dto.Recipe, com.uni.member.model.dto.Member" pageEncoding="UTF-8"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>메인페이지</title>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
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
      
      .btn{
      	color: white;
      	background-color:#9372A1;
      	border-color: #9372A1;
      	float: right;
      }
      .btn:hover{ color: white;}

    </style>
</head>
<body>
    <body class="container-fluid" style="margin-top: 55px;">
    <header>
	    <h2>#카테고리</h2>
	    <h2>><%--=r.getCategory() --%></h2>
	    <hr>
	    
    	<%for(int i=0; i<3;i++){ %>
		    <div class="row card-group">
	    		<%for(int j=0; j<4;j++){ %>
			        <div class="card" style="width: 18rem; margin: 15px;">
			        	<input type="hidden" value="...">
			            <img src="resource/images/이미지.png" class="card-img-top" alt="...">
			            <div class="card-body">
			              <h6 class="card-title">#어쩌구</h6>
			              <h5 class="card-text">김치볶음밥</h5>
			            </div>
			        </div>
	    		<%} %>
		    </div>
    	<%} %>
	
	    <script type="text/javascript">
	        $(function(){
				$(".card").click(function(){
					var bId = $(this).children().eq(0).val();
					location.href="<%=request.getContextPath()%>/detailThumb.do?bId=" + bId;
					});
				});
        </script>
        
        <br><br>
		<div align="center">
			<%-- if(loginUser != null){ --%>
				<button class="btn" onclick="location.href='<%=request.getContextPath() %>/insertRecipeForm.do'">레시피 추가</button>
			<%-- } --%>
		</div>
	
	    <nav aria-label="Page navigation example">
	        <ul class="pagination">
	          <li class="page-item"><a class="page-link" href="#"> < </a></li>
	          <li class="page-item"><a class="page-link" href="#">1</a></li>
	          <li class="page-item"><a class="page-link" href="#">2</a></li>
	          <li class="page-item"><a class="page-link" href="#">3</a></li>
	          <li class="page-item"><a class="page-link" href="#"> > </a></li>
	        </ul>
	    </nav>
    </header>
    </body>
    
</body>
</html>