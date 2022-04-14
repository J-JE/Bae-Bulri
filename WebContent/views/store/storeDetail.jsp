<%@ page language="java" contentType="text/html; charset=UTF-8"
     import = "com.uni.store.model.dto.*,com.uni.common.Attachment" pageEncoding="UTF-8" %>
    
<% 
    Store s = (Store)request.getAttribute("s"); 
	String titleImg = s.getStroeImg();
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
            .outer{
                width:800;
                height: 500px;
                margin: 0 auto;
                margin-left: 500px;
                position: relative;
            
            }
            #content{
                width: 400px; height: 400px;
                float: left;
                
                position: relative;
                
            }
            #image{
                width: 500px; height: 500px; margin-right: 20px; float: left;
            }
            #all_butt{
                margin-left: 600px;
            }
            #store_name{
             margin-left: 550px;
            }
            #store_price{
                margin-top: 30px;
                margin-left: 550px;
            }
            #store_amount{
                margin-left: 600px;
            }
            #all_butt{
                margin-top: 100px;
            }
            #o_butt{
                background-color: rgb(155, 89, 182);;
                color: white;
            }
            #b_butt{ background-color: rgb(155, 89, 182);;
                color: white;}
            #thumbnail{
             margin-left: 10px;
             width: 400px; 
             height:400px;
            }
         
        </style>
    
    </head>
    <body>

         <%@ include file="../common/menubar.jsp" %> 

         <hr>
        <div class="outer">
                <div id="content"> 
					<img src="<%=contextPath %>/resources/images/store/<%= titleImg%>" id="thumbnail">
                </div>
                
                <div id="store_data"> <!--스토어 정보-->
                    <h4 id="store_name" style="font-weight: bolder;"><%= s.getProductName() %></h4><br>
                    <h4 id="store_price" style="font-weight: bolder;"><%=s.getPrice()%>원</h4><br>
                   
                </div>
                <div id="all_butt">
                <button id="b_butt">장바구니에 넣기</button>
                <br><br>
                <button id="o_butt">바로 구매하기</button>
            </div>
       
        </div>
        <form action="" id="postForm" method="post">
			<input type="hidden" name="sid" value="<%= s.getProductNo() %>">
		</form>
		
    <%@ include file = "../common/footer.jsp" %>
                
    </body>
</html>