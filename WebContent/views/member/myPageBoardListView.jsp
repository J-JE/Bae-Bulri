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
    <title>내가 쓴 글 조회</title>
   

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

#delete{

    border-radius: 8px;
    background-color: #bce7eb;
	color : white;
}

nav{
	margin-left : 100px;
}

#liSearchOption{ 
    list-style:none;
    text-align:right;
    margin-bottom:10px;

}
#txtKeyWord{
	width : 250px;
	height : 38px;
	list-style:none;
}
#searchBtn{
	background-color: #bce7eb;
	color : white;
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

			<li id='liSearchOption'>
                    <div>
                        <input id='txtKeyWord' placeholder="제목을 입력하세요">
                        <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
                    </div>
            </li>
            <table class="table table-hover table-striped text-center" id="list">
              <thead>
                <tr>
                    <th><input type="checkBox" id="allcheck"></th>
                    <th>번호</th>
                    <th>작성날짜</th>
                    <th>제목</th>
                </tr>
            </thead>
	
            
            <script>
			$(function(){
				$("#searchBtn").click(function(){
					var bkw = $("#txtKeyWord").val();
					location.href="<%=contextPath%>/myBoardSearch.do?bkw=" + bkw;
					});
			 });
		</script>
            <tbody>
            
            	<%if(list.isEmpty()){ %>
            	<tr>
            		<td colspan="4">작성한 글이 없습니다.</td>
            	</tr>
            	<%}else{ %>
            	  <%for(Cook_Talk ct : list){ %>
            		 
            		  <tr>
            		   <input type="hidden" value="<%=ct.getBoardNo()%>">
            		      <td><input type="checkBox" name="RowCheck" ></td>
            		  	  <td><%= ct.getBoardNo()%></td>
            		  	  <td><%= ct.getCreateDate()%></td>
            		  	  <td class="title"><%= ct.getBoardTitle()%></td>	 
            		  </tr>
            		  
            		    <%} %>
            		 <%} %>
            		<%--   <%for(int i = 0; i < list.size(); i++){ %>
            		  
            		  <tr>
            		   	  <input type="hidden" value="<%=list.get(i).getBoardNo() %>">
            		      <td><input type="checkBox" name="RowCheck" value="<%=list.get(i).getBoardNo()%>" ></td>
            		  	  <td><%= list.get(i).getBoardNo()%></td>
            		  	  <td><%= list.get(i).getCreateDate()%></td>
            		  	  <td class="title"><%= list.get(i).getBoardTitle()%></td>	 
            		  </tr>
            		  
            		    <%}%>
            	     <%} %>--%>
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
	           $(function(){
	   			$(".title").click(function(){//제목을 클릭 시 상세페이지로 이동
	   				var cno = $("#list>tbody>tr").children().eq(0).val();
	   				location.href="<%=contextPath%>/detailCookTalk.do?cno="+cno;
	   			  });	
	   			
	   			
	   			   $('#allcheck').click(function(){//체크박스 전체 선택
	   				 if($("#allcheck").is(":checked")){ 
	                       
	                        $("input:checkbox[name='RowCheck']").prop("checked", true);
	                    }else{ //체크 해제되면
	                        
	                        $("input:checkbox[name='RowCheck']").prop("checked", false);
	                    }
	   				 
	   		   	   });
	   			  

	   		
	   			});
	   			
	 

           </script>

   
          <%--   <button id="delete" onclick="deleteValue();">선택 글 삭제</button>--%> 
			 <button class="btn btn-outline-secondary" type="button" id="delete">선택 글 삭제 </button>
             
          <%--    <script>
             	$("#delete").click(function(){
             		var count = $("input[name='RowCheck']:checked").length;
             		var bNo = [];
             		$("input[name='RowCheck']:checked").each(function(){

             			bNo.push($(this).attr('value'));
             		});
             		bNo = bNo.join(',');
             		console.log(bNo);
             		if(count == 0){
             			alert("게시글을 선택 해 주세요")
             		}else{
             			$.ajax({
             				url:"deleteMyBoard.do",
             				type:"post",
             				data:{
             					bNo:bNo
             				},
             				success:function(result){
             					if(result =="result"){
             						
             						var warning = confirm("건을 정말 삭제 하시겠습니까?")
             						if (!warning) {
             				            alert("취소를 누르셨습니다.");
             				        } else {
             				        	alert("성공적으로 게시글을 삭제했습니다.")
                 						history.go(0);
             				        }
             		
             					}else{
             						alert("게시글에 삭제 실패하였습니다.")
             					}
             				},
             				error:function(){
             					console.log("ajax 통신 실패");
             				}
             			});
             		}
		
             		
             	});
             </script>--%>
              <!-- 페이징바 만들기 -->
            <nav aria-label="Page navigation example">
				<ul class="pagination">
					<!-- 이전페이지로(<) -->
		        	<%if(currentPage == 1){ %>
						<li class="page-item"><a class="page-link" disabled> &lt; </a></li>
					<%}else{ %>
						<li class="page-item"><a class="page-link" href="<%=contextPath %>/myBoardList.do?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
					<%} %>
					
					<!-- 페이지 목록 -->
					<%for(int p=startPage; p<=endPage; p++){ %>
					
						<%if(p == currentPage){ %>
							<li class="page-item"><a class="page-link" disabled"><%= p %></a></li>
						<%}else{ %>
							<li class="page-item"><a class="page-link" href="<%=contextPath %>/myBoardList.do?currentPage=<%= p %>"><%= p %></a></li>
						<%} %>
					<%} %>
					
					<!-- 다음페이지로(>) -->
					<%if(currentPage == maxPage){ %>
						<li class="page-item"><a class="page-link" disabled> &gt; </a></li>
					<%}else { %>
						<li class="page-item"><a class="page-link" href="<%=contextPath %>/myBoardList.do?currentPage=<%=currentPage+1 %>"> &gt; </a></li>
					<%} %>
					
				</ul>
		    </nav>
  
		<br><br>

     </div>
        <%@ include file = "../common/footer.jsp" %>
</body>
</html>