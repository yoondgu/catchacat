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
<div class="container min-vh-100 d-flex flex-column align-items-stretch">
	<c:set var="page" value="rank" />
	<%@ include file="common/nav.jsp" %>
	<div class="row my-auto d-flex flex-column flex-sm-row">
		<div class="col p-3 m-auto">
			<h2 class="fw-bold">CURRENT RANKING</h2>
			<img alt="catimage" src="/resources/images/funcat.jpg" class="img-fluid my-5">
			<table class="table table-sm w-100">
				<colgroup>
					<col width="15%" />
					<col width="*" />
					<col width="15%" />
				</colgroup>
				<tbody>
				<c:forEach var="record" items="${rankedrecords }" varStatus="loop">
					<tr>
						<td class="fw-bold">${loop.count }</td>
						<td>${record.name }</td>
						<td class="fw-bold text-center">${record.score }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col o-3 my-auto ${empty SCORE ? 'd-none' : '' }">
			<div class="card p-3 w-80">
				<h3>RECORD YOUR SCORE</h3>
				<small>if you click 'Home' Button, your score will be reset.</small>
				<form:form method="post" action="record" modelAttribute="recordForm">
					<div class="fs-5 my-3">
						SCORE : <span class="fw-bold">${SCORE }</span>
					</div>
					<div class="p-1">
						<form:errors path="name" class="text-danger small" />
					</div>
					<div class="input-group mb-3">
						<form:hidden class="form-control" path="score" value="${SCORE }"/>
						<form:input class="form-control" path="name" placeholder="ENTER YOUR NAME" />
						<form:button class="btn btn-outline-primary">SUBMIT</form:button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
</body>
</html>