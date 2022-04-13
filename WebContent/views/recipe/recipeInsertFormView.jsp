<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>레시피 작성</title>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
    .logo{height: 126px; width: 100%;}
    .logo>a>img{height:100% !important;  width: 100%;}

    .input-form {
      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }

    .recipe-menu-link{
        color:black;
        font-weight: bold;
    }

    .btn {
        background-color: #BCE7EB;
    }

    table {
        width: 1000px;
    }
  </style>
</head>

<body>
  <%@ include file="../common/menubar.jsp" %>

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <div class="outer">
                <a class="recipe-menu-link" href="index.jsp">홈</a>
                 > 
                <a class="recipe-menu-link" href="#">레시피</a>
                 > 
                <a class="recipe-menu-link" href="#">작성하기</a>
                <!-- 여기부터 테스트용 주문 페이지 연결 링크 -->
                >
                <a class="recipe-menu-link" href="../order/order.jsp">주문하기</a>
                <!-- 여기까지 삭제하면 됨 -->
        </div>
        <hr>

        <form class="validation-form" action="<%= contextPath %>/insertRecipe.do" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="title">레시피 제목</label>
              <input type="text" class="form-control" id="title" name="title" placeholder="" value="" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="category">레시피 카테고리</label>
              <input type="text" class="form-control" id="category" name="category" placeholder="" value="" required>
            </div>
            </div>

            <div class="mb-3">
                사진 등록<br>
                <div class="form_section_content">
                    <input type="file" id ="fileItem" name="upFile" style="height: 30px;">
                    <div id="uploadResult">
            		</div>
            	</div>
            </div>
            <br>

            <div class="mb-3">
                <label for="tag">태그</label>
                <input type="text" class="form-control" id="tag" name="tag" placeholder="" value="" required>
            </div>

          <div class="mb-3">
            <label for="desc">레시피 설명</label>
            <input type="text" class="form-control" id="desc" name="desc" placeholder="설명 입력" value="" required>
          </div>
          <hr>

          <div class="mb-3">
            <label for="product">재료</label>
            <input type="text" class="form-control" id="product" name="product" placeholder="" value="" required>
          </div>
          <hr>

          <div class="mb-3">
            <label for="time">조리시간</label>
            <input type="text" class="form-control" id="time" name="time" placeholder="" value="" required>
          </div>
          <hr>

          <div class="row">
            <div class="col-md-8 mb-3">
              <label for="content"><h3>조리법 업로드</h3></label>

              <div class="recipe-table">
                  <table align="center">
                    <tr>
                        <th></th>
                        <th style="font-size: 25px;">만드는 방법</th>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea name="content" rows="7"  style="resize:none;"></textarea> </td>
                    </tr>
                  </table>
              </div>
            </div>
            </div>
            <hr>
            
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">작성 완료</button>
          <button class="btn btn-primary btn-lg btn-block" type="reset">작성 취소</button>
        </form>
      </div>
    </div>
  </div>
<%@ include file="../common/footer.jsp" %>

  <script>
  	function 
  
    // form에 대한 이벤트 (BOOTSTRAP 폼 사용)
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      // form에 있는 요소들 새로운 배열로 반환
      Array.prototype.filter.call(forms, (form) => {
    	  // submit 이벤트
        form.addEventListener('submit', function (event) {
        	// 유효성 검사
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>
</html>