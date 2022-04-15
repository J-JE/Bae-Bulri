<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.recipe.model.dto.*,com.uni.common.PageInfo"%>
    
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 찜 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
 #mypage{
width:1000px;
height:100%;
margin: auto;
margin-top:80px;
}
.myPageMenu{
color: white;
display: inline-block;
width: 1000px;
position: absolute;
margin-top: 20px;
margin-left: 310px;
line-height: 50px;
}
.myPagemenuBar{
background-color: #BCE7EB;
width: 120px;
height: 50px;
display: inline-block;
text-align: center;
}
.myPagemenuBar :hover{background-color:rgba(255, 255, 255, 0.61); color: rgb(155, 89, 182); text-decoration:none}
a {
 
 color : white;
}
.thumb {
		width: 155px;
		height: 185px;
        text-align: center;
        margin-left: 80px;
        margin-top: 100px;
        float: left;
        border:1px solid lightgray;
  
	}
.topList {
		width: 1000px;
		height: 900px;
		color: black;
		margin-right: 1000px;
		
	}
#thumbList{
    margin-top: 50px;
    display: block;
    float: left;
}
.button{
    float: right;
    background-color: blueviolet;
    color: white;
    border-radius: 8px;
    width: 50px;
    height: 30px;
}
/*페이징*/
#divPaging {
            clear:both; 
            margin-top: 150px; 
            margin-left: 50px;
            width:220px; 
            height:50px;
    }
    
        #divPaging > div {
            float:left;
            width: 30px;
            margin:0 auto;
            text-align:center;
    }
 
 
  
      .pagination {
        
      margin-top: 10px;
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
    nav{
    	margin-left : 100px;
    }
    
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>
    <div id="mypage">
        <h2 align="center">나의 찜 목록</h2>
        <div class="myPageMenu">
            <div class="myPagemenuBar">
	            <a href="<%=request.getContextPath()%>/myOrderList.do">주문내역조회</a>  
	        </div>
	        <div class="myPagemenuBar">
	            <a href="<%= request.getContextPath()%>/myBoardList.do">내가쓴글 조회</a>
	        </div>
	        <div class="myPagemenuBar">
	            <a href="<%= request.getContextPath()%>/myLikeyList.do">나의 찜 목록</a>
	        </div>
        </div>
       
        <div class="topList" align="center">
            <br>
            <div id="thumbList">
            	<%for(Recipe r : list){ %>
            	<div class="thumb" align="center">
            		<input type="hidden" value="<%=r.getRecipeNo() %>">
            		<img class="img" class="" src="<%=contextPath %>/resources/images/recipeFiles/<%= r.getThImg() %>" width="150px" height="150px"><br>
            		<p><%=r.getRecipeTitle()%></p>
            		<button class="button" onclick="location.href='<%=request.getContextPath()%>/deleteLikey.do?rno=<%=r.getRecipeNo()%>'">삭제</button>
            	</div>
            	<%} %>
            	<script>
            	
            	$(function(){//마이페이지 찜 목록에서 클릭 시 레시피 번호를 가지고 상세 페이지로 이동
        			$(".img").click(function(){
        				var rId = $(this).prev().val();
        				location.href="<%=contextPath%>/recipeDetail.do?rId="+rId;
        			});
            	
        			 $("#list>tbody>tr").click(function(){
     	   				var cno = $(this).children().eq(0).val();
     	   				location.href="<%=contextPath%>/detailCookTalk.do?cno="+cno;
     	   			});
        		});
            	</script>
        
                    <%-- <div class="thumb" align="center">   이런식으로 나오게 함
                    <input type="hidden" value="1"> 
                    <img src="/i.jpg" width="150px" height="150px"> <br>
                    <p>제목입니다.</p>
                    <button class="button">삭제</button>
                    </div>
                    <div class="thumb" align="center"> 
                        <input type="hidden" value="1"> 
                        <img src="i.jpg" width="150px" height="150px"> <br>
                        <p>제목입니다.</p>
                       <button class="button">삭제</button>
                     </div>
                     <div class="thumb" align="center"> 
                        <input type="hidden" value="1"> 
                        <img src="/i.jpg" width="150px" height="150px"> <br>
                        <p>제목입니다.</p>
                        <button class="button">삭제</button>
                    </div>
                     <div class="thumb" align="center"> 
                            <input type="hidden" value="1"> 
                            <img src="/i.jpg" width="150px" height="150px"> <br>
                            <p>제목입니다.</p>
                           <button class="button">삭제</button>
                     </div>
                     <div class="thumb" align="center"> 
                        <input type="hidden" value="1"> 
                        <img src="/i.jpg" width="150px" height="150px"> <br>
                        <p>제목입니다.</p>
                        <button class="button">삭제</button>
                        </div>
                        <div class="thumb" align="center"> 
                            <input type="hidden" value="1"> 
                            <img src="i.jpg" width="150px" height="150px"> <br>
                            <p>제목입니다.</p>
                          <button class="button">삭제</button>
                         </div>
                         <div class="thumb" align="center"> 
                            <input type="hidden" value="1"> 
                            <img src="/i.jpg" width="150px" height="150px"> <br>
                            <p>제목입니다.</p>
                            <button class="button">삭제</button>
                        </div>
                         <div class="thumb" align="center"> 
                                <input type="hidden" value="1"> 
                                <img src="/i.jpg" width="150px" height="150px"> <br>
                                <p>제목입니다.</p>
                                <button class="button">삭제</button>
                         </div>--%>
                        </div>      
            
            </div>
            
            <nav aria-label="Page navigation example">
				<ul class="pagination">
					<!-- 이전페이지로(<) -->
		        	<%if(currentPage == 1){ %>
						<li class="page-item"><a class="page-link" disabled> &lt; </a></li>
					<%}else{ %>
						<li class="page-item"><a class="page-link" href="<%=contextPath %>/myLikeyList.do?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
					<%} %>
					
					<!-- 페이지 목록 -->
					<%for(int p=startPage; p<=endPage; p++){ %>
					
						<%if(p == currentPage){ %>
							<li class="page-item"><a class="page-link" disabled"><%= p %></a></li>
						<%}else{ %>
							<li class="page-item"><a class="page-link" href="<%=contextPath %>/myLikeyList.do?currentPage=<%= p %>"><%= p %></a></li>
						<%} %>
					<%} %>
					
					<!-- 다음페이지로(>) -->
					<%if(currentPage == maxPage){ %>
						<li class="page-item"><a class="page-link" disabled> &gt; </a></li>
					<%}else { %>
						<li class="page-item"><a class="page-link" href="<%=contextPath %>/myLikeyList.do?currentPage=<%=currentPage+1 %>"> &gt; </a></li>
					<%} %>
					
				</ul>
		    </nav>
			
    
            <br>
            <br>
         
        </div>

        <%@ include file = "../common/footer.jsp" %>
</body>
</html>