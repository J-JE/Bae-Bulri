<%@ page language="java" contentType="text/html; charset=UTF-8"
 import = "java.util.ArrayList, com.uni.cook_talk.model.dto.Cook_Talk" pageEncoding="UTF-8" %>
 <%@page import="com.uni.common.PageInfo"%>
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
        background-color:  rgb(155, 89, 182);
        color: white;
        margin:0 auto; 
            margin-top: 30px; 
            width:100px; 
          
            margin-left: 600px; 
    }
   
    
    </style>
</head>
<body>
    <!--  <%@ include file="../common/menubar.jsp" %> -->
    
    <div id="main">

        <ul>
            <!-- 게시판 제목 -->
            <h2 style="color: rgb(155, 89, 182);">쿡&토크 </h2>
               
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
           
                
            <table class="table table-hover" id="ckList">
                <thead>
                  <tr>
                      <th>게시물 번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                  </tr>
              </thead>
              <tbody>
     				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="4">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Cook_Talk c : list){ %>
					<tr>
						<td><%= c.getBoardNo() %></td>
						<td><%= c.getBoardTitle() %></td>
						<td><%= c.getUserId() %></td>
						<td><%= c.getCreateDate() %></td>
						
					</tr>
					<%} %>
				<%} %>
   
              </tbody>
              </table>
                 <script type="text/javascript">
	           $(function(){//클릭 시 게시물 상세페이지로 이동
	   			$("#ckList>tbody>tr").click(function(){
	   				var cno = $(this).children().eq(0).text();
	   				location.href="<%=request.getContextPath()%>/detailCookTalk.do?cno="+cno;
	   			})	
	   		
	   			})
           </script>       
                    
          
            <br> <br>
       
            <button id="butt"  onclick="location.href='<%=request.getContextPath()%>/insertCookTaklForm.do'">글 쓰기</button>
            <br> <br>
       
     <!-- 페이징바 만들기 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=request.getContextPath()%>/cookTalkList.do?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/cookTalkList.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/cookTalkList.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/cookTalkList.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%=request.getContextPath()%>/cookTalkList.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 

        </ul>
    </div>
	  <%@ include file = "../common/footer.jsp" %>
  
</body>
</html>