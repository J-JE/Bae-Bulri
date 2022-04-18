<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAE BULRI</title>
<style>
	#mainPage{width:90%; display: flex;
		flex-direction: column;
		justify-content:center;
		margin-left:auto;
		margin-right:auto;	}
	
	
	.baebulri-logo-img{
		margin-top: 10px;
		width:100%;
		height:250px;
		display: flex;
		justify-content:center;
		margin-left:auto;
		margin-right:auto;	
		
	}
	.top-recipe{
		margin-top:50px;
		width:90%;
		margin-left:auto;
		margin-right:auto;
		justify-content:center;
	}
	.baebulri-img{
		width:100%;
		height:250px;
	}
	.mid{
		
		display:flex;
		flex-direction: column;
		justify-content: space-around;
		margin-bottom:30px;
	}
	.soldout-list, .favorite-list, .recipe-list{
		display:flex;
		flex-direction:row;
		justify-content: space-around;
	}
	.bottom{
		
		justify-content: space-around;
		margin-bottom:30px;
	}
	.soldout-thumb, .favorite-thumb, .recipe-thumb{
		width:250px;
		height:280px;
		margin-right:10px;
		margin-left:10px;
	}
	.favorite-recipe-name, .recommend-recipe-name, .soldout-text{
		margin-bottom:10px;
	}
</style>
</head>
<body>
	<%@ include file = "views/common/menubar.jsp" %>
	<div id="mainPage">
		<div class="baebulri-logo-img">
			<img class="baebulri-img" src="./resources/images/recipeFiles/이미지.png"><br>
			
		</div>
		<div class=top-recipe>
			<div class=mid>
				<div class=" favorite-recipe">
					<div class="favorite-recipe-name">
					인기 레시피<br>
					최고인기상품<br>
					</div>
					<div class="favorite-list">
						
					</div>	
				</div>
				<br>
				<hr>
				<div class="recommend-recipe">
					<div class="recommend-recipe-name">
					신상 레시피<br>
					최근 추가된 따끈따끈 레시피<br>
					</div>
						<div class="recipe-list">
					 	
						</div>		
				</div>
			</div>
			<br>	
			<hr>
			<div class="bottom">
				<div class="soldout-text">
					품절임박 상품
				</div>
				<div class="soldout-list">
					
				</div>
			</div>
		</div>	
	</div>
	<script>	
	$(function(){
		selectRTopList();
		$(".favorite-list").on("click",".favorite-thumb",function(){
			var rId = $(this).children().eq(0).val();
			location.href="<%=contextPath%>/recipeDetail.do?rId="+rId;
		})
	})
	function selectRTopList(){
		$.ajax({
			url:"recommend-top.do",
			type:"get",
			success:function(list){
				var value = "";
				for(var i in list){
					value += '<div class="favorite-thumb" align="center">'+
							 '<input type="hidden" value="' +list[i].recipeNo+ '">'+
							 '<img src="<%=contextPath%>/resources/images/recipeFiles/' + list[i].thImg + '" width="250px" height="280px"> <br>'+
							 '<p>'+ list[i].recipeTitle +'</p>'+
							 '</div>';
				}
				$(".favorite-list").html(value);
			},
			error:function(){
				console.log("ajax통신실패");
			}
		})	
	}
	
	$(function(){
		selectrecipeList();
		$(".recipe-list").on("click",".recipe-thumb",function(){
			var rId = $(this).children().eq(0).val();
			location.href="<%=contextPath%>/recipeDetail.do?rId="+rId;
		})
	})
	function selectrecipeList(){
		$.ajax({
			url:"top-recipe.do",
			type:"get",
			success:function(list){
				var value = "";
				for(var r in list){
					value += '<div class="recipe-thumb" align="center">'+
							 '<input type="hidden" value="' +list[r].recipeNo+ '">'+
							 '<img src="<%=contextPath%>/resources/images/recipeFiles/' + list[r].thImg + '" width="250px" height="280px"> <br>'+
							 '<p>'+ list[r].recipeTitle +'</p>'+
							 '</div>';
				}
				$(".recipe-list").html(value);
			},
			error:function(){
				console.log("ajax통신실패");
			}
		})	
	}
	
	$(function(){
		selectSTopList();
		$(".soldout-list").on("click",".soldout-thumb",function(){
			var sid = $(this).children().eq(0).val();
			location.href="<%=contextPath%>/detailStore.do?sid="+sid;
		})
	})
	function selectSTopList(){
		$.ajax({
			url:"soldout-topList.do",
			type:"get",
			success:function(list){
				var value = "";
				for(var s in list){
					value += '<div class="soldout-thumb" align="center">'+
							 '<input type="hidden" value="' +list[s].productNo+ '">'+
							 '<img src="<%=contextPath%>/resources/images/store/' + list[s].StroeImg + '" width="250px" height="280px"> <br>'+
							 '<p>'+ list[s].productName +'</p>'+
							 '</div>';
				}
				$(".soldout-list").html(value);
			},
			error:function(){
				console.log("ajax통신실패");
			}
		})	
	}
	</script>
	<%@ include file = "views/common/footer.jsp" %>
</body>
</html>