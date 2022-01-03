<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 이미지 테스트 (나중에삭제) -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<style>
.logo {
	background-color: #47423f;
	color: white;
	height: 100px;
	text-align: center;
}

.textlogo {
	font-size: 25pt;
	letter-spacing: 2px;
 	color: white;
	text-shadow: 4px 4px 4px rgb(173, 166, 146);
	vertical-align: middle;
}
</style>

<div class="logo">
	<img src="<spring:url value='/resources/img/logo3.jpg'/>" height="100px">
	<span class="textlogo"> Home Art</span>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-bottom: 20px">
	<a class="navbar-brand" href="/controller/">HomeArt</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="/controller/picShare/list">그림공유</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/controller/masterpiece/list">명화추천</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/controller/freeBoard/list">자유게시판</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/controller/mypage">마이페이지</a>
		</ul>
	</div>
</nav>
<!-- 나중에 경로 정해서
<script>
	$(function() {
		// actvie 활성화
		$(".nav-item > .active").css("color", "red");

		$('.nav-link').click(function() {
			// .nav-link 클릭시 이전의 active 값 해제 후,
			$(".nav-item > .active").css("color", "#007bff");
			$('.nav-link').removeClass('active');

			// 클릭한 위치 active 적용
			$(this).addClass('active');
			$(".nav-item > .active").css("color", "red");
		});
	});
</script>
 -->