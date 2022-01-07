<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand-sm navbar-light bg-light">
	<a class="navbar-brand" href="#">
		<img src="/docs/4.6/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
		카테고리
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-expanded="false" href="#">작가그림공유 편집</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">그림공유 편집</a>
						<a class="dropdown-item" href="#">그림 승인</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-expanded="false" href="#">명화 편집</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">명화 편집</a>
						<a class="dropdown-item" href="#">댓글 편집</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-expanded="false" href="#">자유게시판 편집</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">게시판 편집</a>
						<a class="dropdown-item" href="#">댓글 편집</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="navbarDropdownMenuLink1" role="button" aria-expanded="false" href="#">공지사항</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="navbarDropdownMenuLink1" role="button" aria-expanded="false" href="#">카테고리 편집</a>

				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-expanded="false" href="#">회원 관리</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">포인트 관리</a>
						<a class="dropdown-item" href="#">회원 차단 관리</a>
					</div>
				</li>
			</ul>
		</div>
	</a>
</nav>


