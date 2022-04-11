<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Member m = (Member)session.getAttribute("loginUser"); %>
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
        .idpwd{
            margin-left: 110px;
        }
        #deleteMember{
            width: 100%;
            margin-left: 0;
            margin-right: auto;
        }
        #deleteMember td:nth-child(1){text-align:left;}
	    #deleteMember input{margin:10px;}
        .deletebtn{  

            display: flex;
            justify-content: center;
            padding-top: 40px;
            gap: 10px;
            text-align: center;
        }
        #return{
            border: 1px solid rgb(188, 231, 235);
            border-radius: 5px;
            width: 240px;
            height: 56px;
            background-color: rgb(188, 231, 235);
            color: red;
            font-size: 15px;
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
        <form id="deleteMember" action="<%=request.getContextPath()%>/deleteMember.do" method="post" onsubmit="return deletem();">
            <div class="idpwd">
	            <table>
	                
	                <tr>
	                    <th><label for="userId">아이디</label></th>
	                    <td><input id="userId" type="text" name="userId" value="<%=m.getUserId()%>" readonly></td>
	                </tr>
	                <tr>
	                    <th><label for="userPwd">비밀번호 입력</label></th>
	                    <td><input id="userPwd" type="password" name="userPwd" placeholder="비밀번호를 입력해 주세요"></td>
	                </tr>
	            </table>
	            
	        </div>
				<br>
            	<hr>
            
            
            <div class="deletebtn" align="center">
                <button type="button" id="return" onclick="main()">돌아가기</button><br>
                <button type="submit" id="deleteBtn">회원탈퇴</button><br>
            </div>
        </form>        
	</div>
	<script>
		function main(){
			location.href ="<%= request.getContextPath()%>";
		}
		function deletem(){
			if (confirm('정말 탈퇴 하시겠습니까?')){return true}
			else {
			   alert('취소되었습니다')
			return false
			}
		}
	</script>
	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>