<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.recipe.model.dto.Recipe, java.util.ArrayList, com.uni.common.Attachment"%>
<%
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	
	Attachment titleImg = fileList.get(0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .outer{
            width:80%;
            margin-left:auto;
            margin-right:auto;
        }
        #left_content{
            width: 400px; height: 400px;
            float: left;
            position: relative;
        }
        #thumbnail{
            width: 400px; height: 350px; margin-right: 20px; float: left;
        }
        button{border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px;}
        #likey_btn{
            width: 100px; height: 40px;
            position: absolute;
            left:0; right:0;
            margin-left:auto; margin-right:auto;
            margin-top: 360px;
            background-color: rgba(225, 199, 235, 0.4);
            color: rgb(147, 114, 161);
            font-weight: bold;
            border: solid 2px rgba(255, 255, 255, 0);
			border-radius: 5px;
        }
        #thumbsup{width: 20px; margin-bottom: 3px; margin-right: 5px;}
        #recipe_info{margin-left: 450px; height: 400px;}

        /*만드는 방법*/
        #recipe_explain{height: auto;}
        #recipe_explain>img{width: 400px; height: 250px; float: left;}
        #recipe_explain>div{width: 300px; height: 250px; margin: 0px 0px 60px 50px; display: inline-block;}
        
        #basketbtn{background-color:#9372A1; color:white; border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px;}
    </style>

</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <br> <!-- 경로 -->
        <span id="moveIndex">홈</span> > <span id="moveList">전체</span> > <span>김치볶음밥</span>
        <script>
        	$("#moveIndex").click(function(){
        		location.href="<%=contextPath%>";
        	});
        	$("#moveList").click(function(){
        		location.href="javascript:history.back()";
        	});
        </script>
        <hr><br>

        <div class="recipe"> <!----레시피---->
    
            <h2><b>김치 볶음밥</b></h2><br> <!--레시피 이름-->
    
    		<!--썸네일, 좋아요-->
            <div id="left_content"> 
                <img src="<%=contextPath %>/resources/images/<%= titleImg.getChangeName() %>" id="thumbnail">
                <% if(loginUser != null){ %>
                <button id="likey_btn"><img src="<%=contextPath %>/resources/images/recipe/like_2.png" id="thumbsup">찜하기</button>
            	<% }else{ %>
                <button id="likey_btn" disabled><img src="<%=contextPath %>/resources/images/recipe/like_2.png" id="thumbsup">찜하기</button>
            	<% } %>
            </div>
            <script>
				$(function(){
					$("#likey_btn").click(function(){
						var rId = <%=recipe.getRecipeNo() %>
						location.href="<%=contextPath%>/likeyInsert.do?rId=" + rId;
					});
				});
				
				$(function(){
					$("#likey_btn").click(function(){
						var rId = <%=recipe.getRecipeNo()%>;
						
						$.ajax({
							url:"likeyInsert.do",
							type:"post",
							data:{
									rId:rId
							},
							success:function(status){
							},
							error:function(){
								console.log("ajax 통신실패 -댓글등록")
							}
							
						})
						
					})
					
				})
        </script>
    
            <div id="recipe_info"> <!--레시피 정보-->
                <h5 id="recipe_tag" style="font-weight: bolder;"><%= recipe.getRecipeTag()%></h5><br>
                <p id="recipe_content"><%=recipe.getRecipeContent()%></p>
                <hr><!--구분선-->
                <h5><b>재료</b></h5>
                <li><b>필수 재료</b></li>
                <p style="margin-left: 23px;"><%=recipe.getRecipePro()%></p>
                
                <li><b>선택 재료</b></li>
                <p style="margin-left: 23px;"><%=recipe.getRecipePro()%></p>
                <hr><!--구분선-->
                <div>
                    <h5><b>조리 시간</b></h5>
                    <img src="<%=contextPath %>/resources/images/recipe/stopwatch.png" style="width: 50px; float: left; margin: 4px 4px 0px 0px;">
                    <p style="font-size: 30px; margin: 17px 0px 0px 0px;"><b>10분</b></p>
                </div>
            </div>

            <hr><!--구분선-->

            <div id="recipe_explain"> <!--조리법-->
                <h4><b>만드는 방법</b></h4>
                <br>
                <% for(int i=1; i<fileList.size(); i++){ %>
	                <img src="<%=contextPath %>/resources/images/<%=fileList.get(i).getChangeName()%>">
	                <div><h5>Step <%=i %></h5>어쩌구저쩌구</div>
	                <br>
                <% } %>
            </div>
        </div>

        <hr style="margin-top: 0;"> <!--구분선-->

        <div id="ingredients" action="" method="post"> <!----재료---->
            <input type="checkbox" id="allchecked" checked> <!--전체 선택-->
            <label for="allchecked">전체 선택</label><br><hr style="margin: 0px 0px 10px 0px;">

            <form method="get"> <!--선택 상품 장바구니에 담기-->
                <input type="checkbox" id="ingredient1" name="ingredient" value="재료1" checked>
                <label for ="ingredient1">재료1</label> |

                <input type="checkbox" id="ingredient2" name="ingredient" value="재료2" checked>
                <label for ="ingredient2">재료2</label> |
                
                <input type="checkbox" id="ingredient3" name="ingredient" value="재료3" checked>
                <label for ="ingredient3">재료3</label>
                <hr style="margin: 0;"><!--구분선-->
                <br>
                <button type="submit" id="basketbtn" style="float: right;">장바구니에 담기</button>
            </form>
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

        <br>
        <button>목록</button>
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>