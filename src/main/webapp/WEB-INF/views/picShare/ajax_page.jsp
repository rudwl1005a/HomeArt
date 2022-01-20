<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.homeart.domain.picShare.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<c:forEach items="${list }" var="picBoard">


		<form idx="${picBoard.board_id }" id="modifyForm${picBoard.board_id }" method="post" enctype="multipart/form-data">
			<div class="col mb-5">
				<div class="card h-100" id="card${picBoard.board_id }" idx="${picBoard.board_id }">
					<!-- dropdown -->
					<div class="dropdown" id="dropdown${picBoard.board_id }" style="display: none;">
						<button class="btn btn-outline-dark dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" data-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<input type="hidden" name="board_id" value="${picBoard.board_id }">
							<!-- c:if 태그로 로그인 한 멤버와 아닌 멤버의 메뉴 다르게 보이게끔 함.  -->
							<c:if test="${sessionScope.loggedInMember.member_id eq picBoard.writer }">
								<a class="dropdown-item" href="modify?id=${picBoard.board_id }">modify</a>
								<a class="dropdown-item" href="#" type="button" id="removeSubmitButton${picBoard.board_id }">delete</a>
							</c:if>

							<a class="dropdown-item" href="javascript:" data-clipboard-target="http://localhost:8080/controller/picShare/get?id=${picBoard.board_id }" id="shareButton${picBoard.board_id }">share</a>

							<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

								<a class="dropdown-item" href="getArtist?id=${picBoard.board_id }">go artist</a>
								<a class="dropdown-item" href="#" id="declaration${picBoard.board_id }">declaration</a>
							</c:if>
						</div>
					</div>

					<%-- <c:if test="${weekly.board_id eq picBoard.board_id}"> --%>
					<%
					ArrayList<picBoardVO> weekly = (ArrayList<picBoardVO>) request.getAttribute("weekly");
					ArrayList<picBoardVO> monthly = (ArrayList<picBoardVO>) request.getAttribute("monthly");
					ArrayList<picBoardVO> yearly = (ArrayList<picBoardVO>) request.getAttribute("yearly");
					picBoardVO picBoard = (picBoardVO) pageContext.getAttribute("picBoard");
					boolean isHotWeekly = weekly.stream().anyMatch(w -> w.getBoard_id().equals(picBoard.getBoard_id()));
					boolean isHotMonthly = monthly.stream().anyMatch(w -> w.getBoard_id().equals(picBoard.getBoard_id()));
					boolean isHotYearly = yearly.stream().anyMatch(w -> w.getBoard_id().equals(picBoard.getBoard_id()));
					pageContext.setAttribute("isHotWeekly", isHotWeekly);
					pageContext.setAttribute("isHotMonthly", isHotMonthly);
					pageContext.setAttribute("isHotYearly", isHotYearly);
					%>

					<c:if test="${isHotWeekly || isHotMonthly || isHotYearly }">
						<!-- HOT badge -->
						<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div>
					</c:if>

					<!-- Product image-->
					<img class="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">

							<!-- 작품 이름-->
							<h5 class="fw-bolder" id="titleName"><c:out value="${picBoard.title }"/></h5>
							
						
							
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
										boolean liked = getLikeId.stream().anyMatch(l -> l.getBoard_id().equals(picBoard.getBoard_id()));
										//System.out.println("###############" + liked  + ":::" + picBoard.getBoard_id() + ":::" + getLikeId );
										pageContext.setAttribute("liked", liked);
										%>
										<c:choose>
											<%-- 빈 하트일때 --%>
											<c:when test="${not liked}">
												<div>
													<a idx="${picBoard.board_id}" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
														<i class="far fa-heart"></i>
													</a>
												</div>
											</c:when>
											<c:otherwise>
												<%-- 찬 하트일때 --%>
												<div>
													<a idx="${picBoard.board_id}" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
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

		</form>
	</c:forEach>



