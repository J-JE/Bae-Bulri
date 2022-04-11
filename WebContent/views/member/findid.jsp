<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = String.valueOf(request.getAttribute("msg"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		
		width:600px;
		height:600px;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		
	    }
        .found-success{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #btnlogin{
            border: 1px solid;
            border-radius: 5px;
            width: 240px;
            height: 56px;
            background-color: rgb(188, 231, 235);
            color: white;
            font-size: 15px;
        }
        .found-login{
            display: flex;
            justify-content: center;
        }
        #btnjoin{
            border: 1px solid;
            border-radius: 5px;
            width: 240px;
            height: 56px;
            background-color: rgb(188, 231, 235);
            color: white;
            font-size: 15px;
        }
        .found-id{
        	font-size:1em;
        }
</style>
</head>
<body>
	<%@ include file = "/views/common/menubar.jsp" %>
	<form name="idsearch" method="post">
		<%
			if(id != null){
		%> 
		<div class="container">
			<div class="found-success">
				<h4> 회원님의 아이디는 </h4>
				<div class="found-id"><%= id %></div>
				<h4>  입니다</h4>
			</div>
            <hr>
			<div class="found-login">
				<input type="button" id="btnlogin" value="로그인" onclick="login()"/>
			</div>
		</div>
		<%
			} else{
		%>
		<div class="container">
		<div class="found-fail">
			<h4>등록된 정보가 없습니다</h4>
		</div>
		<hr>
		<div class="found-login">
			<input type="button" id="btnjoin" value="회원가입" onclick="enrollPage();">
		</div>
		</div>
		<%} %>
	</form>
	<%@ include file = "/views/common/footer.jsp" %>
	
	<script>
	function enrollPage(){
		location.href="<%=request.getContextPath()%>/enrollFormMember.do";
		}
	function login(){
		location.href="<%=request.getContextPath()%>/loginMember.do";
	}	
	</script>
</body>
</html>