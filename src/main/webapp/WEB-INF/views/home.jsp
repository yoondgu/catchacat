<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Catch a Cat !</title>
</head>
<body>
<div class="container min-vh-100 d-flex flex-column justify-content-between">
	<c:set var="page" value="home" />
	<%@ include file="common/nav.jsp" %>
	<div class="row p-5">
		<form id="cat-form" method="post" action="cat">
			<!-- a태그 클릭이벤트 발생 시 난수를 value에 저장해 전달 -->
			<input type="hidden" name="num" />
			<div class="catlink d-flex justify-content-evenly mb-5"></div>
			<div class="catlink d-flex justify-content-evenly mb-5"></div>
			<div class="catlink d-flex justify-content-evenly mb-5"></div>
			<div class="catlink d-flex justify-content-evenly"></div>
		</form>
	</div>
	<footer class="row p-5">
		<a class="text-muted" href="https://www.flaticon.com/free-icons/cat" title="cat icons">Cat icons created by photo3idea_studio - Flaticon</a>
	</footer>
</div>
</body>
<script type="text/javascript">
	let linkHTML = "<a>" +
					"<img class='caticon' src='/resources/images/icon.png' height='80px'"	+
					"</a>";
	let count = 8;
	for (let i = 0; i < count; i++) {
		$("#cat-form > div").append(linkHTML);
	}
	
	// 아이콘 클릭 시 난수를 전달하는 폼 제출
	$(".catlink > a").click(function() {
		// 0 ~ 99 사이의 난수 발생시키기
		let num = Math.floor(Math.random()*100);
		$("#cat-form > input[name=num]").val(num); 
		// num, score을 controller에 전달함
		$("#cat-form").submit();
	});
	
	// hover 효과(아이콘 이미지 변경) 등록
	$(".caticon").mouseover(function () {
		$(this).attr("src", "/resources/images/iconhover.png");
	});
	$(".caticon").mouseleave(function () {
		$(this).attr("src", "/resources/images/icon.png");
	});
	
</script>
</html>