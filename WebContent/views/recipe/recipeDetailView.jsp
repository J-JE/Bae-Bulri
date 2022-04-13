<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.recipe.model.dto.Recipe, java.util.ArrayList, com.uni.common.Attachment"%>
<%
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	/*ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");*/
	
	/*Attachment titleImg = fileList.get(0);*/
	String titleImg = recipe.getThImg();
	
	String[] pro = recipe.getRecipePro().split(",");
	String[] cont = recipe.getRecipeContent().split("!");
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
            background-color: rgba(255, 255, 255, 0.4);
            border: solid 2px rgb(147, 114, 161);
            color: rgb(147, 114, 161);
            font-weight: bold;
			border-radius: 5px;
        }
        #thumbsup{width: 20px; margin-bottom: 3px; margin-right: 5px;}
        #recipe_info{margin-left: 450px; height: 400px;}

        /*만드는 방법*/
        #recipe_explain{height: auto;}
        #recipe_explain>img{width: 400px; height: 250px; float: left;}
        #recipe_explain>div{width: 300px; height: 250px; margin: 0px 0px 60px 50px; display: inline-block;}
        
        #basketbtn{background-color:#9372A1; color:white; border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px;}
        #list{position: absolute;margin-left:38%;border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px;}
    </style>

</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <!-- 경로 -->
        <br> 
        <span id="moveIndex">홈</span> > <span id="moveList">#<%=recipe.getrCategoryName()%></span> > <span><%= recipe.getRecipeTitle()%></span>
        <button style="margin-left: 1250px; color: purple;" onclick="location.href='<%=contextPath%>/updateFormRecipe.do?rId=<%=recipe.getRecipeNo()%>'">레시피 수정</button>
        <script>
        	$(function(){
        		<!--홈으로-->
	        	$("#moveIndex").click(function(){
	        		location.href="<%=contextPath%>";
	        	});
	        	
        		<!--이전 화면으로 -> 태그로 이동할 수 있게 수정해야 함-->
	        	$("#moveList").click(function(){
	        		location.href="javascript:history.back()";
	        	});
	        	
	        	<!--로그인 유저는 (찜하기, 장바구니)버튼 클릭 가능-->
	        	<% if(loginUser != null){ %> 
	        		$("#likey_btn").attr("disabled", false);
	        		$("#basketbtn").attr("disabled", false);
	        		
	        		<!-- 이미 찜 한 레시피에는 찜 이미지 변경-->
					var rId = <%=recipe.getRecipeNo()%>;
					console.log(rId)
					$.ajax({
						url:"likeyClick.do",
						type:"post",
						data:{rId: rId},
						success:function(status){
							if(status =="Already Likey"){
								$("#thumbsup").attr("src", "<%=contextPath %>/resources/images/recipe/like_2.png");
								$("#likey_btn").attr("style", "background-color: rgba(225, 199, 235, 0.4); border: solid 2px rgba(255, 255, 255, 0); color: rgb(147, 114, 161);");
							}
						},
						error:function(){console.log("ajax 통신실패 -찜 조회");}
					});
        		<% }%>
			});
        </script>
        <hr><br>
		
		<!----레시피---->
        <div class="recipe"> 
            <h2><b><%= recipe.getRecipeTitle()%></b></h2><br> <!--레시피 이름-->
             
    
    		<!--썸네일, 좋아요-->
            <div id="left_content"> 
                <img src="<%=contextPath %>/resources/images/recipeFiles/<%= titleImg%>" id="thumbnail">
                <button id="likey_btn" disabled><img src="<%=contextPath %>/resources/images/recipe/like_1.png" id="thumbsup">찜하기</button>
            </div>
            <!--썸네일, 좋아요 스크립트-->
            <script>
				$("#likey_btn").click(function(){
					var rId = <%=recipe.getRecipeNo()%>;
					console.log("버튼 누름, 레시피 번호: "+rId);
					
					<!-- 이미 찜을 한 경우 -->
					if($("#thumbsup").attr("src") == "<%=contextPath %>/resources/images/recipe/like_2.png"){
						console.log("이미 찜");
						$.ajax({
							url:"likeyDelete.do",
							type:"post",
							data:{
									rId: rId
							},
							success:function(status){
								console.log(status);
								if(status =="success"){
									console.log("찜 삭제 성공");
									$("#thumbsup").attr("src", "<%=contextPath %>/resources/images/recipe/like_1.png");
									$("#likey_btn").attr("style", "background-color: rgba(255, 255, 255, 0.4); border: solid 2px rgb(147, 114, 161); color: rgb(147, 114, 161);");
								}
							},
							error:function(){
								console.log("ajax 통신실패 -찜 삭제");
							}
						});
					}else{ <!-- 아직 찜을 하지 않은 경우--->
						console.log("이미 찜");
						$.ajax({
							url:"likeyInsert.do",
							type:"post",
							data:{
									rId: rId
							},
							success:function(status){
								console.log(status);
								if(status =="success"){
									console.log("찜 성공");
									$("#thumbsup").attr("src", "<%=contextPath %>/resources/images/recipe/like_2.png");
									$("#likey_btn").attr("style", "background-color: rgba(225, 199, 235, 0.4); border: solid 2px rgba(255, 255, 255, 0); color: rgb(147, 114, 161);");
								}
							},
							error:function(){
								console.log("ajax 통신실패 -찜 실패");
							}
						});
					}
				})
        	</script>
    		
    		<!--레시피 정보-->
            <div id="recipe_info"> 
                <h5 id="recipe_tag" style="font-weight: bolder;"><%= recipe.getRecipeTag()%></h5><br>
                <p id="recipe_content"><%=recipe.getRecipeDes()%></p>
                <hr><!--구분선-->
                <h5><b>재료</b></h5>
                <%for(int i=0; i < pro.length; i++) {%>
                <li><b><%=pro[i]%></b></li>
                <%} %>
                <hr><!--구분선-->
                <div>
                    <h5><b>조리 시간</b></h5>
                    <img src="<%=contextPath %>/resources/images/recipe/stopwatch.png" style="width: 50px; float: left; margin: 4px 4px 0px 0px;">
                    <p style="font-size: 30px; margin: 17px 0px 0px 0px;"><b><%=recipe.getRecipeTime()%></b></p>
                </div>
            </div>

            <hr><!--구분선-->

			<!--조리법-->
            <div id="recipe_explain"> 
                <h4><b>만드는 방법</b></h4>
                <br>
                <%-- for(int i=1; i<fileList.size(); i++){ --%>
                <% for(int i=0; i<cont.length; i++){ %>
	                <!-- img src="<%--=contextPath --%>/resources/images/recipeFiles/<%--=fileList.get(i).getChangeName()--%>" -->
	                <div><h5>Step <%=i +1%></h5><%=cont[i]%></div>
	                <br>
                <% } %>
            </div>
        </div>

        <hr style="margin-top: 0;"> <!--구분선-->

		<!----재료---->
        <div id="ingredients"> 
        	<!--전체 선택-->
            <input type="checkbox" id="allchecked" checked> 
            <label for="allchecked">전체 선택</label><br><hr style="margin: 0px 0px 10px 0px;">
			
			<!-- method="get"선택 상품 장바구니에 담기(시간 남으면 재료 이미지 불러오기)-->
            <div> 
	            <% for(int i=0; i<pro.length; i++){ %>
                <input type="checkbox" id="ingredient<%=i%>" name="ingredient" value="<%=pro[i]%>" checked>
                <label for ="ingredient<%=i%>"><%=pro[i]%></label> |
	            <% } %>
                <hr style="margin: 0;"> <!--구분선-->
                <br>
                <button type="button" id="basketbtn" style="float: right;" disabled>장바구니에 담기</button>
            </div>
        </div>

		<!----재료 스크립트---->
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

			$("#basketbtn").click(function(){
				
				var cnt = $("input[name='ingredient']:checked").length;
				var proName = [];
				$("input[name='ingredient']:checked").each(function() {
					proName.push("'"+$(this).attr('value')+"'");
	                console.log("'"+$(this).attr('value')+"'");
                });
				proName=proName.join(',');
				console.log(proName);
				
				$.ajax({
					url:"basketInsert.do",
					type:"get",
					data:{
						pro: proName
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
			
        });
        </script>
        
        <br><br>
        
        <!--목록 버튼-->
        <button id="list" onclick="listBtn();">목록</button>
        <script>
		function listBtn(){
			window.history.back(); //수정해야 함
		}
        </script>
     
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>