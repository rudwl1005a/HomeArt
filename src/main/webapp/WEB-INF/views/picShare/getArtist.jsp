<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.homeart.domain.picShare.*"%>


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

<title>HomeArt</title>

<style>
body {
	background-color: #222;
}

.card-img-top {
	height: 15rem;
	object-fit: cover;
}

.titleName {
	max-width: 210px;
	display: inline-block;
	overflow: hidden;
	word-wrap: break-word;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>

<script>
	const like = function() {

		let like_cnt = '${board.like_cnt}';

		// 로그인을 한 상태에서 하트를 클릭했을 때 (로그인 상태의 a 태그의 class: heart-click)
		$(".heart-click")
				.click(
						function() {

							// 게시물 번호를 idx로 전달받아 저장
							let boardId = $(this).attr('idx');
							console.log("heart-click" + boardId);

							// 빈하트를 눌렀을 때,
							if ($(this).children('i').attr('class') == "far fa-heart") {
								console.log("빈하트 클릭" + boardId);

								$.ajax({
									url : 'saveHeart.do',
									type : 'GET',
									data : {
										boardId : boardId,
										like_cnt : like_cnt
									},
									success : function(board) {
										// 페이지 새로고침
										// document.location.reload(true);

										/* let heart = '${board.like_cnt}';  */

										console.log(board.like_cnt);

										$('#heart' + boardId).text(
												board.like_cnt);

										console.log("하트추가 성공");
									},
									error : function() {
										alert('서버 에러');
									}
								});
								console.log("꽉 찬 하트로 바뀌어 주겠지? 바껴라!");

								// 꽉찬하트로 바꾸기
								$(this).html(`<i class="fas fa-heart"></i>`);
								$('.heart_icon' + boardId).html(
										`<i class="fas fa-heart"></i>`);

								// 꽉 찬 하트를 눌렀을때는? 다시 빈 하트로 바뀌어야함.
							} else if ($(this).children('i').attr('class') == "fas fa-heart") {
								console.log("꽉 찬 하트를 클릭" + boardId);

								$.ajax({
									url : 'removeHeart.do',
									type : 'GET',
									data : {
										boardId : boardId,
										like_cnt : like_cnt
									},
									success : function(board) {
										// 페이지 새로고침
										// document.location.reload(true);

										/* let heart = '${board.like_cnt}';  */

										// 페이지 하트 수 갱신
										$('#heart' + boardId).text(
												board.like_cnt);

										console.log("하트 삭제, 빈하트로 변경 성공!");
									},
									error : function() {
										alert('서버에러');
									}
								});
								console.log("빈하트로 다시 바뀌냐 ?");

								// 빈하트로 바꾸기
								$(this).html(`<i class="far fa-heart"></i>`);
								$('.heart_icon' + boardId).html(
										`<i class="far fa-heart"></i>`);

							}

							// 로그인 한 상태에서 하트를 클릭하면 로그인 해야한다는 알림창을 뜨게끔
							$(".heart-notlogin").unbind('click');
							$(".heart-notlogin").click(function() {
								alert('로그인 후 이용가능합니다.');

							});

						});
	}
</script>


</head>
<body>

	<b:navBar></b:navBar>

	<div class="contents-wrap">

		<!-- Section art-->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<c:forEach items="${list }" var="picBoard" begin="1" end="1">
					<h3 class="text-light font-weight-light">${picBoard.nickName }의arts</h3>
					<hr>
				</c:forEach>
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">



					<c:forEach items="${list }" var="picBoard">
						<form idx="${picBoard.board_id }" id="modifyForm${picBoard.board_id }" method="post" enctype="multipart/form-data">

							<div class="col mb-5">
								<div class="card h-100" id="card${picBoard.board_id }">

									<!-- dropdown -->
									<div class="dropdown" id="dropdown${picBoard.board_id }" style="display: none;">
										<button class="btn btn-outline-dark dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
											<i class="fas fa-ellipsis-h"></i>
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											<input type="hidden" name="board_id" value="${picBoard.board_id }">
											<!-- c:if 태그로 로그인 한 멤버와 아닌 멤버의 메뉴 다르게 보이게끔 함.  -->
											<c:if test="${sessionScope.loggedInMember.member_id eq picBoard.writer }">
												<a class="dropdown-item" href="modify?id=${picBoard.board_id }">modify</a>
												<a class="dropdown-item" href="#" type="button" id="removeSubmitButton${picBoard.board_id }">delete</a>
											</c:if>

											<a class="dropdown-item" href="#">share</a>

											<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

												<a class="dropdown-item" href="#">go artist</a>
												<a class="dropdown-item" href="#">declaration</a>
											</c:if>
										</div>
									</div>


									<!-- Product image-->
									<a href="get?id=${picBoard.board_id }">
									<img class="card-img-top" id="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
									</a>
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">

											<!-- 작품 이름-->
											<h5 class="fw-bolder" id="titleName">${picBoard.title }</h5>
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
														<%
														List<picBoardVO> getLikeId = (List<picBoardVO>) request.getAttribute("getLikeId");
														picBoardVO picBoard = (picBoardVO) pageContext.getAttribute("picBoard");

														boolean liked = getLikeId.stream().anyMatch(l -> l.getBoard_id().equals(picBoard.getBoard_id()));
														//System.out.println("###############" + liked  + ":::" + picBoard.getBoard_id() + ":::" + getLikeId );
														pageContext.setAttribute("liked", liked);
														%>

														<c:choose>
															<c:when test="${not liked}">
																<%-- 빈 하트일때 --%>
																<div>
																	<a idx="${picBoard.board_id}" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
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

											<!-- go art -->
											<div class="container" style="text-align: right;">
												<a class="btn btn-outline-dark" href="get?id=${picBoard.board_id }">Go art</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</c:forEach>

				</div>
			</div>
		</section>

		<!-- register button & search button -->
		<nav class="navbar" style="background-color: #222; padding-right: 100px;">
			<div class="container">
				<!-- register button -->
				<button class="btn btn-outline-light" type="button" onclick="location.href='${pageContext.request.contextPath}/picShare/register'">Post</button>
				<!-- list button -->
				<button class="btn btn-outline-light" type="button" onclick="location.href='${pageContext.request.contextPath}/picShare/list'">list</button>
			</div>
		</nav>

		<nav aria-label="Page navigation">
			<ul class="pagination p1 justify-content-center">
			</ul>
		</nav>

		<b:bottomInfo></b:bottomInfo>
	</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {

		});
	</script>

</body>

</html>




























