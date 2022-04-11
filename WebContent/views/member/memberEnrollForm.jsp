<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       .enroll{
		
		width:600px;
		height:600px;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		
	    }
        #enrollForm{
            width: 100%;
            margin-left: 60px;
            margin-right: auto;
        }
        #enrollForm td:nth-child(1){text-align:left;}
	    #enrollForm input{margin:10px;}

        .joinbtn{
            
            
            padding-top: 40px;
            text-align: center;

            
        }
        #joinBtn{
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
	<div class="enroll">
		<h2 align="left">회원 가입</h2>
		<hr>
			<div>
				<form id="enrollForm" action="<%=request.getContextPath() %>/insertMember.do" method="post" onsubmit="return joinValidate();">
					<table>
						<tr>
							<td width="200px">아이디</td>
							<td><input type="text" minlength="6" maxlength="20" name="userId" required></td>
							<td width="200px">
								<button type="button" id="idcheckBtn" onclick="checkId();">중복확인</button>
							</td>
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
							<td>전화번호</td>
							<td><input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678"></td>
							<td></td>
						</tr>
						
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email"></td>
							<td></td>
						</tr>
						
						<tr>
							<td>주소</td>
							<td><input type="text" name="address"></td>
							<td></td>
						</tr>
	                
	                    <%-- <tr id="recommend">
	                        <td>추천인 id</td>
	                        <td><input type="text" name="RecommendeId"></td>
	                        <td>(선택사항)</td>
	                    </tr>
	                    --%>
					</table>
                </div>
	            <hr>
	            <div class="joinbtn" align="center">
	                <button type="submit" id="joinBtn" disabled>가입하기</button>
	            </div>
            </form>
            
	</div>
	<%@ include file = "/views/common/footer.jsp" %>
	<script type="text/javascript">
		function joinValidate(){
		
		if(!(/^[a-z][a-z\d]{4,20}$/i.test($("#enrollForm input[name=userId]").val()))){
			$("#enrollForm input[name=userId]").focus();
	        return false;
		}
		
		if($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()){
			$("#pwdResult").text("비밀번호 불일치").css("color", "red");
			return false;			
		}
		
		 if(!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]").val()))){
			 $("#enrollForm input[name=userName]").focus();
	        return false;
		 }
		 
		 return true;
		
		}
		function checkId(){
			var userId = $("#enrollForm input[name=userId]");
			if(userId.val()==""){
				alert("아이디를입력해주세요")
				return false;
			}
			
			
			$.ajax({
				url:"idCheck.do",
				type:"post",
				data:{userId:userId.val()},
				success:function(result){
					if(result =="fail"){
						alert("사용할수없는 아이디입니다.");
						userId.focus();
						
					}else{
						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
							userId.attr("readonly","true");
							$("#joinBtn").removeAttr("disabled");
						}else{
							userId.focus();
						}
					}
				},
				error:function(){
					console.log("서버통신실패")
				}
			});
			
		}
	</script>
</body>
</html>