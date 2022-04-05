<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .tab_content{
            text-align: left;font-size: 0;max-width: 850px;margin: 100px auto;
        }
        input[type="radio"] {display: none;}
        input[type="radio"] + label {display: inline-block;padding: 20px;background: aqua;color: #999;font-size: 14px;cursor: pointer;}
        input[type="radio"]:checked + label {background: #aaa;color: #000;}

        .conbox {width: 850px;height: 300px;background: #aaa;margin:0 auto;display: none;}
        input[id="tab01"]:checked ~ .con1 {display: block;}
        input[id="tab02"]:checked ~ .con2 {display: block;}

        .button{
            margin-top: 20px ;
            margin-left: 10px;
            margin-right: 10px;
            text-align: right;
        }
        #deletebtn{
            margin-left: 5px;
        }
        button[name="surbtn"] {font-size: 15px;}
        label[name="tablabel"] {width: 100px; height: 50px; margin: 0px; text-align: center;}
    </style>
</head>
<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div class="tab_content">
	        <input type="radio" name="tabmenu" id="tab01" checked>
	        <label for="tab01" name="tablabel">진행중</label>
	        <input type="radio" name="tabmenu" id="tab02">
	        <label for="tab02" name="tablabel">종료</label>
	
	        <div class="conbox con1">
	            내용1
	            <div class="button">
	                <button type="submit" name="surbtn" id="updatebtn">수정</button>
	                <button type="submit" name="surbtn" id="deletebtn">삭제</button>
	            </div>
	        </div>
	        <div class="conbox con2">내용2</div>
	    </div>
	    
	    <div class="replyArea">
			<!-- 댓글 작성하는 div -->
			<table border="1" align="center">
				<tr>
					<th>댓글작성</th>
					<% if(loginUser != null){ %>
					<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
					<td><button id="addReply">댓글등록</button></td>
					<% }else{ %>
					<td><textarea readonly rows="3" cols="60" id="replyContent" style="resize:none;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea></td>
					<td><button disabled>댓글등록</button></td>
					<% } %>
				</tr>
			</table>
		<!-- 댓글 리스트들 보여주는 div -->
			<div id="replyListArea">
				<table id="replyList" border="1" align="center">
					<!-- <tr>
						<td width="100px">admin</td>
						<td width="330px">댓글작성내용</td>
						<td width="150px">2020년 1월 23일</td>
					</tr>
					<tr>
						<td width="100px">user01</td>
						<td width="330px">댓글작성내용</td>
						<td width="150px">2020년 1월 22일</td>
					</tr>
					<tr>
						<td width="100px">test01</td>
						<td width="330px">댓글작성내용</td>
						<td width="150px">2020년 1월 20일</td>
					</tr> -->
				</table>
			</div>
		</div>
		<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>