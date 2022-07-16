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
<div class="container min-vh-100 d-flex flex-column">
	<c:set var="page" value="success" />
	<%@ include file="common/nav.jsp" %>
	<div class="row p-3">
		<p class="fs-1 fw-bold text-center">success</p>
		<p class="fs-3 text-center">click me!</p>
		<a href="/" class="text-center p-3">
			<img alt="cat" id="catimage" src="" style="width: 600px; heigth: auto">
		</a>
	</div>
</body>
<script type="text/javascript">
	// 랜덤 고양이 이미지 api에서 json을 받아옴(바로 띄울 수 있는 외부 파일 경로)
	$.get("https://aws.random.cat/meow", function(data, status) {
		$("#catimage").attr("src", data.file);
	}, "json");
	
</script>
</html>