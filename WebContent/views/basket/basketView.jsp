<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.uni.basket.model.dto.Basket"%>
<%
	ArrayList<Basket> basketList = (ArrayList<Basket>)request.getAttribute("BasketList");
	int sumPrice = 0;
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
        #basket_info{ margin-left:auto; margin-right:auto;}
        #info_table th{background-color: rgba(188, 231, 235, 0.55);}
        .pro_info{ text-align: left !important; padding-left: 10px; }
        #select_price{ width: 80%; height: 50px; margin-left:auto; margin-right:auto; }
        #select_price>div{ float: left; font-weight: bold; margin: 0px 30px 0px 30px; }
        
        #checkedDelete, #orderBtn{ border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px; }

        #checkedDelete{
			color: #84b8bd;
            background-color:#ffffff;;
            border: solid 1px #BCE7EB;;
        	float: left;
      	}
		#orderBtn{
			width: 120px;
			height: 40px;
			font-size:20px;
        	color: white;
            background-color:#9f56bf;
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
        
        <!----장바구니---->
        <div id="basket_info">
        	<!--장바구니 테이블-->
            <table id="info_table" style="width: 100%;">
            	<!--장바구니 테이블 머리-->
                <tr id="talbeTop">
                    <th style=" width:70px; padding:10px;text-align:center;"><input type="checkbox" id="allchecked" style="width: 20px; height: 20px;" checked></th>
                    <th style="padding:10px;">상품/옵션 정보</th>
                    <th style="padding:10px;">수량</th>
                    <th style="padding:10px;">상품금액</th>
                </tr>
                
                <!-- 장바구니 테이블 몸통 -->
                <%
               	for(int i=0; i<basketList.size();i++){ 
                		
                	String proName=basketList.get(i).getProductName(); //상품 명
                	int basketNo=basketList.get(i).getBasketNo(); //장바구니 번호
                	String img = basketList.get(i).getThImg(); //상품 이미지
                	int price = (basketList.get(i).getBasketAmount())*(basketList.get(i).getProPrice()); //상품 가격(수량*가격)
                	int amount = basketList.get(i).getBasketAmount();
                	sumPrice+=price;
                %>
				<tr style="border-top: solid 1px lightgray;">
					<td style="text-align: center;">
						<input type="checkbox" id="<%=proName%>" name="ingredient" value="<%=basketNo%>" checked>
					</td>
					<td class="pro_info">
						<img src="<%=contextPath %>/resources/images/store/<%=img%>" style="width: 50px; height: 50px; margin:2px;">
						<label for ="<%=proName%>"><%=proName%></label>
					</td>
					<td>
						<label>수량 </label>
						<input type="number" name="amount" min="0" max="50" value="<%=amount%>" style="width: 40px;">
						<input type="button" name="updateAmount" value="수정" style="width: 50px;">    
					</td>
					<td class="price">
						<%=price%> 원
					</td>
				</tr>
				<%} %>
            </table>
        </div>
        
        <!-- 수량 수정, 장바구니 가격 스크립트 -->
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
                
                	if($(this).is(":checked")){ //전체 선택
                    	console.log("전체 체크 됨")
                    	var price = 0;
						<%for(int i=0; i<basketList.size();i++){%> //장바구니 개수만큼 반복하면서 가격 합하기
						 	price = price+Number($(this).parent().parent().nextAll().find('.price').eq(<%=i%>).text().replace(/[^0-9]/g,''));
						<%}%>
                    	console.log("전체 가격"+price);
                    	$("#checkedPrice").text(price);
                    	$("#sumPrice").text(price+3000);
                    }else{ //전체 해제되면 가격 = 0
                    	console.log("전체 체크 해제 됨")
                    	$("#checkedPrice").text(0); //선택 상품 가격
                    	$("#sumPrice").text(3000); //총 주문금액
                    }
                });
                
                $("input:checkbox[name=ingredient]").click(function(){ //개별 선택
                	var changePrice = Number($(this).parent().parent().find('td:eq(3)').text().replace(/[^0-9]/g,'')); //체크된 상품의 가격 가져오기
                    console.log(changePrice);
                	
                	var sumPrice = Number($("#checkedPrice").text().replace(/[^0-9]/g,'')); //총 합계
                    
                	if($(this).is(":checked")){//선택 된 상품 가격 더하기
                    	console.log("체크 됨")
                    	$("#checkedPrice").text(sumPrice+changePrice)
                    	
                    	$("#sumPrice").text(sumPrice+changePrice+3000);
                    }else{//선택 된 상품 가격 빼기
                    	console.log("체크 해제 됨")
                    	$("#checkedPrice").text(sumPrice-changePrice)
                    	$("#sumPrice").text(sumPrice-changePrice+3000);
                    }
                	
                	if($("#checkedPrice").text() == 0){
                		console.log("비었음")
                	}
                });
                
                $('input[name=updateAmount]').click(function(){ //선택 상품 수량 수정
                    var amount = $(this).prev().val();
                    console.log("수량"+amount);
                    var basketNo = $(this).parent().parent().find('input').val();
                    console.log(basketNo);
                    $.ajax({
                    	url:"basketUpdate.do",
                    	tyle:"post",
                    	data:{
                    		amount:amount,
                    		basketNo:basketNo
                    	},
                    	success:function(status){
                    		if(stasut="success"){
	                    		alert("수량 수정 성공");
	                    		history.go(0);
                    		}else{
                    			alert("수량 수정 실패");
	                    		history.go(0);
                   			}	
                    	},
                    	error:function(){
                    		console.log("ajax 통신실패 - 장바구니 수정 실패");
                    	}
                    });
                });
            });
        </script>

        <hr> <!--구분선-->
        
        <!-- 장바구니 금액 -->
        <div id="select_price">
            <div><span>선택된 상품 금액</span><br><span id="checkedPrice"><%=sumPrice%></span><span> 원</span></div> <!--선택 상품 금액-->
            <div><img src="<%=contextPath%>/resources/images/basket/plus.png" style="width: 50px; height: 50px;"></div> 
            <div><span>배송비</span><br><span id="deliveryPrice">3000</span><span> 원</span></div> <!--배송비-->
            <div style="font-size: 20px; margin-top:10px;">
            <span>총 주문금액 : </span><span id="sumPrice"><%=sumPrice+3000%></span><span> 원</span> <!--총 주문금액-->
            </div>
        </div>
        
        <hr> <!--구분선-->
        
        <!--선택 상품 삭제 버튼-->
        <button id="checkedDelete">선택 상품 삭제</button><br> 
        <!--선택 상품 삭제 스크립트-->
        <script>
        	$("#checkedDelete").click(function(){
        		var cnt = $("input[name='ingredient']:checked").length;
        		var bskNo = [];
                $("input[name='ingredient']:checked").each(function() {
                	bskNo.push($(this).attr('value'));
	                console.log($(this).attr('value'));
                });
                	bskNo=bskNo.join(',');
	                console.log(bskNo);
        		if(cnt == 0){
                    alert("선택된 상품이 없습니다.");
                }else{
                	$.ajax({
    					url:"basketDelete.do",
    					type:"post",
    					data:{
    						bskNo:bskNo
    					},
    					success:function(status){
    						if(status=="success"){ // 장바구니 담기 성공하면
    							alert("상품 삭제 성공");
    							history.go(0);
    						}else{
    							alert("상품 삭제 싱패");
    						}
    					},
    					error:function(){
    						console.log("ajax 통신실패 -장바구니 삭제");
    					}
    				});
                }
        	});
        </script>
        
        <!--주문 버튼-->
        <button id="orderBtn" onclick="orderBtn();">주문하기</button> 
        <!--주문 버튼 스크립트-->
        <script>
    	function orderBtn(){
    		var count = $("input[name='ingredient']:checked").length;
    		var bNos = [];
    		$("input[name='ingredient']:checked").each(function() {
    			bNos.push($(this).attr('value'));
                console.log("장바구니 한개씩 bNos: "+$(this).attr('value'));
            });
    		bNos=bNos.join(',');
            console.log("장바구니 전체 bNos: "+bNos);
            
            var tPrice=Number($("#sumPrice").text());
            console.log("총 가격 tPrice: "+tPrice);
            $.ajax({
				url:"orderInsert.do",
				type:"post",
				data:{
					bNos: bNos,
					tPrice: tPrice
				},
				success:function(status){
					if(status=="success"){ // 장바구니 담기 성공하면
						alert("주문페이지로 이동합니다.")
					}else{
						alert("주문에 실패했습니다.")
					}
				},
				error:function(){
					console.log("ajax 통신실패 -장바구니 전송");
				}
			});
    	}
        </script>
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>