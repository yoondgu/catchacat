<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<div class="row p-5">
	<div class="col text-end">
		<a class="btn btn-secondary" href="reset">${page eq 'rank' ? 'Home' : 'Reset' }</a>
		<c:if test="${page eq 'success' or page eq 'fail' and not empty SCORE }">
			<a id="ranklink" class="btn btn-primary align-middle" href="rank">
				Record your Score 
			</a>
		</c:if>
		<c:if test="${page eq 'home' }">
			<a id="ranklink" class="btn btn-primary" href="rank">Score Ranking</a>
		</c:if>
		<c:if test="${page ne 'rank' }">
			<span class="badge rounded-fill bg-danger bg-black fs-5 align-middle">${empty SCORE ? 0 : SCORE }</span>
		</c:if>
	</div>
</div>
