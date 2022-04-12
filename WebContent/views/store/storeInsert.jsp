<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
        <style>

        .main{
            margin-left:100px;
       
      }
          .outer{
                width:80%;
                margin: 0 auto;
                margin-left: 450px;
                position: relative;
                width: 1500px;
                height:  700px;
            }
            #content{
                width: 500px; height: 500px;
                float: left;
                margin-left:50px;
                position: relative;
                
            }            
            #all_butt{
                margin-left: 600px;
            }
            #store_all{
                margin-left: 100px;
            }
            #name{
                width: 250px; height: 40px;
            }
            #store_price{
                margin-top: 310px;
                margin-left: 600px;
            }
            #store_amount{
                margin-left: 600px;
            }
            #all_butt{
                margin-top: 250px;
            }
            #o_butt{
                background-color: rgb(87, 69, 69);
                color: white;
            }
            #b_butt{ background-color: rgb(87, 69, 69);
                color: white;}
            #i_butt{
                margin-left: 300px;
                background-color: rgb(155, 89, 182);;
                color: white;
            }
         
        </style>
    
    </head>
    <body>

	    <%@ include file="../common/menubar.jsp" %> 
         <hr>
        <div class="outer">
           
            <h1 class="main" href="index.jsp">재료추가</h1>
            <hr>
            <div id="content"> 
                <img src="" width="400px" height="400px">
                <br><br>
                <button id="i_butt">사진등록</button>
            </div>
                <div id="store_all">
            <div class="store_title">
                <h4 for="name">제목</h4>
                <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요" value="" required="">
              </div>
              <br>
              <div class="store_price">
                <h4 for="name">가격</h4>
                <input type="text" class="form-control" id="name" placeholder="가격을 입력해주세요" value="" required="">
              </div>
              <br>
              <div class="store_amount">
                <h4 for="name">재고</h4>
                <input type="text" class="form-control" id="name" placeholder="재고을 입력해주세요" value="" required="">
              </div>
            </div>
            <div id="all_butt">
                <button id="b_butt">등록</button>
                
                <button id="o_butt">취소</button>
            </div>
        </div>
    
           	 <%@ include file = "../common/footer.jsp" %>
            
    </body>
</html>