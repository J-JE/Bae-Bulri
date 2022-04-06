<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<%	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); %>--%>
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
        

    </style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="serachPwd">
		<h2 align="left">회원 관리</h2>
		<hr>
        <table class="listArea" align="center">
			<thead>
				<tr>
					<th width="100">아이디</th>
					<th width="100">회원명</th>
					<th width="300">연락처</th>
					<th width="100">주소</th>
					<th width="150">가입일</th>
				</tr>
			<thead>
			<tbody>
				<%-- 
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Member m : list){ %>
					<tr>
						<td><%= m.getUserNo() %></td>
						<td><%= m.getUserName() %></td>
						<td><%= m.getPhone() %></td>
						<td><%= m.getAddress() %></td>
						<td><%= m.getEnrollDate() %></td>
					</tr>
					<%} %>
				<%} %>--%>
			</tbody>
		</table>
    </div>
    	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>