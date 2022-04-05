<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   </style>
</head>
<body>
        <!--  <%@ include file="../common/menubar.jsp" %> -->
    <div id="main">
   
            <div id="search">
                
                <input id='txtKeyWord' placeholder="상품명,#레시피"/>
                <input type='button' value='검색'/>
            </div>
            <hr>
    <!-- 스토어 목록  -->
        <div class="topList" align="center">
            <br>
            <div id="List">
                   
                   
                <div class="product" align="center"> 
                    <input type="hidden" value="1"> 
                    <img src="/j.jpg" width="350px" height="150px"> <br>
                    <a>#김치볶음밥</a><br>
                    <a>국내산김치</a><br>
                    <a>15000원</a>
                    </div>
                            <div class="product" align="center"> 
                                <input type="hidden" value="1"> 
                                <img src="/j.jpg" width="350px" height="150px"> <br>
                                <a>#김치볶음밥</a><br>
                                <a>국내산김치</a><br>
                                <a>15000원</a>
                                </div>
                                <div class="product" align="center"> 
                                    <input type="hidden" value="1"> 
                                    <img src="/j.jpg" width="350px" height="150px"> <br>
                                    <a>#김치볶음밥</a><br>
                                    <a>국내산김치</a><br>
                                    <a>15000원</a>
                                    </div>
                                    <div class="product" align="center"> 
                                        <input type="hidden" value="1"> 
                                        <img src="/j.jpg" width="350px" height="150px"> <br>
                                        <a>#김치볶음밥</a><br>
                                        <a>국내산김치</a><br>
                                        <a>15000원</a>
                                        </div>
                                        <div class="product" align="center"> 
                                            <input type="hidden" value="1"> 
                                            <img src="/j.jpg" width="350px" height="150px"> <br>
                                            <a>#김치볶음밥</a><br>
                                            <a>국내산김치</a><br>
                                            <a>15000원</a>
                                            </div>
                                            <div class="product" align="center"> 
                                                <input type="hidden" value="1"> 
                                                <img src="/j.jpg" width="350px" height="150px"> <br>
                                                <a>#김치볶음밥</a><br>
                                                <a>국내산김치</a><br>
                                                <a>15000원</a>
                                                </div>
                            </div>
                         
                            <button id="butt">재료추가</button><br><br>
            <nav aria-label="Page navigation example">
                
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#"> &lt; </a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#"> &gt; </a></li>
                </ul>
            </nav>
        </div></div>
    

      <%@ include file = "../common/footer.jsp" %>
       
 


  
</body>
</html>