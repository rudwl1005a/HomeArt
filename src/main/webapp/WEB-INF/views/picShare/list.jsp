<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/picBoardlist.css" rel="stylesheet" type="text/css">

<title>List</title>

<style>
body {
	background-color: #222;
}
</style>

<script>
	
</script>

</head>
<body>

	<b:navBar></b:navBar>

	<div class="contents-wrap">

		<!-- Section art-->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach items="${list }" var="picBoard">
						<div class="col mb-5">
							<div class="card h-100">
								<!-- dropdown -->
								 
								<div class="dropdown">
									<button class="btn btn-outline-light dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
									<i class="fas fa-ellipsis-h"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="modify?id=${picBoard.boardId }">modify(admin)</a>
										<a class="dropdown-item" href="#">delete(admin)</a>
										<a class="dropdown-item" href="#">share(admin, member)</a>
										<a class="dropdown-item" href="#">go artist(member)</a>
										<a class="dropdown-item" href="#">declaration(member)</a>
									</div>
								</div>
								
								<!-- HOT badge -->
								<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div>
									
								<!-- Product image-->
								<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">

										<!-- 작품 이름-->
										<h5 class="fw-bolder">${picBoard.title }</h5>
										<!-- text-warning이 글씨의 색깔을 나타냄. -->
										<!-- 작가 이름 -->
										<div class="d-flex justify-content-center small text-warning mb-2">
											<div class="bi-star-fill">${picBoard.writer }</div>
										</div>
										<!-- Like, View-->
										<span class="text-muted text-decoration-line-through">Like View</span>

									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto" href="get?id=${picBoard.boardId }">Go art</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>


			</div>
		</section>

		<!-- register button & search button -->
		<nav class="navbar" style="background-color: #222; padding-right: 100px;">
			<div class="container">
				<!-- register button -->
				<button class="btn btn-outline-light" type="button" onclick="location.href='${pageContext.request.contextPath}/picShare/register'">Post</button>
				<!-- search button -->
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-light" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</nav>

		<!-- pagination -->
		<nav aria-label="Page navigation">
			<ul class="pagination p1 justify-content-center">
				<c:if test="${picPageInfo.hasPrevButton }">
					<c:url value="/picShare/list" var="pageLink">
						<c:param name="page" value="${picPageInfo.leftPageNumber - 1 }" />
					</c:url>
					<li class="page-item disabled">
						<a href="${pageLink }">
							<i class="fas fa-chevron-left"></i>
						</a>
					</li>
				</c:if>

				<c:forEach begin="${picPageInfo.leftPageNumber }" end="${picPageInfo.rightPageNumber }" var="pageNumber">
					<c:url value="/picShare/list" var="pageLink">
						<c:param name="page" value="${pageNumber }" />
					</c:url>
					<li class="page-item">
						<a class="${picPageInfo.currentPage == pageNumber ? 'is-active' : 'active' }" href="${pageLink }">${pageNumber }</a>
					</li>
				</c:forEach>

				<c:if test="${picPageInfo.hasNextButton }">
					<c:url value="/picShare/list" var="pageLink">
						<c:param name="page" value="${picPageInfo.rightPageNumber + 1 }" />
					</c:url>
					<li class="page-item disabled">
						<a href="${pageLink }">
							<i class="fas fa-chevron-right"></i>
						</a>
					</li>
				</c:if>

			</ul>
		</nav>


		<b:bottomInfo></b:bottomInfo>
	</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>

</html>




























