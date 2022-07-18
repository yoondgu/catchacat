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
	<c:set var="page" value="fail" />
	<%@ include file="common/nav.jsp" %>
	<div class="row p-3">
		<p class="fs-1 fw-bold text-center">fail</p>
	</div>
	<div class="row p-3 justify-content-center">
		<div class="col-8">
			<img alt="cat" id="catimage" src="/resources/images/failcat.jpg" class="img-fluid">
		</div>
	</div>
</div>
</body>
</html>