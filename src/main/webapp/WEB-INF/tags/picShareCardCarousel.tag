<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icon/css/all.css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">


<style>
body {
	background-color: #222;
}
</style>


<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

	<ol class="carousel-indicators">
		<li data-target="#multi-item-example" data-slide-to="1" class="active"></li>
		<li data-target="#multi-item-example" data-slide-to="2"></li>
	</ol>

	<!-- Slider -->
	<div class="carousel-inner" role="listbox">

		<!-- First slide -->
		<div class="carousel-item active">

			<div class="col mb-5" style="float: left">
				<div class="card h-100">
					<!-- dropdown -->

					<div class="dropdown">
						<button class="btn btn-outline-light dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

							<!-- c:if 태그로 로그인 한 멤버와 아닌 멤버의 메뉴 다르게 보이게끔 함.  -->
							<c:if test="${sessionScope.loggedInMember.member_id eq picBoard.writer }">
								<a class="dropdown-item" href="modify?id=${picBoard.board_id }">modify</a>
								<a class="dropdown-item" href="#" id="removeSubmitButton">delete</a>
							</c:if>

							<a class="dropdown-item" href="#">share</a>

							<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

								<a class="dropdown-item" href="#">go artist</a>
								<a class="dropdown-item" href="#">declaration</a>
							</c:if>
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
								<div class="bi-star-fill">${picBoard.nickName }</div>
							</div>
							<!-- Like, View-->
							<span class="text-muted text-decoration-line-through">Like View</span>

						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="get?id=${picBoard.board_id }">Go art</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Second slide -->
		<div class="carousel-item">

			<div class="col mb-5" style="float: left">
				<div class="card h-100">

					<!-- dropdown -->
					<div class="dropdown">
						<button class="btn btn-outline-light dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

							<!-- c:if 태그로 로그인 한 멤버와 아닌 멤버의 메뉴 다르게 보이게끔 함.  -->
							<c:if test="${sessionScope.loggedInMember.member_id eq picBoard.writer }">
								<a class="dropdown-item" href="modify?id=${picBoard.board_id }">modify</a>
								<a class="dropdown-item" href="#" id="removeSubmitButton">delete</a>
							</c:if>

							<a class="dropdown-item" href="#">share</a>

							<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

								<a class="dropdown-item" href="#">go artist</a>
								<a class="dropdown-item" href="#">declaration</a>
							</c:if>
						</div>
					</div>

					<!-- HOT badge -->
					<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div>

					<!-- Product image-->
					<img class="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">

							<!-- 작품 이름-->
							<h5 class="fw-bolder">${picBoard.title }</h5>
							<!-- text-warning이 글씨의 색깔을 나타냄. -->
							<!-- 작가 이름 -->
							<div class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">${picBoard.nickName }</div>
							</div>
							<!-- Like, View-->
							<span class="text-muted text-decoration-line-through">Like View</span>

						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="get?id=${picBoard.board_id }">Go art</a>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>























