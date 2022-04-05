<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .deleteMember{
		
		width:600px;
		height:600px;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		
	    }
        #deleteMember{
            width: 100%;
            margin-left: 160px;
            margin-right: auto;
        }
        #deleteMember td:nth-child(1){text-align:left;}
	    #deleteMember input{margin:10px;}
        .btn{  
            padding-top: 40px;
            text-align: center;
        }
        #deleteBtn{
            border: 1px solid rgb(188, 231, 235);
            border-radius: 5px;
            width: 240px;
            height: 56px;
            background-color: rgb(188, 231, 235);
            color: red;
            font-size: 15px;
        }
        input{
            width: 250px;
            height: 30px;
        }
    </style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="deleteMember">
		<h2 align="left">회원 탈퇴</h2>
		<hr>
        <form id="deleteMember" action="<%=request.getContextPath()%>/deleteMember.do" method="post" onsubmit="return loginValidate();">
            <table>
                
                <tr>
                    <th><label for="userId">아이디</label></th>
                    <td><input id="userId" type="text" name="userId" placeholder="아이디를 입력해 주세요"></td>
                </tr>
                <tr>
                    <th><label for="userPwd">비밀번호 입력</label></th>
                    <td><input id="userPwd" type="password" name="userPwd" placeholder="비밀번호를 입력해 주세요"></td>
                </tr>
            </table>
            
        </form>    
			<br>
            <hr>
            <div class="btn" align="center">
                <button type="submit" id="deleteBtn">회원탈퇴</button><br>
                
            </div>
            
	</div>
	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>