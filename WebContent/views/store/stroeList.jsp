<%@ page language="java" contentType="text/html; charset=UTF-8"
     import = "java.util.ArrayList, com.uni.store.model.dto.*" pageEncoding="UTF-8" %>
     <%@page import="com.uni.common.PageInfo"%>
<% 
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
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
    <title>스토어몰</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

      #main{
            width: 1500px;
            height:  1000px;
            margin: 0 auto; /*가운데 정렬*/
        }
 #search{
     margin-top: 100px;
    margin-bottom: 50px;
     margin-left: 900px;
     
 }

.product {
        margin-left: 300px;
        float: left;
        position: relative;
       
   }
.topList {
      width: 1500px;
      height: 1000px;
      color: black;
    
  

   }

#List{
    margin-top: 50px;
    display: block;
    margin: 0 auto; /*가운데 정렬*/
    
}

/*페이징*/ 
.pagination {
      margin-bottom: 60px;
      width:200px;
      left:0; right:0;
      margin-left:auto;
      margin-right:auto;
      color: black;
      } /* 가로 중앙 정렬 */
      #butt{
        background-color:  rgb(155, 89, 182);
        color: white;
        margin:0 auto; 
            margin-top: 30px; 
            width:100px; 
          
            margin-left: 600px; 
    }
     #header{
          margin-left: 300px;
        color:  rgb(155, 89, 182);
    }
   </style>
</head>
<body>
         <%@ include file="../common/menubar.jsp" %>
    	<br>
    	<div id="main">
   			  <h2 id="header">배불리 몰</h2>
            <hr>
            <div id="search">
                
                <input id='txtKeyWord' placeholder="상품명,#레시피"/>
                <input type='button' value='검색'/>
            </div>
            
    <!-- 스토어 목록  -->
        <div class="topList" align="center">
            <br>
            <%if(list.isEmpty()){ %>
	    	<h3 style="margin:50px;">결과가 없습니다.</h3>
	    	<%} %>  
            <div id="List">
                 <%for(Store s : list){ %>                  
                <div class="product" align="center"> 
                    <input type="hidden" value="1"> 
                    <img src="<%=request.getContextPath()%>/resources/images/<%=s.getStroeImg()%>" width="350px" height="150px"> <br>
                    <a>#<%=s.getRecipeTitle()%></a><br>
                    <a><%=s.getProductName()%></a><br>
                    <a><%=s.getPrice()%>원</a>
                    </div>
                    <%}%>
                       
                    </div>
                  	 <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> <!-- 관리자 아이디-->
            	 <button id="butt"  onclick="location.href='<%=request.getContextPath()%>/insertStoreFormdo'">재료추가</button>
					<% } %>
        <div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button id="butt1" onclick="location.href='<%=request.getContextPath()%>/cookTalkList.do?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button id="butt1" disabled> &lt; </button>
			<%}else{ %>
			<button id="butt1" onclick="location.href='<%= request.getContextPath() %>/cookTalkList.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button id="butt1" disabled> <%= p %> </button>
				<%}else{ %>
				<button id="butt1" onclick="location.href='<%=request.getContextPath() %>/cookTalkList.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button id="butt1"disabled> &gt; </button>
			<%}else { %>
			<button id="butt1"onclick="location.href='<%= request.getContextPath() %>/cookTalkList.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button id="butt1"onclick="location.href='<%=request.getContextPath()%>/cookTalkList.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 
        </div></div>
    

      <%@ include file = "../common/footer.jsp" %>
       
 


  
</body>
</html>