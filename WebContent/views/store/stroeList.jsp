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

      #bae{
            width:980px;
            height: 1050px;
            margin: auto; /*가운데 정렬*/
             margin-left: auto;
              margin-right: auto;
        }
 	#search{
     margin-top: 30px;
    margin-bottom: 50px;
     margin-left: 700px;
    

 }

.product {

        margin-left: auto;
         margin-right: auto;
        float: left;
        position: relative;
       border-radius: 5px;
   }
.topList {
		 
		  margin: auto; /*가운데 정렬*/
	      width: 90%;
	      height: 600px;
       }

/*페이징*/ 

      #butt{
        background-color:  rgb(155, 89, 182);
        color: white;
        margin:0 auto; 
          margin-top: 120px; 
            margin-left: 800px; 
    }
     #header{
         
        color:  rgb(155, 89, 182);
    }
    
   #butt1{
    background-color: rgb(133, 69, 133);
        color: white;
   }

   .pagingArea{
   	 margin-top: 30px; 
   }
   .storeimg{
   		width: 280px;
      height: 200px;
         padding-top: 10px;
   }
   </style>
</head>
<body>
         <%@ include file="../common/menubar.jsp" %>
    		<br>
    	<div id="bae">
    	
   			  <h2 id="header">배불리 몰</h2>
            <hr>
            <div id="search">
                <input type="text" id='txtKeyWord' placeholder="상품명"/>
                <input type='button' id="searchBtn" value='검색'/>
            </div>
                   <script>
		$(function(){
			$("#searchBtn").click(function(){
				var sks = $("#txtKeyWord").val();
				console.log(sks);
				location.href="<%=contextPath%>/storeSearch.do?sks=" + sks;
				});
			});
		</script>
    <!-- 스토어 목록  -->
        <div class="topList" align="center">
            <br>
            <%if(list.isEmpty()){ %>
	    	<h3 style="margin:50px;">결과가 없습니다.</h3>
	    	<%} %>  
            <div id="List">
                 <%for(Store s : list){ %>
                                  
                <div class="product " > 
                    <input type="hidden" value="<%=s.getProductNo()%>"> 
                    <img src="<%=request.getContextPath()%>/resources/images/store/<%=s.getStroeImg()%>" class="storeimg"> <br>
                   
                    <a><%=s.getProductName()%></a><br>
                    <a><%=s.getPrice()%>원</a>
                    </div>
                    
                    <%}%>
				</div>
	           <br> <br>
       </div>
          
            	<script>
		<%if(!list.isEmpty()){%>
		$(function(){
			$(".product").click(function(){
				var sid = $(this).children().eq(0).val();
				location.href = "<%=contextPath%>/detailStore.do?sid="+sid;
			})
		})
		<%}%>
	</script>
       		
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> <!-- 관리자 아이디-->
		<button id="butt" onclick="location.href='<%=contextPath %>/insertStoreForm.do'">상품 추가</button>
		<% } %>
    
       </div>
        <!-- 페이징바 만들기 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button id="butt1" onclick="location.href='<%=request.getContextPath()%>/storeList.do?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button id="butt1" disabled> &lt; </button>
			<%}else{ %>
			<button id="butt1" onclick="location.href='<%= request.getContextPath() %>/storeList.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button id="butt1" disabled> <%= p %> </button>
				<%}else{ %>
				<button id="butt1" onclick="location.href='<%=request.getContextPath() %>/storeList.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button id="butt1"disabled> &gt; </button>
			<%}else { %>
			<button id="butt1"onclick="location.href='<%= request.getContextPath() %>/storeList.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button id="butt1"onclick="location.href='<%=request.getContextPath()%>/storeList.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 
      <%@ include file = "../common/footer.jsp" %>
       
 


  
</body>
</html>