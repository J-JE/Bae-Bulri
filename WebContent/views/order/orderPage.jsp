<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기 : 배불리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
	.container{
		margin: 20px;
	}
	
    .con-top{
        color: rgb(155, 89, 182);
    }

    #zenOrder{
        color: rgb(155, 89, 182);
        font-weight: bold;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="container">
        <div class="con-top">
        <!-- 이 부분 a 태그로 링크 연결해야할지...? 결제하기 때문에 애매함 -->
            <span>장바구니</span> >
            <span id="zenOrder">주문하기</span> >
            <span>결제하기</span>
        </div>

        <div id="accordion">
          <div class="card">
            <div class="card-header">
              <span class="card-link" data-toggle="collapse" href="#collapseOne">
                <table class="table-cart">
                			<tr>
                    <th>상품/옵션 정보</th>
                    <th>수량</th>
                    <th>상품금액</th>
                			</tr>
                 </table>
              </span>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <table class="product-talbe">
                   <tbody>
                          	<form method="get">
                    <tr>
                        <td class="order-pro">
                            <img src="<%=contextPath %>/resources/images/이미지.png" style="width: 50px; height: 50px;">
                            <label for ="ingredient1">상품</label>
                        </td>
                        <td>
                            <label>수량 </label>
                            <input type="number" name="amount" min="0" max="50" value="1" style="width: 50px;"></td>
                        <td>
                            가격
                        </td>
                    </tr>

                    <tr>
                        <td class="order-pro">
                            <img src="<%=contextPath %>/resources/images/이미지.png" style="width: 50px; height: 50px;">
                            <label for ="ingredient1">상품</label>
                        </td>
                        <td>
                            <label>수량 </label>
                            <input type="number" name="amount" min="0" max="50" value="1" style="width: 50px;"></td>
                        <td>
                            가격
                        </td>
                    </tr>
                </form>
                          </tbody>
                </table>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
              배송지 정보
            </span>
            <button type="button" class="btn-addrUpdate" onclick="addressUpdate()">수정</button>
            </div>
            
            <div id="collapseTwo" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <span class="delInfo">
                 <h5>배송지 정보</h5>
                  주문자 이름
                  <br>
                  전화번호
                  <br>
                  <input type="text" id="sample6_postcode" placeholder="우편번호">
				  <input type="text" id="sample6_address" placeholder="주소"><br>
				  <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                </span>
              </div>
            </div>
          </div>
          
          <!-- 주소 수정을 위한 다음 주소 API -->
            <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
            	function addressUpdate(){
            		new daum.Postcode({
            	        oncomplete: function(data) {
            	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            	            
            	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("sample6_extraAddress").value = extraAddr;
                            
                            } else {
                            	// 사용자가 추가 항목을 입력할 수 없게 할 것이기 때문에 기존 예제 코드 수정
                                addr += '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            $(".address_input_1").val(data.zonecode);
           					 $(".address_input_2").val(addr);
           					 
                            // 커서를 상세주소 필드로 이동한다.
           					$(".address_input_3").attr("readonly",false);
           		            $(".address_input_3").focus();
            	 
            	        }
            	    }).open();
            	}
            </script>
			

          <div class="card">
            <div class="card-header">
              <span class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                주문자 정보
              </span>
              <button type="button" class="btn-customerUpdate" onclick="customerUpdate()">수정</button>
            </div>
            <div id="collapseThree" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <div class="orderInfo">
                <table class="customerInfo">
                	<tr>
                	<th>주문자</th> <!-- 정보값 식별용 / 나중에 지울 예정 -->
                	<td> <%= %> </td>
                	</tr>
                	<tr>
                	<th>전화번호</th> <!-- 정보값 식별용 / 나중에 지울 예정 -->
                	<td></td>
                	</tr>
                	<tr>
                	<th>이메일</th> <!-- 정보값 식별용 / 나중에 지울 예정 -->
                	<td></td>
                	</tr>
                </table><br>
          <!--  * 주문자 정보로 결제 관련 정보가 제공됩니다. <br> 해당하는 메일or전화번호로 정보를 보내야하는데 구현 가능할지.. 불가능할 경우 이멘트는 삭제 예정-->
                * 정확한 정보로 등록되어있는지 확인해주세요.
                </div>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                결제하기
              </span>
            </div>
            <div id="collapseFour" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <table class="point-table">
                    <tbody>
                        <tr>
                            <th>포인트 사용</th>
                            <td> 원
                            <a class="point-input-btn usebtn" data-state="N">모두 사용</a>
                            <a class="point-input-btn donotbtn" data-state="Y" style="display: none;">취소</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="priceInfo">
                    <ul>
                        <li>
                            <span class="price-label">주문금액</span>
                            <span class="price-label-span"></span>원
                        </li>
                        <li>
                            <span class="del-label">배송비</span>
                            <span class="del-label-span">3000</span>원
                        </li>
                        <li>
                            <span class="point-label">포인트 사용</span>
                            <span class="point-lable-span">0</span>원
                        </li>
                        <li class="totalPrice">
                            <strong>결제금액</strong>
                            <strong>
                                <span class="total-price-label">30000</span>원
                            </strong>
                        </li>
                    </ul>
                </div>
                <div class="paymentArea">
                    <!-- 결제하기 버튼 -->
                    <button onclick="payment()">결제하기</button>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>

	<script>
		function payment(){
			var IMP = window.IMP;
			IMP.init('imp18688349'); // 가맹점 식별코드
			
			// 이 부분은 나중에 회원 정보에서 가져오도록 수정할 예정, 현재는 결제API 연동 확인을 위한 임시 데이터입니다.
			IMP.request_pay({
				pg: "inicis",
				pay_method: "card", // 결제수단
			    merchant_uid : 'merchant_'+new Date().getTime(), // 주문번호
			    name : '주문자',
			    amount : 10000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동'
			}, function (rsp){
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					alert(msg);
					location.href = "/views/order/orderComplete.jsp";
				}else{
					var msg = '결제에 실패하였습니다.';
					alert(msg);
					location.href = "" // 결제실패 메세지 후 띄워줄 에러페이지 (아직 안 만듦)
				}
			})
		}
	</script>
</body>
</html>