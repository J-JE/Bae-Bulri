<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.uni.cook_talk.model.dto.Cook_Talk" %>
<% 
	ArrayList<Cook_Talk> list = (ArrayList<Cook_Talk>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 메인</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            line-height:2em;        
            font-family:"맑은 고딕";
    }
        ul, li{ 
            list-style:none;
            text-align:center;
            padding:0;
            margin:0;
    }
    
        #main{
            width: 1000px;
            margin: 0 auto; /*가운데 정렬*/
            
        }
    
        #main > ul > li:first-child {
            text-align: center;
            font-size:14pt;
            height:40px;
            vertical-align:middle;
            line-height:30px;
    }
    
        #ulTable {margin-top:10px;}
        
    
        #ulTable > li:first-child > ul > li {
            background-color:#c9c9c9;
            font-weight:bold;
            text-align:center;
    }
    
        #ulTable > li > ul {
            clear:both;
            padding:0px auto;
            position:relative;
            min-width:40px;
    }
        #ulTable > li > ul > li { 
            float:left;
            font-size:10pt;
            border-bottom:1px solid rgb(208, 187, 187);
            vertical-align:baseline;
    }    
    
        #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
        #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
        #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
        #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
        #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/
    
        #divPaging {
              clear:both; 
            margin:0 auto; 
            width:220px; 
            height:50px;
    }
    
        #divPaging > div {
            float:left;
            width: 30px;
            margin:0 auto;
            text-align:center;
    }
    
        #liSearchOption {clear:both;}
        #liSearchOption > div {
            margin:0 auto; 
            margin-top: 30px; 
            width:auto; 
            height:100px;
            margin-left: 300px; 
            
    }
    
        .left {
            text-align : left;
    }
    #butt{
        background-color: rgb(170, 32, 170);
        color: white;
        margin:0 auto; 
            margin-top: 30px; 
            width:100px; 
          
            margin-left: 600px; 
    }
    .pagination {
      margin-bottom: 60px;
      width:200px;
      left:0; right:0;
      margin-left:auto;
      margin-right:auto;
      color: black;
      } /* 가로 중앙 정렬 */
    </style>
</head>
<body>
    <!--  <%@ include file="../common/menubar.jsp" %> -->
    
    <div id="main">

        <ul>
            <!-- 게시판 제목 -->
            <h2 style="color: rgb(170, 32, 170);">쿡&토크 </h2>
               
           <hr>
                <!-- 검색 폼 영역 -->
                <li id='liSearchOption'>
                    <div>
                        <select id='selSearchOption'  >
                            <option value='A'>제목</option>
                            <option value='T'>아이디</option>
                        </select>
                        <input id='txtKeyWord' />
                        <input type='button' value='검색'/>
                    </div>
                    </li>
            <!-- 게시판 목록  -->
        
                <ul id ="ulTable">
                    <li style="background-color: antiquewhite;">
                        <ul>
                            <li>번호</li>
                            <li>제목</li>
                            <li>작성자</li>
                            <li>작성일자</li>
                        </ul>
                    </li>
                    <tbody>
				  <%if(list.isEmpty()){ %>
				<li>
					<ul colspan="4">조회된 리스트가 없습니다.</ul>
				</li>
				<%}else{ %>
					<% for(Cook_Talk c : list){ %>
					<ul>
						<li><%= c.getBoardNo() %></li>
						<li><%= c.getBoardTitle() %></li>
						<li><%= c.getUserNo() %></li>
						<li><%= c.getCreateDate() %></li>
					</ul>
					<%} %>
				<%} %>
			</tbody>
                   
                    <!-- 게시물이 출력될 영역 -->
                  <li>
                        <ul>
                            <li>1</li>
                            <li class="left">제목1</li>
                            <li>skawn</li>
                            <li>2022.04.01</li>
                        </ul>
                    </li>
                  
                        </ul>       
                    
                      
                   
  
            <br> <br>
      
                  <button id="butt">글 쓰기</button>
            <br> <br>
         <!-- 게시판 페이징 영역 -->
         <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="#"> < </a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#"> > </a></li>
            </ul>
        </nav>

        </ul>
    </div>

  	  <%@ include file = "../common/footer.jsp" %>
</body>
</html>