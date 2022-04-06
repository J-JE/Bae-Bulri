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
 #mypage{

width:1000px;
height:100%;
margin: auto;
margin-top:80px;

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

.thumb {

		width: 150px;
		height: 150px;
        text-align: center;
        margin-left: 80px;
        margin-top: 100px;
        float: left;

  
	}
.topList {
		width: 1000px;
		height: 900px;
		color: black;
		margin-right: 1000px;


	}
#thumbList{
    margin-top: 50px;
    display: block;
    float: left;

}
.button{
    float: right;
    background-color: blueviolet;
    color: white;
    border-radius: 8px;
    width: 50px;
    height: 30px;
}
/*페이징*/
#divPaging {
            clear:both; 
            margin-top: 150px; 
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
        
      margin-top: 10px;
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


    
    
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>
    <div id="mypage">
        <h2 align="center">나의 찜 목록</h2>
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
       
        <div class="topList" align="center">
            <br>
            <div id="thumbList">
                    <div class="thumb" align="center"> 
                    <input type="hidden" value="1"> 
                    <img src="/i.jpg" width="150px" height="150px"> <br>
                    <p>제목입니다.</p>
                    <button class="button">삭제</button>
                    </div>
                    <div class="thumb" align="center"> 
                        <input type="hidden" value="1"> 
                        <img src="i.jpg" width="150px" height="150px"> <br>
                        <p>제목입니다.</p>
                       <button class="button">삭제</button>
                     </div>
                     <div class="thumb" align="center"> 
                        <input type="hidden" value="1"> 
                        <img src="/i.jpg" width="150px" height="150px"> <br>
                        <p>제목입니다.</p>
                        <button class="button">삭제</button>
                    </div>
                     <div class="thumb" align="center"> 
                            <input type="hidden" value="1"> 
                            <img src="/i.jpg" width="150px" height="150px"> <br>
                            <p>제목입니다.</p>
                           <button class="button">삭제</button>
                     </div>

                     <div class="thumb" align="center"> 
                        <input type="hidden" value="1"> 
                        <img src="/i.jpg" width="150px" height="150px"> <br>
                        <p>제목입니다.</p>
                        <button class="button">삭제</button>
                        </div>
                        <div class="thumb" align="center"> 
                            <input type="hidden" value="1"> 
                            <img src="i.jpg" width="150px" height="150px"> <br>
                            <p>제목입니다.</p>
                          <button class="button">삭제</button>
                         </div>
                         <div class="thumb" align="center"> 
                            <input type="hidden" value="1"> 
                            <img src="/i.jpg" width="150px" height="150px"> <br>
                            <p>제목입니다.</p>
                            <button class="button">삭제</button>
                        </div>
                         <div class="thumb" align="center"> 
                                <input type="hidden" value="1"> 
                                <img src="/i.jpg" width="150px" height="150px"> <br>
                                <p>제목입니다.</p>
                                <button class="button">삭제</button>
                         </div>
                        </div>      
            
            </div>

    
            <br>
            <br>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#"> &lt; </a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#"> &gt; </a></li>
                </ul>
            </nav>
        </div>
    

    
       
        <%@ include file = "../common/footer.jsp" %>



</body>
</html>