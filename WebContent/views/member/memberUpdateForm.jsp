<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .update{
         
         width:600px;
         height:600px;
         margin-top:50px;
         margin-left:auto;
         margin-right:auto;
         
         }
         #updateForm{
             width: 100%;
             margin-left: 60px;
             margin-right: auto;
         }
         #updateForm td:nth-child(1){text-align:left;}
         #updateForm input{margin:10px;}
 
         .btn{  
             
             
             padding-top: 40px;
             text-align: center;
 
             
         }
         #updateBtn{
             border: 1px solid;
             border-radius: 5px;
             width: 240px;
             height: 56px;
             background-color: rgb(188, 231, 235);
             color: white;
             font-size: 15px;
         }
        
     </style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="update">
         <h2 align="left">회원정보 수정</h2>
         <hr>
         
             <form id="updateForm" action="<%=request.getContextPath() %>/updateMember.do" method="post" onsubmit="return joinValidate();">
                 <table>
                     <tr>
                         <td width="200px">아이디</td>
                         <td><input type="text" minlength="6" maxlength="20" name="userid" required></td>
                         <td></td>
                     </tr>
                     <tr>
                     
                     <td>비밀번호</td>
                     <td><input type="password" minlength="6" maxlength="20" name="userPwd" required></td>
                     <td></td>
                     </tr>
                     
                     <tr>
                         <td>비밀번호 확인</td>
                         <td><input type="password" maxlength="15" name="checkPwd" required></td>
                         <td><label id = "pwdResult"></label></td>
                     </tr>	
                     
                     <tr>
                         <td>이름</td>
                         <td><input type="text" maxlength="5" name="userName" required></td>
                         <td></td>
                     </tr>
                     
                     <tr>
                         <td>이메일</td>
                         <td><input type="email" name="email"></td>
                         <td></td>
                     </tr>
                     
                     <tr>
                         <td>전화번호</td>
                         <td><input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678"></td>
                         <td></td>
                     </tr>
                     
                     <tr>
                         <td>주소</td>
                         <td><input type="text" name="address"></td>
                         <td></td>
                     </tr>
                 
                 </table>
             </form>    
             <hr>
             <div class="btn" align="center">
                 <button type="submit" id="updateBtn" disabled>수정하기</button>
             </div>
             
     
	</div>
	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>