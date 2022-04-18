<%@ page language="java" contentType="text/html; charset=UTF-8"
     import = "com.uni.store.model.dto.*,com.uni.common.Attachment" pageEncoding="UTF-8" %>
    
<% 
    Store s = (Store)request.getAttribute("s"); 
	
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
                width:800px;
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
         #amount{
          margin-left: 150px;
         }
         #adminb1{
         margin-left:200px;
         
         background-color: rgb(155, 89, 182);
         color: white;
         
         }
         #adminb2{
       
  
         background-color: rgb(155, 89, 182);;
           color: white;
         }
        </style>
    
    </head>
    <body>

         <%@ include file="../common/menubar.jsp" %> 

         <hr>
        <div class="outer">
                <div id="content"> 
					<img src="<%=contextPath %>/resources/images/store/<%=s.getStroeImg()%>" id="thumbnail">
                </div>
                
                	<div id="store_data"> <!--스토어 정보-->
                    <h4 id="store_name" style="font-weight: bolder;"><%= s.getProductName() %></h4><br>
                    <input type="number" id= "amount" name="amount" min="1" max="50" value="1" style="width: 40px;">
                    <input type="button" name="updateAmount" value="수정" style="width: 50px;">    
                    <h4 id="store_price" style="font-weight: bolder;"><%=s.getPrice()%>원</h4><br>
                   </div>
                 
            			<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %><!--관리자면 보이는 버튼-->
						<div id="adminb">
						<a id= "adminb1" href="updateStoreForm.do?sid=<%=s.getProductNo()%>">수정하기</a> &nbsp;&nbsp;
						<a  id= "adminb2" href="deleteStore.do?sid=<%=s.getProductNo()%>">삭제하기</a>
						</div>
						<%}else{%>
						<%if(loginUser != null){%><!-- 회원만 보이는 버튼 -->
						<div id="all_butt">
		                <button id="b_butt">장바구니에 넣기</button>
		                <br><br>
		                <button id="o_butt">바로 구매하기</button>
		           		 </div>
						<%}%>
						
						<%}%>
            		
              </div>
              
                <script>
             
               $("#b_butt").click(function(){//클릭시 장바구리로 값을 보내줌
                  var pro = [];
                  var amount = [];
              
                  $("#store_name").each(function(){
                	  var amount= $(this).next().next().val();
                	  pro.push($(this).attr('value'));
                      console.log("pro : "+pro);
   	               	console.log("수량 : "+amount);
                  });
                  
            
               $.ajax({
                  url:"basketInsert.do",
                  type:"get",
                  data:{
                	 amount:amount,
                     pro: pro
                  },
                  success:function(status){
                     if(status=="success"){ // 장바구니 담기 성공하면
                        var result = confirm("상품이 성공적으로 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?"); //확인 창 띄우기
                        if(result){ //확인버튼 누르면 장바구니로 이동
                           location.href ="<%=contextPath %>/basket.do";
                        }
                     }else{
                        alert("장바구니 등록에 실패했습니다.")
                     }
                  },
                  error:function(){
                     console.log("ajax 통신실패 -장바구니 전송");
                  }
               });
            });
             
         
              </script>
        <form action="" id="postForm" method="post">
			<input type="hidden" name="sid" value="<%= s.getProductNo() %>">
		</form>
		
    <%@ include file = "../common/footer.jsp" %>
                
    </body>
</html>