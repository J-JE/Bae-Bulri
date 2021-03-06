<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배불리 : 주문완료</title>
 <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
      .order-complete{
        text-align: center;
        margin: 15px;
      }
  </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<br>
	<img src="<%=contextPath %>/resources/images/order/ordericon.jpg" alt="주문완료 아이콘" class="mx-auto d-block" style="width:200px">
    <div class="order-complete">
        <span class="order-msg"><h2><b>주문이 완료되었습니다!</b></h2></span>
        <br>
        <br>
        <span>주문내역은 마이페이지/주문조회에서 확인 가능합니다.</span><br>
        <span>한 끼 편하게, 하지만 배불리!</span>
    </div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>