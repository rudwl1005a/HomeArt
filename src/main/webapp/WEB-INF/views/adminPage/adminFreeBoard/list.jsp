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
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/freeBoard/list.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>HomeArt 자유게시판</title>
</head>
<body>
	<!-- header tag -->
	<b:CategoryAside/>

<div class="contents-wrap">
	<div class="container">
		<div class="row">
			<div class="col board-box">
				<h2 class="text-center">자유게시판</h2>
				<div class="table-admin">
					<table class="table table-hover" style="margin-bottom: 0;">
						<thead>
							<tr>
								<th class="col-2">No.</th>
								<th class="col-4 freeBoard-title">제목</th>
								<th class="col-2">작성자</th>
								<th class="col-2">작성일</th>
								<th class="col-2">조회수</th>
							</tr>
						</thead>
						
						<!-- 관리자일때 게시판목록 -->
						<tbody class="table-active">
							<c:forEach items="${listAdmin }" var="freeBoard">
								<c:if test="${pageInfo.currentPage == 1 }">
								<c:choose>
									<c:when test="${sessionScope.loggedInMember.isAdmin == 1}">
										<tr>
											<td class="col-2"><i class="far fa-flag" style="color: red;"></i></td>
											<td class="col-4 freeBoard-title" style="color: red;">
												<a style="color: red; font-weight: 550;" href="get?id=${freeBoard.board_id }">
													<c:out value="${freeBoard.title }"></c:out>
												</a>
												<c:if test="${freeBoard.replyCount > 0 }">
													<a href="get?id=${freeBoard.board_id }" style="color: red; font-weight: 550;">[${freeBoard.replyCount }]</a>
												</c:if>
												<c:if test="${freeBoard.hasFile }">
													<i class="far fa-images"></i>
												</c:if>
											</td>
											<td class="col-2">${freeBoard.nickName }</td>
											<td class="col-2">${freeBoard.boardInserted }</td>
											<td class="col-2">${freeBoard.viewCount }</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${freeBoard.isPublic == 1 }">
												<tr>
													<td class="col-2"><i class="far fa-flag" style="color: red;"></i></td>
													<td class="col-4 freeBoard-title" style="color: red;">
														<a style="color: red; font-weight: 550;" href="get?id=${freeBoard.board_id }">
															<c:out value="${freeBoard.title }"></c:out>
														</a>
														<c:if test="${freeBoard.replyCount > 0 }">
															<a href="get?id=${freeBoard.board_id }" style="color: red; font-weight: 550;">[${freeBoard.replyCount }]</a>
														</c:if>
														<c:if test="${freeBoard.hasFile }">
															<i class="far fa-images"></i>
														</c:if>
													</td>
													<td class="col-2">${freeBoard.nickName }</td>
													<td class="col-2">${freeBoard.boardInserted }</td>
													<td class="col-2">${freeBoard.viewCount }</td>
												</tr>
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="table-member">
					<table class="table table-hover">
						<tbody>
							 <c:set var="num" value="${pageInfo.countBoard - ((pageInfo.currentPage-1)*10) }"/>
							 <c:forEach items="${listMember }" var="freeBoard">
								<c:if test="${(freeBoard.isPublic == 0 && (sessionScope.loggedInMember.isAdmin == 1 || sessionScope.loggedInMember.member_id eq freeBoard.writer)) || freeBoard.isPublic == 1}">
									<tr>
										<td class="col-2">${num }</td>
										<td class="col-4 freeBoard-title">
											<a style="color: black;" href="get?id=${freeBoard.board_id }">
												<c:out value="${freeBoard.title }"></c:out>
											</a>
											<c:if test="${freeBoard.replyCount > 0 }">
												<a href="get?id=${freeBoard.board_id }" style="color: red; font-weight: 550;">[${freeBoard.replyCount }]</a>
											</c:if>
											<c:if test="${freeBoard.hasFile }">
												<i class="far fa-images"></i>
											</c:if>
										</td>
										<td class="col-2">${freeBoard.nickName }</td>
										<td class="col-2">${freeBoard.boardInserted }</td>
										<td class="col-2">${freeBoard.viewCount }</td>
									</tr>
								</c:if>
							<c:set var="num" value="${num-1 }"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- 검색기능 -->
				<nav class="navbar">
					<div class="container-fluid ">
						<!-- 검색창 -->
						<form class="d-flex" style="">
							<select class="form-control searchType" name="searchType">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
							<input class="form-control me-2 search-box" type="search" name="keyword" placeholder="Search" aria-label="Search">
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
					  		<c:url value="/adminPage/adminFreeBoard/list" var="pageLink">
					    		<c:param name="keyword" value="${param.keyword}"></c:param>
					    		<c:param name="searchType" value="${param.searchType}"></c:param>
					    		<c:param name="page" value="${pageInfo.leftPageNumber - 1 }"></c:param>
					    	</c:url>
						    <li class="page-item">
						      <a href="${pageLink }" aria-label="Previous">
						        <i aria-hidden="true"class="fas fa-chevron-left"></i>
						      </a>
						    </li>
					  	</c:if>
					  	
					  	<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
					    	<c:url value="/adminPage/adminFreeBoard/list" var="pageLink">
					    		<c:param name="keyword" value="${param.keyword}"></c:param>
					    		<c:param name="searchType" value="${param.searchType}"></c:param>
					    		<c:param name="page" value="${pageNumber }"></c:param>
					    	</c:url>
						    <li class="page-item">
						    	<a class="${pageInfo.currentPage == pageNumber ? 'active' : '' }" href="${pageLink }">${pageNumber }</a>
						    </li>
					    </c:forEach>
							
						<c:if test="${pageInfo.hasNextButton }">
					    	<c:url value="/adminPage/adminFreeBoard/list" var="pageLink">
					    		<c:param name="keyword" value="${param.keyword}"></c:param>
					    		<c:param name="searchType" value="${param.searchType}"></c:param>
					    		<c:param name="page" value="${pageInfo.rightPageNumber + 1 }"></c:param>
					    	</c:url>
						    <li class="page-item">
						      <a href="${pageLink }" aria-label="Next">
						        <i aria-hidden="true" class="fas fa-chevron-right"></i>
						      </a>
						    </li>
					    </c:if>
					</ul>
				</nav>
				</div>
			</div>
		</div>
</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>