<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         
        </style>
    
    </head>
    <body>

	    <%@ include file="../common/menubar.jsp" %> 
         <hr>
   
        <div id="outer">
         
            <div id="top">
              <div class="main">
                  <a class="main1" href="StoreList.do">배불리몰</a>
                   &gt; 
                  <a class="main1" href="#">재료추가</a>
                  
          </div>
            <hr>
            <form class="insertForm" action="<%= contextPath %>/insertStore.do" method="post" enctype="multipart/form-data">
            	  <div id="store_all">
            	  
            	  <div id="content"> 
         		<h4 for="name">제품사진</h4>
                  <input type="file" id ="fileItem" name="upFile" style="height: 50px;">
                </div>
            <div class="store_title">
                <h4 for="name">상품명</h4>
              
                <input type="text" class="form-control" name="title" placeholder="상품명을 입력해주세요" value="" required="">
              </div>
              <br>
              <div class="store_price">
                <h4 for="name">가격</h4>
                <input type="text" class="form-control" name="price" placeholder="가격을 입력해주세요" value="" required="">
              </div>
              <br>
              <div class="store_amount">
                <h4 for="name">재고</h4>
                <input type="text" class="form-control" name="stock" placeholder="재고을 입력해주세요" value="" required="">
              </div>
              
         		<br>
            <div id="all_butt">
                <button type="submit" id="b_butt">등록</button>
                <button type="reset" id="o_butt">취소</button>
            </div>
            
            </form>
        </div>
        </div>
      <script type="text/javascript">
     $(function(){
 		$('#o_butt').click(function(){
 			if(confirm("등록을 취소 하시겠습니까?")){
 				location.href="<%=request.getContextPath()%>/storeList.do";}
 				
 		});
 		
 	});
        </script>
    	  <%@ include file = "../common/footer.jsp" %>
          
            
    </body>
</html>