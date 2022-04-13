<%@ page language="java" contentType="text/html; charset=UTF-8"
     import = "java.util.ArrayList, com.uni.store.model.dto.*,com.uni.common.Attachment" pageEncoding="UTF-8" %>
    
<% 
    Store s = (Store)request.getAttribute("s"); 
	ArrayList<Store> fileList = (ArrayList<Store>)request.getAttribute("fileList");

	Attachment StroeImg  = fileList.get(0);
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
                width:80%;
                margin: 0 auto;
                margin-left: 500px;
                position: relative;
                width: 1500px;
                height:  800px;
            }
            #content{
                width: 500px; height: 500px;
                float: left;
                margin-left:50px;
                position: relative;
                
            }
            #image{
                width: 500px; height: 500px; margin-right: 20px; float: left;
            }
            #all_butt{
                margin-left: 600px;
            }
            #store_name{
             margin-left: 600px;
            }
            #store_price{
                margin-top: 30px;
                margin-left: 600px;
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
            
         
        </style>
    
    </head>
    <body>

         <%@ include file="../common/menubar.jsp" %> 

         <hr>
        <div class="outer">
                <div id="content"> 
                    <img src="/j.jpg" width="500px" height="500px">

                </div>
                
                <div id="store_data"> <!--스토어 정보-->
                    <h4 id="store_name" style="font-weight: bolder;"><%= s.getProductName() %></h4><br>
                    <h4 id="store_price" style="font-weight: bolder;"><%=s.getPrice()%>원</h4><br>
                    <h4 id="store_amount"><input type="number" min="1" max="100" value="1"/></h4>
                </div>
                <div id="all_butt">
                <button id="b_butt">장바구니에 넣기</button>
                <br><br>
                <button id="o_butt">바로 구매하기</button>
            </div>
       
        </div>
    <%@ include file = "../common/footer.jsp" %>
                
    </body>
</html>