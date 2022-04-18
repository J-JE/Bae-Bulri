<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border:1px solid black;
		 width: 60%;
	    border: 1px solid #444444;
	    border-collapse: collapse;
  }
 	 th, td {
    	border: 1px solid #444444;
  }
  th{
  	font-weight:400;
  	text-align: center;
  }
 
</style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">설문조사 글 작성하기</h2>
		<br>
		
		
		<form id="insertForm" action="<%= contextPath %>/insertsurvey.do" method="post" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<th width="100">제목</th>
					<td colspan="3"><input type="text" name="title" width="130px;"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="content" rows="5" style="resize:none;"></textarea>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td colspan="3">
						<input type="file" name="upfile">
					</td>
				</tr>
				
			</table>
			
			<br>
			
			<div class="btns" align="center">
		
				<button type="submit">작성하기</button>
			</div>
		</form>
	</div>
	
	
	<%@ include file = "/views/common/footer.jsp" %>	
</body>
</html>