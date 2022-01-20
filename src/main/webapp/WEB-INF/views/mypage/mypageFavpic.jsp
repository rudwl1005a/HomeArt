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
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<c:url value="/picShare/get" var="picBoardUrl"></c:url>
<c:url value="/masterpiece/get" var="masterpieceUrl"></c:url>

<title>HomeArt</title>
</head>
<body style="background-color: #333333">
<b:navBar></b:navBar>

<div class="contents-wrap">
	<div class="container">
		<div class="row">
			<div class="col">
				<h1 style="color: white; margin: 30px 0 20px 0">좋아요 누른 그림들</h1>
				<h3 style="color: white">그림공유게시판 좋아요 <i class="fas fa-heart" style="color: red"></i></h3>
				<div class="row" style="margin-bottom: 50px">
					<c:forEach items="${likePicture }" var="like">
						<a href="${picBoardUrl }?id=${like.board_id }">
							<img class="pic200" src="${staticUrl }/picShare/${like.board_id }/${like.file_name}" alt="${like.file_name }">
						</a>
					</c:forEach>
				</div>
				<h3 style="color: white">명화게시판 좋아요 <i class="fas fa-heart" style="color: red"></i></h3>
				<div class="row" style="margin-bottom: 50px">
					<c:forEach items="${likeMasterpiece }" var="like">
						<a href="${masterpieceUrl }?masterpiece_id=${like.board_id }">
							<img class="pic200" src="${staticUrl }/masterpiece/${like.board_id }/${like.file_name}" alt="${like.file_name }">
						</a>
					</c:forEach>				
				</div>
			</div>
		</div>
	</div>
	<b:bottomInfo></b:bottomInfo>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>