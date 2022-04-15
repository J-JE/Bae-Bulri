<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.uni.survey.model.dto.Survey"%>
<%
	ArrayList<Survey> list = (ArrayList<Survey>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .tab_content{
            text-align: left;font-size: 15px;max-width: 850px;margin: 50px auto;
        }
        input[type="radio"] {display: none;}
        input[type="radio"] + label {display: inline-block;padding: 20px;background: transparent;color: black;font-size: 20px;cursor: pointer;}
        input[type="radio"]:checked + label {background: transparent;color: purple;}

        .conbox {width: 850px; margin:0 auto;display: none;}
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
        label[name="tablabel"] {width: 100px; height: 50px; margin: 0px; text-align: center; background-color: transparent;}
   		table{
   			margin-top:40px;
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
        
        .insertsurvey{
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
	<div class="tab_content">
	        <input type="radio" name="tabmenu" id="tab01" checked>
	        <label for="tab01" name="tablabel">진행중</label>
	        <input type="radio" name="tabmenu" id="tab02">
	        <label for="tab02" name="tablabel">종료</label>
			<hr>
	        <div class="conbox con1">
				<table class="listArea" align="center">
					<thead>
						<tr>
							<th width="10">글번호</th>
							<th width="100">글제목</th>
							<th width="50">작성일</th>
						</tr>
					</thead>
					<tbody>
						<% %>
						<% if(list.isEmpty()){ %>
								 	<tr>
										<td colspan="5">진행중인 설문이 없습니다.</td>
									</tr>
								 <% }else{  %>
								 		
								 	<% for(Survey s : list){ %>
								 		<%if(s.getStatus().equals("Y")){ %>
								 		<tr>
								 			<td><%= s.getSurveyNo() %></td>
											<td><%= s.getSurveyTitle() %></td>
											<td><%= s.getCreateDate() %></td>
								 		</tr>
								 	<% } %>
								 	<%} %>
								 <% } %>
					</tbody>
	        	  </table>    
	        	  <br><br>
	        	  <div align="center">
					<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
			
					<button class="insertsurvey" onclick="location.href='<%=contextPath%>/insertFormsurvey.do'">작성하기</button> 
					<% } %>
				</div>  
	        </div>
	            
	        <div class="conbox con2">
				<table class="listArea" align="center">
					<thead>
						<tr>
							<th width="10">글번호</th>
							<th width="100">글제목</th>
							<th width="50">작성일</th>
						</tr>
					</thead>
					<tbody>
						<% %>
						<% if(list.isEmpty()){ %>
								 	<tr>
										<td colspan="5">진행중인 설문이 없습니다.</td>
									</tr>
								 <% }else{  %>
								 		
								 	<% for(Survey s : list){ %>
								 		<%if(s.getStatus().equals("N")){ %>
								 		<tr>
								 			<td><%= s.getSurveyNo() %></td>
											<td><%= s.getSurveyTitle() %></td>
											<td><%= s.getCreateDate() %></td>
								 		</tr>
								 	<% } %>
								 	<%} %>
								 <% } %>
					</tbody>
	        	  </table>    
			</div>
	    </div>
	    
	    <script type="text/javascript">
			<% if(!list.isEmpty()){%>
				$(function(){
					$(".listArea>tbody>tr").click(function(){
						var nno = $(this).children().eq(0).text();
						
						location.href ="<%=contextPath%>/detailsurvey.do?nno="+nno;
					})
				})
				
			<%}%>
		</script>
		<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>