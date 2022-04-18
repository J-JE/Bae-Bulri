<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.recipe.model.dto.Recipe, com.uni.store.model.dto.Store, java.util.ArrayList, com.uni.common.Attachment"%>
<%
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	/*ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");*/
	
	/*Attachment titleImg = fileList.get(0);*/
	String titleImg = recipe.getThImg();
	
	String[] pro = recipe.getRecipePro().split(",");
	String[] cont = recipe.getRecipeContent().split("!");
	
	ArrayList<Store> sList = (ArrayList<Store>)request.getAttribute("storeList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .outer{ width:80%; margin-left:auto; margin-right:auto; }
        
        /*수정, 삭제 버튼*/
        .topBtn{width:350px; height:40px; float:right; margin-top: 10px;}
        .topBtn button{width:150px; height:40px; float:right; margin-right: 15px; color: rgb(142, 68, 173); background-color: white; border: solid 1px rgb(142, 68, 173) !important;}

        /*레시피 정보*/
        .recipe_content{width:100%; height: 400px;}
        #left_content{width: 400px; float: left; position: relative;}
        #right_content{margin-left: 450px; height: 400px;}

        #thumbnail{width: 400px; height: 350px; margin-right: 20px; float: left;}
        .outer button{border: solid 2px rgba(255, 255, 255, 0); border-radius: 5px;}
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
        }
        #thumbsup{width: 20px; margin-bottom: 3px; margin-right: 5px;}

        /*만드는 방법*/
        #recipe_explain{height: auto;}
        #recipe_explain>img{width: 400px; height: 250px; float: left;}
        #recipe_explain>div{width: 300px; height: 250px; margin: 0px 0px 60px 50px; display: inline-block;}
        
        #basketbtn{background-color:#9372A1; color:white;}
        #list{position: absolute; margin-left:37%; width:100px;}
    </style>

</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <!-- 경로 -->
        <br> 
        <span id="moveIndex">홈</span> > <span id="moveList">#<%=recipe.getrCategoryName()%></span> > <span><%= recipe.getRecipeTitle()%></span>
        
        <script>
        	$(function(){
        		<!--홈으로-->
	        	$("#moveIndex").click(function(){
	        		location.href="<%=contextPath%>";
	        	});
	        	
        		<!--이전 화면으로 -> 태그로 이동할 수 있게 수정해야 함-->
	        	$("#moveList").click(function(){
	        		var rcName = $(this).text();
	        		var rcNo =0;
	        		switch (rcName) {
	                case "#계절":  console.log(1); rcNo=1; break;
	                case "#다이어트":  console.log(2); rcNo=2; break;
	                case "#자취생":  console.log(3); rcNo=3; break;
	                case "#안주/간식":  console.log(4); rcNo=4; break;
	                default:
	            }
	        		location.href="<%=contextPath %>/recipeList.do?rcn="+rcNo;
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
        
        	<!--수정, 삭제 버튼-->
        	<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> <!-- 관리자 아이디-->
        	<div class="topBtn">
                <button id="delBtn" onclick="location.href='<%=contextPath%>/deleteRecipe.do?rId=<%=recipe.getRecipeNo()%>'">레시피 삭제</button>
				<button id="updBtn" onclick="location.href='<%=contextPath%>/updateFormRecipe.do?rId=<%=recipe.getRecipeNo()%>'">레시피 수정</button>
        	</div>
			<% } %>
        	
        	<!--레시피 이름-->
            <h1 style="width:500px; display:block; margin-right: 0px;"><b><%= recipe.getRecipeTitle()%></b></h1><br> 
    		
    		<!--썸네일, 좋아요-->
    		<div id="recipe_content">
	            <div id="left_content"> 
	                <img src="<%=contextPath %>/resources/images/recipeFiles/<%= titleImg%>" id="thumbnail">
	                <button id="likey_btn" disabled><img src="<%=contextPath %>/resources/images/recipe/like_1.png" id="thumbsup">찜하기</button>
	            </div>
	    		
	    		<!--레시피 정보-->
	            <div id="right_content"> 
	                <h5 id="recipe_tag" style="font-weight: bolder;"><%= recipe.getRecipeTag()%></h5><br>
	                <p id="recipe_des"><%=recipe.getRecipeDes()%></p>
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
			<div class="row row-cols-1 row-cols-md-6 g-4">
				<% for(int i=0; i<sList.size(); i++){ %>
				<div class="col">
					<div class="card">
						<img src="<%=contextPath %>/resources/images/store/<%=sList.get(i).getStroeImg()%>" class="card-img-top"  id="<%=sList.get(i).getProductNo()%>"style="height: 125px;">
						<div class="card-body">
							<input type="checkbox" name="ingredient" value="<%=sList.get(i).getProductName()%>" checked>
							<p class="card-title">[<%=sList.get(i).getProductName()%>]<br><%=sList.get(i).getPrice()%> 원</p>
							<p class="card-text"><input type="number" name="amount" min="1" max="50" value="1" style="width: 40px;"></p>
						</div>
					</div>
				</div>
				<% } %>
            </div>
            <hr> <!--구분선-->
			<button type="button" id="basketbtn" style="float: right;" disabled>장바구니에 담기</button>
        </div>

		<!----재료 스크립트---->
        <script>
        $(function(){
        	<!----재료 선택---->
        	$("#allchecked").click(function(){ //전체 선택
			    if($("input:checkbox[id='allchecked']").is(":checked")){ //체크되면
			        //모든 체크박스 체크하기
			        $("input:checkbox[name='ingredient']").prop("checked", true);
			    }else{ //체크 해제되면
			        //모든 체크박스 해제 하기
			        $("input:checkbox[name='ingredient']").prop("checked", false);
			    }
			});
        	
        	<!----재료 장바구니 추가---->
			$("#basketbtn").click(function(){
				
				var cnt = $("input[name='ingredient']:checked").length;
				//var proName = [];
				
				var amount = [];
				var pro = [];
				
				$("input[name='ingredient']:checked").each(function() {
					//proName.push("'"+$(this).attr('value')+"'");
	                //console.log('"'+$(this).attr('value')+'"');
					
	                var amounts = $(this).next().next().children().val();
	                pro.push($(this).attr('value'));
	                amount.push(amounts);
	                console.log("pro : "+pro);
	                console.log("수량 : "+amount);
                });
				//proName=proName.join(',');
				//console.log(proName);
				console.log("테스트 최종 : "+pro);
				console.log("수량 최종 : "+amount);
				
				$.ajax({
					url:"basketInsert.do",
					type:"get",
					data:{
						//pro: proName,
						amount:amount,
						pro:pro
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
			
			<!-- 이미지 클릭하면 재료 상세 페이지로 이동-->
			$(".card-img-top").click(function(){
				var sid = $(this).attr('id');
				location.href="<%=contextPath%>/detailStore.do?sid=" + sid;
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