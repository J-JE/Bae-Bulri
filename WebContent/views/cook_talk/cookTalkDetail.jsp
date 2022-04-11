<%@ page language="java" contentType="text/html; charset=UTF-8"
 import = "com.uni.cook_talk.model.dto.*" pageEncoding="UTF-8" %>  
   <%
   Cook_Talk c = (Cook_Talk)request.getAttribute("cookTalk");
	%> 
<html lang="ko"><head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 작성</title>
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
    <style>
        .logo{height: 126px; width: 100%;}
     .logo>a>img{height:100% !important;  width: 100%;}
        
        .container{
            width: 880px;
            margin: 0 auto; /*가운데 정렬*/
        }
      .input-form {
        /*max-width: 680px; */
        
        margin-top: 80px;
        padding: 32px;
        width: 1000px;
        
        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      }
     
      .main{
        color: rgb(170, 32, 170);
          font-weight: bold;
          font-size: large;
      }

    div > label {
        margin-left: 650px;
    }
    #f12{
    	 height:100px;
    	 weight:100px;
    }
        .f1{
             height:50px;
    	 	weight:50px;
         
            background-color:rgb(170, 32, 170);
            color: white;
        }
        .f2{
            margin-left:650px;
             color: white;
            background-color: rgb(110, 18, 110);
        }
       #f3{
          height: 30px;
            margin-left: 650px;
            background-color: rgb(70, 24, 88);
            color: white;
        }
        .replyArea{    margin-left: 50px;
         				width:1000px;
         				
		
					margin-top:20px;
    	 	
        }
        #addReply{ background-color:rgb(170, 32, 170);
          			color: white;
          			width:100px;
  				height: 40px;
  				     font-size: large;
        }
        .replyArea tr th{
        	color: rgb(170, 32, 170);
          font-size: large;
     
        }
  	#replyList{
  		width:900px;
  		
  	}
      #tableReply{
      width:900px;
  	
      }
    </style>
  </head>
  
  <body>
    <%@ include file="../common/menubar.jsp" %> 
  
    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <div class="outer">
                  <a class="main" href="cookTalkList.do">쿡&토크</a>
                   &gt; 
                  <a class="main" href="#">글 목록</a>
                  
          </div>
          <hr>
          
        
            <div class="row">
              <div class="col-md-6 content">
              	  <p><%= c.getBoardTitle() %></p> 
                <label id="sysdate"><%= c.getCreateDate() %></label>
                <label id="id"><%= c.getUserId() %></label>
                
             </div>
              </div>

              <br>
            
              <div class="form-group">
                <p><%= c.getBoardContent() %></p> 
            </div>
            <br>
           
         	
            <div id="f12">
            <% if(loginUser != null && loginUser.getUserId().equals(c.getUserId())){ %><%--아이디가 일치하면 버튼이 보임 --%>
            <a class="f2" onclick=delete() href="deleteBoard.do?cno=<%=c.getBoardNo()%>">삭제하기</a>
              
            <a class="f1" onclick=update() href="upDateFormBoard.do?cno=<%=c.getBoardNo()%>"> 수정하기 </a>
     		<% } %>
       	<%--button으로 주면 이벤트 안 돼서 일단 a로 줌 --%>
        </div>
          <a id="f3" href="cookTalkList.do">목록으로</a>
          
        </div>
       
         
        <div class="replyArea">
          <table border="1" align="center" id="tableReply">
     	<tr>
				<th>댓글작성</th>
				<% if(loginUser != null){ %>
				<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
				<td><button id="addReply">댓글등록</button></td>
				<% }else{ %>
				<td><textarea readonly rows="3" cols="60" id="replyContent" style="resize:none;">로그인 후 이용해주세요</textarea></td>
				<td><button disabled>댓글등록</button></td>
				<% } %>
			</tr>
    
      </table>
      	<div id="replyListArea">
			<table id="replyList" border="1" align="center" >
				
				<!-- <tr>
					<td width="100px">admin</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 23일</td>
				</tr>
				<tr>
					<td width="100px">user01</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 22일</td>4
					
				</tr>
				<tr>
					<td width="100px">test01</td>
					<td width="330px">댓글작성내용</td>
					<td width="150px">2020년 1월 20일</td>
				</tr> -->
			</table>
		</div>
	</div>
      
  	<script>
	$(function(){
		selectReplyList();
		$("#addReply").click(function(){
			var content = $("#replyContent").val();
			var cid = <%=c.getBoardNo()%>;
			
			
			$.ajax({
				url:"reinsert.do",
				type:"post",
				data:{
						content:content,
						cid:cid
				},
				success:function(status){
					if(status =="success"){
						selectReplyList();
						$("#replyContent").val("");
					}
				},
				error:function(){
					console.log("ajax 통신실패 -댓글등록")
				}
				
			})
			
		})
		
	})
	
	function selectReplyList(){
			$("#replyList").empty();
			$.ajax({
				url:"rlist.do",
				data:{cid:<%=c.getBoardNo()%>},
				type:"get",
				success:function(list){
					console.log(list)
					
					$.each(list, function(index, obj){
						
						var writerTd = $("<td>").text(obj.userId).attr("width", "100px");
						var contentTd = $("<td>").text(obj.ctRContent).attr("width", "330px");
						var dateTd = $("<td>").text(obj.createDate).attr("width", "150px");
						
						var tr = $("<tr>").append(writerTd, contentTd, dateTd);
						
						$("#replyList").append(tr);
						
					});
				},
				error:function(){
					console.log("ajax 통신실패 -댓글조회")
				}
				
			})
		}
	</script>
 <%@ include file = "../common/footer.jsp" %>
</body>
  </html>