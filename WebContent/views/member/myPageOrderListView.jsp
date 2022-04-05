<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역조회 </title>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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


</style>
</head>
<body>
 <%@ include file = "../common/menubar.jsp" %>
    <div id="mypage">
        <h2 align="center">주문내역 조회</h2>
        <div class="myPageMenu">
	        <div class="myPagemenuBar">
	            <a href="<%=request.getContextPath()%>/views/member/myPageOrderListView.jsp">주문내역조회</a>  
	        </div>
	        <div class="myPagemenuBar">
	            <a href="<%= request.getContextPath()%>/views/member/myPageBoardListView.jsp">내가쓴글 조회</a>
	        </div>
	        <div class="myPagemenuBar">
	            <a href="<%= request.getContextPath()%>/views/member/myPageLikeyListView.jsp">나의 찜 목록</a>
        </div>
        </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>


            <table class="table table-hover table-striped text-center">
              <thead>
                <tr>
                    <th>번호</th>
                    <th>구매일</th>
                    <th>구매내역</th>
                    <th>수량</th>
                    <th>가격</th>
                    <th>배송상태</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                    <td>1</td>
                    <td>10000원</td>
                    <td>배송중</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                    <td>1</td>
                    <td>10000원</td>
                    <td>배송중</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                    <td>1</td>
                    <td>10000원</td>
                    <td>배송중</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                    <td>1</td>
                    <td>10000원</td>
                    <td>배송중</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                    <td>1</td>
                    <td>10000원</td>
                    <td>배송중</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2022-04-04</td>
                    <td>감</td>
                    <td>1</td>
                    <td>10000원</td>
                    <td>배송중</td>
                </tr>

                
            </tbody>
            </table>
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