<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>
<!-- 이미지 테스트 (나중에삭제) -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/mainpage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<c:url value="/mypage" var="mypageUrl"></c:url>
<c:url value="/freeBoard/get" var="freeBoardUrl"></c:url>

<title>HomeArt</title>
</head>

<body>
<b:navBar></b:navBar>

<div class="contents-wrap">
	<!-- Section art-->
		<section class="card-list-best">
			<div class="container ct">
				<div class="row justify-content-center"></div>

				<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel" data-pause="true">

					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<h3 class="mainName">weekly arts</h3>
							<hr size="10" color="white">
							<div style="padding-top: 10px;">
								<c:forEach items="${weekly }" var="picBoard">
									<form id="modifyForm" method="post" enctype="multipart/form-data">
										<div class="col-md-3" style="float: left;">
											<div class="card h-100" id="card${picBoard.board_id }">
	
												<!-- Product image-->
												<a href="picShare/get?id=${picBoard.board_id }">
													<img class="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
												</a>
												<!-- Product details-->
												<div class="card-body">
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
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</div>

						<div class="carousel-item">
							<h3 class="mainName">monthly arts</h3>
							<hr size="10" color="white">
							<div style="padding-top: 10px;">
								<c:forEach items="${monthly }" var="picBoard">
									<form id="modifyForm" method="post" enctype="multipart/form-data">
										<div class="col-md-3" style="float: left;">
											<div class="card h-100" id="card${picBoard.board_id }">
	
												<!-- Product image-->
												<a href="picShare/get?id=${picBoard.board_id }">
													<img class="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
												</a>
												<!-- Product details-->
												<div class="card-body">
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
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</div>

						<div class="carousel-item">
							<h3 class="mainName">yearly arts</h3>
							<hr size="10" color="white">
							<div style="padding-top: 10px;">
								<c:forEach items="${yearly }" var="picBoard">
									<form id="modifyForm" method="post" enctype="multipart/form-data">
										<div class="col-md-3" style="float: left;">
											<div class="card h-100" id="card${picBoard.board_id }">
	
												<!-- Product image-->
												<a href="picShare/get?id=${picBoard.board_id }">
													<img class="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
												</a>
												<!-- Product details-->
												<div class="card-body">
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
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
	
	<!-- 공지사항 -->
	<div class="container">
		<div class="row">
			<div class="col" style="padding: 60px 0;">
				<h3 style="margin-bottom: 20px; font-weight:bold;">공지사항 <i class="fas fa-bullhorn" style="color: red;"></i></h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="col-2">No.</th>
							<th class="col-4 freeBoard-title">제목</th>
							<th class="col-2">작성자</th>
							<th class="col-2" style="text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${notice }" var="notice" varStatus="status" >
							<c:if test="${notice.isPublic == 1 }">
							<tr>
								<td class="col-2" style="color: red; font-weight: bold;">${status.count }</td>
								<td class="col-4 freeBoard-title" style="color: red; font-weight: bold;">
									<a href="${freeBoardUrl }?id=${notice.board_id}" id="noticeTitle">${notice.title}</a>
									<c:if test="${notice.replyCount > 0 }">
										<a href="get?id=${notice.board_id }" style="color: red; font-weight: 550;">[${notice.replyCount }]</a>
									</c:if>
									<c:if test="${notice.hasFile }">
										<i class="far fa-images"></i>
									</c:if>
								</td>
								<td class="col-2" >${notice.nickName }</td>
								<td class="col-2">${notice.boardInserted }</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">결과</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>${result }</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</c:if>
			
	<b:bottomInfo></b:bottomInfo>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		if(history.state == null){
			$("#modal1").modal('show');
			history.replaceState({}, null);
		}
	});
</script>

</body>
</html>
