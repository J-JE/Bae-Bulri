<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.uni.survey.model.dto.Survey, com.uni.common.Attachment" %>

<%
	Survey s = (Survey)request.getAttribute("survey");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">진행중인 설문조사</h2>
		

		<table id="detailArea" border="1">
			<tr>
				<td>제목</td>
				<td colspan="3"><%= s.getSurveyTitle() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%= s.getCreateDate() %></td>
			</tr>
			<tr>
				<td colspan="4">내용</td>
			</tr>
			<tr>
				<td colspan="3">
					<% if(at != null){ %>
					<img src="<%=contextPath%>/resources/images/survey/<%=at.getChangeName()%> style="width: 50px; float: left; margin: 4px 4px 0px 0px;">
					<% }else{ %>
					첨부파일이 없습니다.
					<% } %>
				</td> 
			</tr>	
		</table>
		
		<br>
		
		<div class="btns" align="center">
		
			<a href="surveyList.do">목록으로</a> &nbsp;&nbsp;
				
			<%-- 
			<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
			<a href="updateFormNotice.do?nno=<%=n.getNoticeNo()%>">수정하기</a> &nbsp;&nbsp;
			<a href="deleteNotice.do?nno=<%=n.getNoticeNo()%>">삭제하기</a>
		
			<% } %>
			--%>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>