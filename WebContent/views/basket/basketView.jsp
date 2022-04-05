<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            width:80%;
            margin-left:auto;
            margin-right:auto;
        }
        #cartImg{width: 50px; height: 50px; float: left; margin-right: 10px;}
        #Payment_Steps{
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
            line-height: 25px;
        }
        #basket_info{
            margin-left:auto;
            margin-right:auto;
        }

        #info_table th{
            background-color: rgba(188, 231, 235, 0.55);
        }
        #info_table td,th{
            /* border: 1px solid black; */
            text-align: center; 
        }
        .pro_info{
            text-align: left !important;
            padding-left: 10px;
        }
        #select_price{
            width: 80%;
            height: 50px;
            margin-left:auto;
            margin-right:auto;
        }
        #select_price>div{
            float: left;
            font-weight: bold;
            margin: 0px 30px 0px 30px ;
        }
        button{
            color: white;
            background-color:#9372A1;
            border: solid 2px rgba(255, 255, 255, 0);
            border-radius: 5px;
            float: right;
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
                    <td><img id="cartImg" src="<%=contextPath %>/resources/images/shopping-cart.png"></td>
                    <td>장바구니</td>
                    <td><img src="<%=contextPath %>/resources/images/next.png" style="width: 50px; height: 50px;"></td>
                    <td>주문하기</td>
                    <td><img src="<%=contextPath %>/resources/images/next2.png" style="width: 50px; height: 50px;"></td>
                    <td>결제하기</td>
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
                <form method="get">
                    <tr>
                        <td>
                            <input type="checkbox" id="ingredient1" name="ingredient" value="재료1" checked>
                        </td>
                        <td class="pro_info">
                            <img src="<%=contextPath %>/resources/images/이미지.png" style="width: 50px; height: 50px;">
                            <label for ="ingredient1">재료1</label>
                        </td>
                        <td>
                            <label>수량 </label>
                            <input type="number" name="amount" min="0" max="50" value="1" style="width: 50px;"></td>
                        <td>
                            2,380 원
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <input type="checkbox" id="ingredient1" name="ingredient" value="재료1" checked>
                        </td>
                        <td class="pro_info">
                            <img src="<%=contextPath %>/resources/images/이미지.png" style="width: 50px; height: 50px;">
                            <label for ="ingredient1">재료1</label>
                        </td>
                        <td>
                            <label>수량 </label>
                            <input type="number" name="amount" min="0" max="50" value="1" style="width: 50px;"></td>
                        <td>
                            2,380 원
                        </td>
                    </tr>

                </form>
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
            });
        </script>

        <hr> <!--구분선-->
        <div id="select_price">
            <div>선택된 상품 금액<br>10,480 원</div>
            <div><img src="<%=contextPath %>/resources/images/plus.png" style="width: 50px; height: 50px;"></div>
            <div>배송비<br>3,000 원</div>
            <div>총 주문금액 13,480 원</div>
        </div>
        <hr> <!--구분선-->
        <button>선택 상품 삭제</button><br>
        <button>주문하기</button>
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>