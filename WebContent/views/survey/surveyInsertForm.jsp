<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">설문조사 글 작성하기</h2>
		<br>
		
		
		<form id="insertForm" action="insertsurvey.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="writer" value="<%= loginUser.getUserId() %>">
			<table align="center">
				<tr>
					<th width="100">제목</th>
					<td colspan="3"><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="content" rows="5" style="resize:none;"></textarea>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td colspan="3">
						<img id="titleImg" width="150" height="120">
					</td>
				</tr>
				
			</table>
			
			<div id="fileArea">
				<input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
			</div>
			
			<br>
			
			<div class="btns" align="center">
		
				<button type="submit">작성하기</button>
			</div>
		</form>
	</div>
	<script>
	$(function(){
		$("#fileArea").hide();
		
		$("#titleImg").click(function(){
			$("#file1").click();
		});
		
	});
	function loadImg(inputFile, num){
		if(inputFile.files.length == 1){
			var reader = new FileReader();//파일 읽어들일 객체 생성
			reader.readAsDataURL(inputFile.files[0]); //파일 읽어 들이는 메소드
			
			reader.onload = function(e){ //파일 읽기가 다완료되면 실행
				switch(num){
				case 1 : $("#titleImg").attr("src", e.target.result); break;
				}
			}
		}
	}
	
	
	</script>
	
	<%@ include file = "/views/common/footer.jsp" %>	
</body>
</html>