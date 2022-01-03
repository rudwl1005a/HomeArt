<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="${pageContext.request.contextPath}/resources/css/list.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>HomeArt 자유게시판</title>
</head>
<body>
	<!-- header tag -->

	<div class="container">
		<div class="row">
			<div class="col">
				<h1 class="text-center">자유게시판</h1>

				<div class="adminTable">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성시간</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- 관리자일때 게시판목록 -->
								<c:forEach items="${list }" var="board">
									<td><i class="far fa-flag" style="font-color: red;"></i></td>
									<td>${board.title }</td>
									<td>${board.writer }</td>
									<td>${board.customInserted }</td>
									<td>${board.viewCount }</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="memberTable">
					<table class="table table-hover">
						<tbody>
							<tr>
								<!-- 일반회원 게시판 목록 -->
								<c:forEach items="${list }" var="board">
									<td>${board.boardId }</td>
									<td>${board.title }</td>
									<td>${board.writer }</td>
									<td>${board.customInserted }</td>
									<td>${board.viewCount }</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				<nav class="navbar">
					<div class="container-fluid ">
						<!-- 버튼 - 글쓰기/작성 -->
						<button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/freeBoard/post'">글쓰기</button>
						<!-- 검색창 -->
						<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-dark" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</form>
					</div>
				</nav>

				<!-- pagination - page이동버튼(중간) -->
				<%-- <c:forEach begin="" end="" var="">
								<c:url value="" var="">
									<c:param name="page" value=""></c:param>
								</c:url>
								<li><a href=""></a></li>
							</c:forEach> --%>
				
				<nav aria-label="Page navigation">
						<ul class="pagination p1 justify-content-center">
							<li class="page-item disabled"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
							<li class="page-item"><a class="is-active" href="#">1</a></li>
							
							<%-- <c:forEach begin="" end="" var="">
								<c:url value="" var="">
									<c:param name="page" value=""></c:param>
								</c:url>
								<li><a href=""></a></li>
							</c:forEach> --%>
							
							<li class="page-item"><a href="#">2</a></li>
							<li class="page-item"><a href="#">3</a></li>
							<li class="page-item"><a href="#">4</a></li>
							<li class="page-item"><a href="#">5</a></li>
							<li class="page-item"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
						</ul>
				</nav>

				</div>
			</div>
		</div>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>