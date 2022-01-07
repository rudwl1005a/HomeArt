<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/freeBoard/list.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>HomeArt 자유게시판</title>
</head>
<body>
	<!-- header tag -->
	<b:navBar></b:navBar>

<div class="contents-wrap">
	<div class="container">
		<div class="row">
			<div class="col">
				<h1 class="text-center">자유게시판</h1>

				<div class="table">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						
							<tbody class="table-active">
								<!-- 관리자일때 게시판목록 -->
								<c:forEach items="${list }" var="freeBoard">
									<c:if test="${freeBoard.isAdmin == 1}">
									<tr>
										<td><i class="far fa-flag" style="color: red;"></i></td>
										<td>
											<a style="color: red;" href="get?id=${freeBoard.board_id }">
												<c:out value="${freeBoard.title }"></c:out>
											</a>
										</td>
										<td>${freeBoard.nickName }</td>
										<td>${freeBoard.boardInserted }</td>
										<td>${freeBoard.viewCount }</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
							<tbody>
							<!-- 일반회원 게시판 목록 -->
								<c:forEach items="${list }" var="freeBoard">
									<c:if test="${freeBoard.isAdmin == 0}">
									<tr>
										<td>${freeBoard.board_id }</td>
										<%-- <c:forEach begin="1" end="${freeBoard.boardCount }" var="boardCount">
											<td>${boardCount }</td>
										</c:forEach> --%>
										<td>
											<a style="color: black;" href="get?id=${freeBoard.board_id }">
												<c:out value="${freeBoard.title }"></c:out>
											</a>
										</td>
										<td>${freeBoard.nickName }</td>
										<td>${freeBoard.boardInserted }</td>
										<td>${freeBoard.viewCount }</td>
									</tr>
								</c:if>
								</c:forEach>
							</tbody>
					</table>
				</div>

				<nav class="navbar">
					<div class="container-fluid ">
						<!-- 버튼 - 글쓰기/작성 -->
						<a class="btn btn-dark" type="button" href="${pageContext.request.contextPath}/freeBoard/post">글쓰기</a>
						<!-- 검색창 -->
						<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-dark" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</form>
					</div>
				</nav>
				
				<!-- pagination -->
				<nav aria-label="Page navigation">
						<ul class="pagination p1 justify-content-center">
							<c:if test="${pageInfo.hasPrevButton }">
								<c:url value="/freeBoard/list" var="pageLink">
									<c:param name="page" value="${pageInfo.leftPageNumber - 1 }"></c:param>
								</c:url>
								<li class="page-item disabled">
									<a class="page-link" href="${pageLink }" aria-label="Previous">
									<span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
									</a>
								</li>
							</c:if>
							
							<!-- pagination - page이동버튼(중간) -->
							<%-- <c:forEach begin="" end="" var="">
								<c:url value="" var="">
									<c:param name="page" value=""></c:param>
								</c:url>
								<li><a href=""></a></li>
							</c:forEach> --%>
							
							<li class="page-item"><a class="is-active" href="#">1</a></li>
							<li class="page-item"><a href="#">2</a></li>
							<li class="page-item"><a href="#">3</a></li>
							<li class="page-item"><a href="#">4</a></li>
							<li class="page-item"><a href="#">5</a></li>
							
							<c:if test="${pageInfo.hasNextButton }">
								<c:url value="/freeBoard/list" var="pageLink">
									<c:param name="page" value="${pageInfo.rightPageNumber + 1 }"></c:param>
								</c:url>							
								<li class="page-item">
									<a class="page-link" href="${pageLink}" aria-label="Next">
									<span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
									</a>
								</li>
							</c:if>
						</ul>
				</nav>
				</div>
			</div>
		</div>

	<b:bottomInfo></b:bottomInfo>
</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>