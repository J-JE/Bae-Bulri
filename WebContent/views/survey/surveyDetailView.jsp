<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.uni.survey.model.dto.Survey, com.uni.common.Attachment" %>

<%
	Survey s = (Survey)request.getAttribute("s");
	Attachment at = (Attachment)request.getAttribute("at");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		
		width:850px;
		
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
    .tablearea{
    	display:flex;
		justify-content:center;
    }
    a{
    	text-decoration: none;
    }
    table{
    	border:none;
    }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">진행중인 설문조사</h2>
		
		<hr>
		<div class=tablearea>
			<table id="detailArea" border="1">
				<tr>
					
					<td colspan="3"><%= s.getSurveyTitle() %></td>
				</tr>
				<tr>	
					<td colspan="3">
						<% if(at != null){ %>
						
						<div id="titleImgArea" align="center">
							<img width="100%" height="300px" id="titleImg" src="<%= contextPath %>/resources/images/survey/<%= at.getChangeName() %>">
						</div>
						</td>
						
						<% } %>
				
				</tr>	
			</table>
			
			<br>
		</div>	
			<br>
			<div class="btns" align="center">
			
				<a href="surveyList.do">목록으로</a> &nbsp;&nbsp;
				<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
				<!-- <a href="updateFormSurvey.do?nno=<%=s.getSurveyNo()%>">수정하기</a> &nbsp;&nbsp; -->
				<a href="deleteSurvey.do?nno=<%=s.getSurveyNo()%>">삭제하기</a>
			
				<% } %>
				
			
			</div>
			<br><br>
			<div class="replyArea">
				<!-- 댓글 작성하는 div -->
				<table border="1" align="center">
					<tr>
						<th>댓글작성</th>
						<% if(loginUser != null){ %>
						<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
						<td><button id="addReply">댓글등록</button></td>
						<% }else{ %>
						<td><textarea readonly rows="3" cols="80" id="replyContent" style="resize:none;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea></td>
						<td><button disabled>댓글등록</button></td>
						<% } %>
					</tr>
				</table>
				<!-- 댓글 리스트들 보여주는 div -->
				<div id="replyListArea">
					<table id="replyList" border="1" align="center"></table>
				</div>
			</div>
	</div>
	<script>
	$(function(){
		selectReplyList();
		$("#addReply").click(function(){
			var content = $("#replyContent").val();
			var sno = <%=s.getSurveyNo()%>;
			
			
			$.ajax({
				url:"srinsert.do",
				type:"post",
				data:{
						content:content,
						sno:sno
				},
				success:function(status){
					if(status =="success"){
						selectReplyList();
						$("#replyContent").val("");
						console.log("test")
					}
				},
				error:function(){
					console.log("ajax 통신실패 -댓글등록")
				}
				
			})
			
		})
		
	})
	function selectReplyList(){
			$("#replyList").empty();
			$.ajax({
				url:"srlist.do",
				data:{sno:<%=s.getSurveyNo()%>},
				type:"get",
				success:function(list){
					console.log(list)
				
					$.each(list, function(index, obj){
						
						var writerTd = $("<td>").text(obj.userid).attr("width", "100px");
						var contentTd = $("<td>").text(obj.replyContent).attr("width", "330px");
						var dateTd = $("<td>").text(obj.createDate).attr("width", "150px");
						
						var tr = $("<tr>").append(writerTd, contentTd, dateTd);
						
						$("#replyList").append(tr);
						
					});
				},
				error:function(){
					console.log("ajax 통신실패 -댓글조회")
				}
				
			})
		}
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>