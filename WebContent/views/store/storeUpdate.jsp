<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.common.*, com.uni.store.model.dto.*"%>
	<%
	Store s = (Store)request.getAttribute("s");
	Attachment at = (Attachment)request.getAttribute("at");
	%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
        <style>

        
		#top{
		  width: 800px;
           height:  500px;
           
           margin: auto;
		}
         #all_butt{
         margin-left:570px;
         }
     	.main1{
     	 color: rgb(155, 89, 182);
     	 font-size: large;
     	}
         
            #all_butt{
                margin-top:10px;
            }
            #o_butt{
                background-color: rgb(87, 69, 69);
                color: white;
            }
            #b_butt{ background-color: rgb(87, 69, 69);
                color: white;}
            #i_butt{
                margin-left: 300px;
                background-color: rgb(155, 89, 182);;
                color: white;
            }
         
        </style>
    
    </head>
    <body>
		 <%@ include file="../common/menubar.jsp" %>

         <hr>
        <div class="outer">
           <div id="top">
            <h1 class="main" href="index.jsp">재료수정</h1>
            <hr>
            <form class="updateForm was-validated" action="<%= contextPath %>/updateStore.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="sid" value="<%=s.getProductNo()%>">	  
            	  <div id="store_all">
            	  
            	  <div id="content"> 
         		<h4 for="name">제품사진</h4>
         			<% if(at != null){ %> <!-- 기존의 첨부파일이 있었을 경우 -->
							<%= at.getOriginName() %> <br>
							<input type='hidden' name='originFile' value='<%=at.getChangeName()%>'>
							<input type='hidden' name='originFileNo' value='<%=at.getFileNo()%>'>
						<% }%>
						
                  <input type="file" id ="fileItem" name="upFile" style="height: 50px;">
                </div>
            <div class="store_title">
                <h4 for="name">상품명</h4>
              
                <input type="text" class="form-control" name="title" placeholder="" value="<%=s.getProductName() %>" required="">
              </div>
              <br>
              <div class="store_price">
                <h4 for="name">가격</h4>
                <input type="text" class="form-control" name="price" placeholder="" value="<%=s.getPrice() %>" required="">
              </div>
              <br>
              <div class="store_amount">
                <h4 for="name">재고</h4>
                <input type="text" class="form-control" name="stock" placeholder="" value="<%=s.getStock() %>" required="">
              </div>
              
         		<br>
            <div id="all_butt">
                <button type="submit" id="b_butt">등록</button>
                <button type="reset" id="o_butt">취소하기</button>
				
            </div>
            
            </form>
            </div>
        </div>
        	   
       <script type="text/javascript">
     $(function(){
 		$('#o_butt').click(function(){
 			if(confirm("수정을 취소 하시겠습니까?")){
 				location.href="<%=request.getContextPath()%>/storeList.do"
 			}
 		});
 		
 	});
        </script>

    
         <%@ include file = "../common/footer.jsp" %>
       
                
    </body>
</html>