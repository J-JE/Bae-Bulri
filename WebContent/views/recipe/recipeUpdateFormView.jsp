<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.common.*"%>
    
<%
 	ArrayList<Attachment> atList = (ArrayList<Attachment>)request.getAttribute("atList");
 %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   
    <title>레시피 수정</title>
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<style>
    .logo{height: 126px; width: 100%;}
    .logo>a>img{height:100% !important;  width: 100%;}

    .input-form {
      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }

    .recipe-menu-link{
        color:black;
        font-weight: bold;
    }

    .btn {
        background-color: #BCE7EB;
    }

    table {
        width: 1000px;
    }

  </style>
  </head>
  
  <body>

 <%@ include file = "../common/menubar.jsp" %>
    <div class="container">
    
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <div class="outer">
                  <a class="recipe-menu-link" href="index.jsp">홈</a>
                   &gt; 
                  <a class="recipe-menu-link" href="#">레시피</a>
                   &gt; 
                  <a class="recipe-menu-link" href="#">수정하기</a>
          </div>
          <hr>
  
          <form class="validation-form was-validated" action="<%=contextPath%>/updateRecipe.do" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="name">레시피 제목</label>
                <input type="text" class="form-control" id="name" name="title" placeholder="" value="" required>
              </div>
              </div>
  
              <div class="mb-3">
                  사진 등록<br>
                  <div class="form_section_content">
                      <input type="file" id="fileItem" name="upFile" style="height: 30px;">               
                      <div id="uploadResult">
              </div>
              </div>
             </div>
              <br>
  
              <div class="mb-3">
                  <label for="tag">태그</label>
                  <input type="text" class="form-control" id="tag" name="tag" placeholder="" value="" required="">
              </div>
  
            <div class="mb-3">
              <label for="description">레시피 설명</label>
              <input type="text" class="form-control" id="description" name="desc" placeholder="" value="설명 입력" required="">
            </div>
            <hr>
  
            <div class="mb-3">
              <label for="product">재료</label>
              <input type="text" class="form-control" id="product" name="product" placeholder="" value="" required="">
            </div>
            <hr>
  
            <div class="mb-3">
              <label for="time">조리시간</label>
              <input type="text" class="form-control" id="time" name="time" placeholder="" value="" required="">
            </div>
            <hr>
  	
            <div class="row">
              <div class="col-md-8 mb-3">
                <label for="content"><h3>조리법 업로드</h3></label>
                	<div>
         
                <table align="center">
              
              
					<%--  <% if(!atList.isEmpty()) {%> 값을 다시 넣어보고 확인을 해야함 값 넣으면 될 듯 ?
							<%for(int i = 0; i < atList.size(); i++) { %>
							<tr>

								<td colspan="3">
									<%= atList.get(i).getOriginName()%>
									<input type='hidden' name='originFile' value='<%=atList.get(i).getChangeName()%>'>
									<input type='hidden' name='originFileNo' value='<%=atList.get(i).getFileNo()%>'>
								</td>
							</tr>
							<%} %>	
					<%} %> --%>
					
				
				
                    <tr>
                        <th >과정이미지</th>
                        <td>
                            <img id="subImg1" width="250px" height="150px"> 
                        </td>
                        <th>과정1</th>
                        <td><textarea name="content" rows="7" cols="60%" style="resize:none;"></textarea> </td>
                    </tr>
                    <tr>
                        <th >과정2이미지</th>
                        <td >
                            <img id="subImg2" width="250px" height="150px"> 
                        </td>
                        <th>과정2</th>
                        <td><textarea name="content" rows="7" cols="60%" style="resize:none;"></textarea> </td>
                    </tr>
                    <tr>
                        <th >과정3이미지</th>
                        <td >
                            <img id="subImg3" width="250px" height="150px"> 
                        </td>
                        <th>과정3</th>
                        <td><textarea name="content" rows="7" cols="60%" style="resize:none;"></textarea> </td>
                    </tr>



                </table>
                <div id="fileArea"> <!-- 파일을 등록할 수있게 -->
                    <input type="file" name="upFile2" id="upFile2" onchange="loadImg(this, 2);">
                    <input type="file" name="upFile3" id="upFile3" onchange="loadImg(this, 3);">
                    <input type="file" name="upFile4" id="upFile4" onchange="loadImg(this, 4);">
                </div>
            </div>
            
         
              <hr>
              </div>
            <div class="mb-4"></div>
            <button class="btn btn-primary btn-lg btn-block" type="submit">수정 완료</button>
            <button class="btn btn-primary btm-lg btn-block" type="button">수정 취소</button>
          
        
      </div>

    </div></form>

    <script>
      window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');
  
        Array.prototype.filter.call(forms, (form) => {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
  
            form.classList.add('was-validated');
          }, false);
        });
      }, false);


      $(function(){
		$("#fileArea").hide();
		
		$("#subImg1").click(function(){
			$("#upFile2").click();
		});
		
		$("#subImg2").click(function(){
			$("#upFile3").click();
		});
		
		$("#subImg3").click(function(){
			$("#upFile4").click();
		});
	
	});
    </script>
  
  
  </div></div>     	  <%@ include file = "../common/footer.jsp" %></body></html>