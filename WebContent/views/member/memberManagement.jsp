<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.uni.member.model.dto.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
        	margin-top:50px;
			margin-left:auto;	
			margin-right:auto;
        }
        table {
        	width:800px;
        	font-size: 15px;
            border-top: 0.1px solid #444444;
            border-collapse: collapse;
            text-align: center;
        }
        th, td {
            border-bottom: 0.1px solid #444444;
            border-left: 0.1px solid #444444;
            padding: 10px;
        }
        th:first-child, td:first-child {
            border-left: none;
        }
        th{
            background-color: rgb(245, 245, 245);
            font-weight: 400;
        }
        
    </style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">전체 회원 관리</h2>
		<br>
		<form action="<%=request.getContextPath()%>/checkmember.do" method="post">   
			<table class="listArea" align="center">
				<thead>
					<tr>
	                    <th width="30"><input type="checkbox" name="select-all"></th>
						<th width="100">아이디</th>
						<th width="80">회원명</th>
						<th width="100">연락처</th>
						<th width="100">이메일</th>
						<th width="100">주소</th>
	                    <th width="100">가입일</th>
					</tr> 	
				</thead>
				<tbody>
					
			<% if(list.isEmpty()){ %>
					 	<tr>
							<td colspan="5">가입된 회원이 없습니다.</td>
						</tr>
					 <% }else{  %>
					 	<% for(Member m : list){ %>
					 		<tr>
					 			<td><input type="checkbox" name="selected" value=<%= m.getUserId() %>></td>
					 			<td><%= m.getUserId() %></td>
								<td><%= m.getUserName() %></td>
								<td><%= m.getEmail() %></td>
								<td><%= m.getPhone() %></td>
								<td><%= m.getAddress() %></td>
								<td><%= m.getEnrollDate() %></td>
					 		</tr>
					 	<% } %>
					 <% } %>
				</tbody> 
				
			</table>
			
			<br><br>
			<div align="center">
				<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
				
				<%-- <button onclick="location.href='<%=contextPath%>/deleteMember.do'">삭제하기</button>--%>
				<button type="submit" id="deletemember">선택삭제</button> 
			<% } %>
			</div>
		</form>    
	</div>
	<script>
		$('input[name=select-all]').on('change', function(){
		  $('input[name=selected]').prop('checked', this.checked);
		});
	</script>
    	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>