<%@page import="com.uni.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.cook_talk.model.dto.*"%>
<%
	ArrayList<Cook_Talk> list = (ArrayList<Cook_Talk>)request.getAttribute("list");
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
    <title>내가쓴글조회</title>
   

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
#mypage{

width:1000px;
height:100%;
margin: auto;
margin-top: 80px;
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

/*페이징*/
#divPaging {
            clear:both; 
            margin-top: 20px; 
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
        
      margin-top: 30px;
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

button{
    background-color: purple;
    color: white;
    border-radius: 8px;
}


</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>
    <div id="mypage">
        <h2 align="center">내가 쓴 글 조회</h2>
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
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>


            <table class="table table-hover table-striped text-center" id="list">
              <thead>
                <tr>
                    <th><input type="checkBox"></th>
                    <th>번호</th>
                    <th>작성날짜</th>
                    <th>제목</th>
                </tr>
            </thead>
            <tbody>
            	<%if(list.isEmpty()){ %>
            	<tr>
            		<td colspan="4">작성한 글이 없습니다.</td>
            	</tr>
            	<%}else{ %>
            		  <%for(Cook_Talk ct : list){ %>
            		  
            		  <tr>
            		  	  <td><input type="checkBox"></td>
            		  	  <td><%= ct.getBoardNo()%></td>
            		  	  <td><%= ct.getCreateDate()%></td>
            		  	  <td><%= ct.getBoardTitle()%></td>	 
            		  </tr>
            		  
            		    <%} %>
            	     <%} %>
               <%--  <tr>
                    <td><input type="checkBox"> </td>
                    <td>1</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                </tr>
                <tr>
                    <td><input type="checkBox"> </td>
                    <td>2</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                </tr> 이런식으로 나오게 함--%>
            </tbody>
            </table>
           <script>
	           $(function(){//클릭 시 게시글 상세페이지로 이동
	   			$("#list>tbody>tr").click(function(){
	   				var nno = $(this).children().eq(0).text();
	   				location.href="<%=contextPath%>/detailNotice.do?nno="+nno;
	   			})	
	   		
	   			})
           </script>
           
            <button>선택 글 삭제</button> 
        <!-- 페이징바 만들기 -->
			<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/myBoardList.do?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/myBoardList.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/myBoardList.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/myBoardList.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/myBoardList.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
			</div> 
		<br><br>
		<%-- <div align="center">
		<% if(loginUser != null){ %>
		<button onclick="location.href='enrollFormBoard.do'">작성하기</button>
		<% } %>
		</div>--%>
     </div>
        <%@ include file = "../common/footer.jsp" %>
</body>
</html>