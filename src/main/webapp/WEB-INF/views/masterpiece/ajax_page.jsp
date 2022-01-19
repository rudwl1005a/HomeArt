<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

	<body>
		

						<c:forEach items="${list }" var="m">
							<div class="col mb-5">
								<div class="card h-100">
									<!-- dropdown -->
									<div class="dropdown">
										<button class="btn btn-outline-light dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
											<i class="fas fa-ellipsis-h"></i>
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											
											<a class="dropdown-item" href="modify?masterpiece_id=${m.masterpiece_id }">modify(admin)</a> 
											<a class="dropdown-item" href="#">delete(admin)</a> 
											<a class="dropdown-item" href="#">share(admin, member)</a> 
											<a class="dropdown-item" href="#">go artist(member)</a> 
											<a class="dropdown-item" href="#">declaration(member)</a>
										</div>
									</div>
									<!-- HOT badge -->
									<!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div> -->
									<!-- Product image-->
									<img class="card-img-top" src="${staticUrl }/masterpiece/${m.masterpiece_id }/${m.file_name }" alt="${m.file_name }">
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- 작품 이름-->
											<h5 class="fw-bolder">${m.title }</h5>
											<!-- text-warning이 글씨의 색깔을 나타냄. -->
											<!-- 작가 이름 -->
											<div class="d-flex justify-content-center small text-warning mb-2">
												<div class="bi-star-fill">작가 : ${m.artist }</div>
											</div>
											<!-- 작품 나라 -->
											<div class="d-flex justify-content-center small text-warning mb-2">
												<div class="bi-star-fill">나라 : ${m.country }</div>
											</div>
											<!-- 작품 시대 -->
											<div class="d-flex justify-content-center small text-warning mb-2">
												<div class="bi-star-fill">시대 : ${m.age }</div>
											</div>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="get?masterpiece_id=${m.masterpiece_id }">Go art</a>
											<%-- <span class="text-muted text-decoration-line-through" id="updateLike">${m.likeSu}</span> --%>
											<button id="likeBtn${m.masterpiece_id }" class="btn btn-dark" type="button" onclick="updateLike('${m.masterpiece_id }','${sessionScope.loggedInMember.member_id }')">좋아요 ${m.likeSu }</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						

	</body>




<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</html>











