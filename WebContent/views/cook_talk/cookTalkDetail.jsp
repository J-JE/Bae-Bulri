<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .f1{
            height: 30px;
         
            background-color:rgb(170, 32, 170);
            color: white;
        }
        .f2{
            margin-left:650px;
             color: white;
            background-color: rgb(110, 18, 110);
        }
       
    </style>
  </head>
  
  <body>
    <!--  <%@ include file="../common/menubar.jsp" %> -->
  
    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <div class="outer">
                  <a class="main" href="index.jsp">쿡&토크</a>
                   &gt; 
                  <a class="main" href="#">글 목록</a>
                  
          </div>
          <hr>
          
          <form class="validation-form was-validated" novalidate="">
            <div class="row">
              <div class="col-md-6 content">
                <label id="sysdate">20220404</label>
                <label id="id">shslove</label>
                <p>레시피대로</p> 
             </div>
              </div>

              <br>
            
              <div class="form-group">
                <p>레시피대로 먹으니까 너무 맛있네요 어쩌고 저쩌고</p> 
            </div>
            <br>
            
         
            <div id="f12">
                <button class="f2" id="butt">삭제하기</button>
            <button class="f1" id="butt"> 수정하기 </button>
     
       
        </div>
        </div>
      </div>
    
    </div>
  
 <%@ include file = "../common/footer.jsp" %>
</body>
  </html>