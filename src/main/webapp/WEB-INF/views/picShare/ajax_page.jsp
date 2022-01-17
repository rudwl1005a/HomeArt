<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<c:forEach items="${list }" var="picBoard">
	<script>
		$(document).ready(function() {

			$("#card${picBoard.board_id}").hover(function() {

				$("#dropdown${picBoard.board_id}").css("display", "block");
			}, function() {

				$("#dropdown${picBoard.board_id}").css("display", "none");
			});

			// remove 버튼 실행.
			$("#removeSubmitButton").click(function(e) {
				e.preventDefault();
				if (confirm("삭제하시겠습니까?")) {
					$("#modifyForm").attr("action", "remove").submit();
				}
			});

		});
	</script>
</c:forEach>


<body>


	<c:forEach items="${list }" var="picBoard">


		<div class="col mb-5">
			<div class="card h-100" id="card${picBoard.board_id }">

				<!-- dropdown -->
				<div class="dropdown" id="dropdown${picBoard.board_id }" style="display: none;">
					<button class="btn btn-outline-dark dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
						<i class="fas fa-ellipsis-h"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

						<!-- c:if 태그로 로그인 한 멤버와 아닌 멤버의 메뉴 다르게 보이게끔 함.  -->
						<c:if test="${sessionScope.loggedInMember.member_id eq picBoard.writer }">
							<a class="dropdown-item" href="modify?id=${picBoard.board_id }">modify</a>
							<a class="dropdown-item" href="remove" id="removeSubmitButton">delete</a>
						</c:if>

						<a class="dropdown-item" href="#">share</a>

						<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

							<a class="dropdown-item" href="getArtist?id=${picBoard.board_id }">go artist</a>
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
						<div class="d-flex justify-content-center small text-secondary mb-2">
							<div class="bi-star-fill">${picBoard.nickName }</div>
						</div>

					</div>
				</div>
				<!-- Product actions-->
				<div class="card-footer p-2 pt-0 border-top-0 bg-transparent">
					<div class="text-align-justify d-flex">
						<div class="container d-flex mr-auto my-auto">
							<!-- like button -->
							<c:choose>
								<%-- 로그인 상태일 때, 하트가 클릭되게끔 --%>
								<c:when test="${not empty sessionScope.loggedInMember.member_id }">
									<c:choose>
										<c:when test="${empty like.like_id }">
											<%-- 빈 하트일때 --%>
											<div>
												<a idx="${picBoard.board_id }" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
													<i class="far fa-heart"></i>
												</a>
											</div>
										</c:when>
										<c:otherwise>
											<%-- 찬 하트일때 --%>
											<div>
												<a idx="${picBoard.board_id }" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
													<i class="fas fa-heart"></i>
												</a>
											</div>
										</c:otherwise>
									</c:choose>
								</c:when>
								<%-- 로그인 상태가 아닐 때, 하트가 클릭 안되게끔 --%>
								<c:otherwise>
									<div>
										<a href="javascript:" class="heart-notlogin text-danger text-lg">
											<i class="far fa-heart"></i>
										</a>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="container">
							<span class="text-danger text-lg" id="heart${picBoard.board_id }">${picBoard.like_cnt }</span>
							</div>
						</div>

						<%-- 
						<span id="like${picBoard.board_id }" class="mr-auto my-auto btn btn-outline-link text-danger text-lg">
							<i class="far fa-heart"></i>
							<span class="likeCount${picBoard.board_id }">0</span>
						</span>
						--%>

						<!-- go art -->
						<div class="container" style="text-align: right;">
							<a class="btn btn-outline-dark" href="get?id=${picBoard.board_id }">Go art</a>
						</div>
					</div>
				</div>
			</div>
		</div>


	</c:forEach>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {

			// search 버튼 실행.
			$("#search").click(function(e) {
				e.preventDefault();
				$("#search-form").attr("action", "getSearchList").submit();

			});

		});
	</script>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</html>




