<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="../resources/BB.ico">
    <style>
        #header{position: relative; width:90%; margin: auto;}
        /* 상단 로고 */
        .logo{position: relative; width:300px; left:0; right:0; margin-left:auto; margin-right:auto; }
        .logo>img{height:50%; width: 100%;}
        /* 로그인 */
        .login{position: absolute; bottom: 15px; right: 0px; width: 150px; height: 50px; background-color: gray;}

        /* 네비 바 */
        .navbar{width:90%; left:0; right:0; margin-left:auto; margin-right:auto; background-color: #BCE7EB;}
        .navbar-nav{left:0; right:0; margin-left:auto; margin-right:auto;}
        .navbar-nav>li{margin-left: 50px; margin-right: 50px;}
        .nav-item>a{text-align: center; color: white; font-size: 18px; font-weight:bold; text-shadow: 1px 1px 1px #bad2d4;}
        .nav-item>a:hover{color: white; text-shadow: none;}
        .container-fluid{width:90%; margin: auto;}
         /*서브메뉴*/
        .dropdown-menu{margin-left: -20px; background-color: rgb(188, 231, 235); border: none; width:60%; margin-top: 0%;}
        .dropdown-menu>li{width:100%; margin-left: auto;}
        .dropdown-item{color: white; font-size: 17px; text-shadow: 1px 1px 1px #bad2d4;}
        .dropdown-item:hover{background-color:rgba(255, 255, 255, 0.61); color: rgb(155, 89, 182);}
    </style>
</head>
<body>
    <div id="header">
        <div class="logo">
            <img src="resources/images/Bae Bulri.png">
        </div>
        <div class="login">
            <!-- 로그인 전 -->
            <button id="login">로그인</button>
            <button id="login">회원가입</button>

            
            <!-- 로그인 후 -->
            <!-- <button id="login">마이페이지</button> -->
            <!-- <button id="login">장바구니</button> -->

        </div>
    </div>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        #레시피
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#"># 계절</a></li>
                        <li><a class="dropdown-item" href="#"># 다이어트</a></li>
                        <li><a class="dropdown-item" href="#"># 자취생</a></li>
                        <li><a class="dropdown-item" href="#"># 안주/간식</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">배불리 몰</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">쿡&토크</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">설문조사</a>
                </li>
            </ul>
            </div>
        </div>
      </nav>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>