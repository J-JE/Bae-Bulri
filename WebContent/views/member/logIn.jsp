<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .loginform{
		
		width:600px;
		height:600px;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		
	    }
        #loginform{
            width: 100%;
            margin-left: 160px;
            margin-right: auto;
        }
        #loginform td:nth-child(1){text-align:left;}
	    #loginform input{margin:10px;}
        .loginbtn{  
            padding-top: 40px;
            text-align: center;
        }
        #loginBtn{
            border: 1px solid;
            border-radius: 5px;
            width: 240px;
            height: 56px;
            background-color: rgb(188, 231, 235);
            color: white;
            font-size: 15px;
        }
        #enrollBtn{
            border: 1px solid;
            border-radius: 5px;
            width: 240px;
            height: 56px;
            margin-top: 10px;
            background-color: white;
            color: rgb(155, 89, 182);
            font-size: 15px;
        }
        .searchUser{
            margin-left: 50px;
            float: left;
            font-size: 13px;
        }
        a{
            text-decoration: none;
            color: rgb(155, 89, 182);
        }
    </style>
</head>
<body>
	<%@ include file = "/views/common/menubar.jsp" %>
	<div class="loginform">
		<h2 align="left">로그인</h2>
		<hr>
        <div>
			<form id="loginform" action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return loginValidate();">
				<table>
					<tr>
						<th><label for="userId">아이디</label></th>
						<td><input id="userId" type="text" name="userId"></td>
					</tr>
					<tr>
						<th><label for="userPwd">비밀번호</label></th>
						<td><input id="userPwd" type="password" name="userPwd"></td>
					</tr>
				</table>
				<div class="searchUser">
					<a class="link" href="" onclick="">아이디 찾기</a>
					<span class="bar">/</span>
					<a class="link" href="" onclick="">비밀번호 찾기</a>
				</div>
        </div>      
				<br>
				<div class="loginbtn" align="center">
				<hr>
				
					<button type="submit" id="loginBtn">로그인</button><br>
					<button type="button" id="enrollBtn" onclick="enrollPage();">회원가입</button>
				</div>
			</form> 
	</div>
	<script type="text/javascript">
	function loginValidate(){
		if($("#userId").val().trim().length === 0){
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		if($("#userPwd").val().trim().length === 0){
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus();
			return false;
		}
		return true;
	}	
	</script>
	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>