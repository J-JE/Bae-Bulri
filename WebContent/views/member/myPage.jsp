<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

    margin-left: 750px;
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
 
    text-decoration:none;
    color : white;

}
.my{
    margin-top: 50px;
    margin-left : 200px;
    

}

th,td{
    padding : 20px;
}
#update{
    background-color: blueviolet;
    color: white;
    text-align: center;
    border-radius: 8px;
    width: 90px;
    height: 30px;
    margin-top: 250px;
    margin-left: 80%;
}
#delete{
    background-color: blueviolet;
    color: white;

    text-align: center;
    border-radius: 8px;
    width: 90px;
    height: 30px
    
}
</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
    <div id="mypage">
    <h2 align="center">My Page</h2>
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
    <h5 align="center">님의 마이페이지</h5>
    <hr width="50%" ,align="center">

    <table class="my">
        <tr>
            <th>아이디</th>
            <td></td>
        </tr>

        <tr>
            <th>비밀번호</th>

        </tr>
        <tr>
            <th>이름</th>

        </tr>
        <tr>
            <th>이메일</th>

        </tr>
        <tr>
            <th>주소</th>

        </tr>
        <tr>
            <th>연락처</th>
            <td></td>
        </tr>
        <tr>
            <th>보유포인트</th>

        </tr>

        </table>
        <button type="button" id="update" onclick="updateUser()">회원 수정</button>
        <button type="button" id="delete" onclick="deleteUser()">회원 탈퇴</button>
        
    </div>
	<%@ include file = "../common/footer.jsp" %>
	
	<script type="text/javascript">
		function updateUser() {
			location.href="<%= request.getContextPath()%>/updateUser.do;"
		}
		
		function deleteUser() {
			location.href="<%= request.getContextPath()%>/deleteUser.do;"
			//프롬프트 창으로 비밀번호 확인 후 탈퇴 
		}
	</script>
</body>
</html>