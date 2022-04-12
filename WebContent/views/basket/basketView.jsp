<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.uni.basket.model.dto.Basket"%>
<%
	ArrayList<Basket> basketList = (ArrayList<Basket>)request.getAttribute("BasketList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{ width:80%; margin-left:auto; margin-right:auto; }
        #cartImg{width: 50px; height: 50px; float: left; margin-right: 10px;}
        #Payment_Steps{ font-size: 24px; font-weight: bold; margin-top: 10px; line-height: 25px; }
        #basket_info{ margin-left:auto; margin-right:auto; }

        #info_table th{ background-color: rgba(188, 231, 235, 0.55); }
        #info_table td,th{ text-align: center !important; }
        .pro_info{ text-align: left !important; padding-left: 10px; }
        #select_price{ width: 80%; height: 50px; margin-left:auto; margin-right:auto; }
        #select_price>div{ float: left; font-weight: bold; margin: 0px 30px 0px 30px; }
        
        #checkedDelete, #orderBtn{ border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px; }

        #checkedDelete{
			color: #84b8bd;
            background-color:#ffffff;;
            border: solid 2px #BCE7EB;;
        	float: left;
      	}
		#orderBtn{
			width: 120px;
			height: 40px;
			font-size:20px;
        	color: white;
            background-color:#9372A1;
            margin-top:10px;
            display: block; margin-left: auto; margin-right: auto;
		}
    </style>

</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <div id="Payment_Steps" style="margin-left: 20px;">
            <table>
                <tr>
                    <td><img id="cartImg" src="<%=contextPath %>/resources/images/basket/shopping-cart.png"></td>
                    <td style="color:#460963;">장바구니</td>
                    <td><img src="<%=contextPath %>/resources/images/basket/next.png" style="width: 50px; height: 50px;"></td>
                    <td style="color:#a88bb5;">주문하기</td>
                    <td><img src="<%=contextPath %>/resources/images/basket/next2.png" style="width: 50px; height: 50px;"></td>
                    <td style="color:#a88bb5;">결제하기</td>
                </tr>
            </table>
        </div>
        <br>
        <hr> <!--구분선-->
        <div id="basket_info">
            <table id="info_table" style="width: 100%;">
                <tr>
                    <th><input type="checkbox" id="allchecked" style="width: 20px; height: 20px;" checked></th>
                    <th>상품/옵션 정보</th>
                    <th>수량</th>
                    <th>상품금액</th>
                </tr>
                <div>
	                <%
                	int sumPrice = 0;
                	
                	for(int i=0; i<basketList.size();i++){ 
	                		
	                	String proName=basketList.get(i).getProductName(); //상품 명
	                	int basketNo=basketList.get(i).getBasketNo(); //장바구니 번호
	                	int price = (basketList.get(i).getBasketAmount())*(basketList.get(i).getProPrice()); //상품 가격(수량*가격)
	                %>
	                    <tr>
	                        <td>
	                            <input type="checkbox" id="<%=proName%>" name="ingredient" value="<%=basketNo%>" checked>
	                        </td>
	                        <td class="pro_info">
	                            <img src="<%=contextPath %>/resources/images/이미지.png" style="width: 50px; height: 50px;">
	                            <label for ="<%=proName%>"><%=proName%></label>
	                        </td>
	                        <td>
	                            <label>수량 </label>
	                        	<input type="number" name="amount" min="0" max="50" value="1" style="width: 40px;">
                            	<input type="button" name="updateAmount" value="수정" style="width: 50px;">    
							</td>
	                        <td>
                            	<%=price%> 원
                            	<%sumPrice = sumPrice+price;%>
	                        </td>
	                    </tr>
	                <%} %>
                </div>
            </table>
        </div>
        <script>
            $(function(){
                $("#allchecked").click(function(){ //전체 선택
                    if($("input:checkbox[id='allchecked']").is(":checked")){ //체크되면
                        //모든 체크박스 체크하기
                        $("input:checkbox[name='ingredient']").prop("checked", true);
                    }else{ //체크 해제되면
                        //모든 체크박스 해제 하기
                        $("input:checkbox[name='ingredient']").prop("checked", false);
                    }
                });
                
                $('input[name=updateAmount]').click(function(){
                    var amount = $(this).prev().val();
                    console.log("수량"+amount);
                    var proNo = $(this).parent().parent().find('input').val();
                    console.log(proNo);
                    $.ajax({
                    	url:"basketUpdate.do",
                    	tyle:"post",
                    	data:{
                    		amount:amount,
                    		proNo:proNo
                    	},
                    	success:function(status){
                    		if(stasut="success"){
	                    		alert("수량 수정 성공");
                    		}else{alert("수량 수정 실패");}	
                    	},
                    	error:function(){
                    		console.log("ajax 통신실패 - 장바구니 수정 실패");
                    	}
                    });
                });
            });
        </script>

        <hr> <!--구분선-->
        <div id="select_price">
            <div>선택된 상품 금액<br><%=sumPrice%> 원</div>
            <div><img src="<%=contextPath %>/resources/images/basket/plus.png" style="width: 50px; height: 50px;"></div>
            <div>배송비<br>3,000 원</div>
            <div>총 주문금액 <%=sumPrice+3000%> 원</div>
        </div>
        <hr> <!--구분선-->
        <button id="checkedDelete">선택 상품 삭제</button><br>
        <button id="orderBtn">주문하기</button>
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>