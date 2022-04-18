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
            height:500px;
            margin: 0 auto; /*가운데 정렬*/
        }
  
  
      .main{
        color: rgb(155, 89, 182);
          font-weight: bold;
          font-size: x-large;
      }
 
        .f1{
            height: 30px;
            margin-left: 500px;
            background-color: rgb(155, 89, 182);
            color: white;
        }
        .f2{
           
            color: white;
            background-color: rgb(131, 46, 131);
        }
      .form-control{
      	height: 350px;
      }
       
    </style>
  </head>
  
  <body>
    <%@ include file="../common/menubar.jsp" %>
  <br>
    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <div class="outer">
                  <a class="main" href="cookTalkList.do">쿡&토크</a>
                   &gt; 
                  <a class="main" href="#">글 수정</a>
                  
          </div>
          <hr>
  
          <form class="validation-form was-validated" action="<%=request.getContextPath()%>/upDateCookTalk.do" method="post"  >
            <input type="hidden" name="cno" value="<%= c.getBoardNo() %>">
            <div class="row">
              <div class="col-md-6 content">
                <label for="name">제목</label>
                <input type="text" class="form-control" name=ckTitle value="<%= c.getBoardTitle() %>">
              </div>
              </div>

              <br>
            
              <div class="form-group">
                <label for="name">내용</label>
               	 <textarea class="form-control" rows="10" name="ckContent" ><%= c.getBoardContent() %></textarea>
            </div>
            <br>
            
         
            <div id="f12">
            <button class="f1" type="submit" id="butt"> 수정하기 </button>
           <button class="f2" type="reset" id="butt1">취소하기</button>
       
      	  </div>
         </form>
        </div>
      <script type="text/javascript">
     $(function(){
 		$('#butt1').click(function(){
 			if(confirm("수정을 최소 하시겠습니까?")){
 			location.href="<%=request.getContextPath()%>/cookTalkList.do";
 			}
 		});
 		
 	});
        </script>
      </div>
      <!-- fotter 자리 -->
   </div>

  	  <%@ include file = "../common/footer.jsp" %>

  
  
  </body>
  </html>