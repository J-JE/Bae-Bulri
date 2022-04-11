<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .serachPwd{
		
		width:600px;
		height:600px;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		
	    }
	    .name-phone{
	    	margin-left: 110px;
	    }
        #serachPwd{
            width: 100%;
            margin-left: 0px;
            margin-right: auto;
        }
        #serachPwd td:nth-child(1){text-align:left;}
	    #serachPwd input{margin:10px;}
        .searchbtn{  
            padding-top: 40px;
            text-align: center;
        }
        .searchbtn{  

            display: flex;
            justify-content: center;
            padding-top: 40px;
            gap: 10px;
            text-align: center;
        }
        #pwdBtn{
            border: 1px solid;
            border-radius: 5px;
            width: 240px;
            height: 56px;
            background-color: rgb(188, 231, 235);
            color: rgb(155, 89, 182);
            font-size: 15px;
        }
        input{
            width: 250px;
            height: 30px;
        }
        input::placeholder{font-size:13px;}
    </style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="serachPwd">
		<h2 align="left">비밀번호 찾기</h2>
		<hr>
        <form id="serachPwd" action="<%=request.getContextPath()%>/serachPwd.do" method="post">
            <div class="name-phone">
            <table>
                <tr>
                    <th><label for="userId">아이디</label></th>
                    <td><input id="userId" type="text" name="userId" placeholder="아이디를 입력해 주세요"></td>
                </tr>
                <tr>
                    <th><label for="userName">이름</label></th>
                    <td><input id="userName" type="text" name="userName" placeholder="이름을 입력해 주세요"></td>
                </tr>
                <tr>
                    <th><label for="Phone">연락처</label></th>
                    <td><input id="Phone" type="tel" name="Phone" placeholder="가입시 등록한 번호를 입력해주세요"></td>
                </tr>
            </table>
         	</div>   
        
			<br>
            <hr>
            <div class="searchbtn" align="center">
                <button type="submit" id="pwdBtn">비밀번호 찾기</button><br>
                
            </div>
         </form>       
	</div>
	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>