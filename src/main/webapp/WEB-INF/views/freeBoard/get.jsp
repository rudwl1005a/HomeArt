<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="${pageContext.request.contextPath}/resources/css/freeBoard/get.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function() {
	$("#removeSubmitButton").click(function(e) {
		e.preventDefault(); //기본동작진행하지 않도록 함.
		if(confirm("정말 삭제 하시겠습니까?")){
			$("#modifyForm").attr("action", "remove").submit();
		}
	});
	$("#removeSubmitButton2").click(function(e) {
		e.preventDefault(); //기본동작진행하지 않도록 함.
		if(confirm("정말 삭제 하시겠습니까?")){
			$("#modifyForm").attr("action", "remove").submit();
		}
	});
	
});
</script>
<title>HomeArt 자유게시판 글 조회</title>
</head>
<body>
<b:navBar></b:navBar>
<!-- 글 내용 -->
<div class="container">
		<div class="row">
			<div class="col">
				<div class="board-view">
				<form id="modifyForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${freeBoard.board_id }">
					<div class="get-group">
						<!-- 글제목 -->
						<h2>${freeBoard.title }</h2>
						<div class="title-sub">
							<span>by ${freeBoard.nickName }</span>
							<span class="tsub">${freeBoard.boardInserted }</span>
							<c:if test="${sessionScope.loggedInMember.member_id eq freeBoard.writer }">
								<a class="tsub" href="modify?id=${freeBoard.board_id }">수정</a>
								<a id="removeSubmitButton" class="tsub" href="">삭제</a>
							</c:if>
						</div>
					</div>
					<div class="get-group2">
						<!-- 글내용 -->
						<c:out value="${freeBoard.content }" escapeXml="false" ></c:out>
					</div>
					<div class="get-buttons">
						<a class="btn btn-dark float-left" type="button" href="post">글쓰기</a>
						<div class="float-right">
							<button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/freeBoard/list'">목록</button>
							<c:if test="${sessionScope.loggedInMember.member_id eq freeBoard.writer }">
								<button id="removeSubmitButton2" class="btn btn-dark" type="button">삭제</button>
								<a href="modify?id=${freeBoard.board_id }" class="btn btn-dark" type="button">수정</a>
							</c:if>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 댓글 리스트 -->

<div class="container">
	<div class="row">
		<div class="col">
			<hr>
			<h3>댓글</h3>
			
		</div>
	</div>
</div>

<!-- 댓글 작성 textarea -->
<div class="container">
	<div class="row">
		<div class="col">
			<div class="input_reply">
			
			</div>
		</div>
	</div>
</div>

<!-- 페이지 이동 (자유게시판 다른 글들 표시)-->
<div class="container">
	<div class="row">
		<div class="col">
			
		</div>
	</div>
</div>
<b:bottomInfo></b:bottomInfo>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>