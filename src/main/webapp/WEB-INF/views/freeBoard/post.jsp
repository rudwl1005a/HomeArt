<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="${pageContext.request.contextPath}/resources/css/freeBoard/post.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/freeboard.js"></script>
<title>HomeArt</title>
</head>
<body>
<b:navBar></b:navBar>
	<div class="container">
		<div class="row">
			<div class="col">
				<form method="post" enctype="multipart/form-data">
					<div class="post-group">
						<textarea class="post-title" name="title" placeholder="제목을 입력하세요" required></textarea>
						<div class="float-right" id="post_cnt">(0 / 100)</div>
					</div>
					<div class="post-group2">
						<textarea id="summernote" name="content"></textarea>   
					</div>
					<div class="post-group">
						<input type="file" class="form-control-file" id="file-Button" name="files" accept="image/*" multiple>
					</div>
					<div class="switch switch--horizontal">
						<input class="inputBox" id="radio-a" type="radio" name="isPublic" value="0">
						<label for="radio-a">비공개</label>
						<input class="inputBox" id="radio-b" type="radio" name="isPublic" checked="checked" value="1">
						<label for="radio-b">공개</label>
						<span class="toggle-outside">
							<span class="slider toggle-inside"></span>
						</span>
					</div>
					<div class="float-right">
						<button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/freeBoard/list'">목록</button>
						<input type="hidden" name="writer" value="${sessionScope.loggedInMember.member_id }">
						<button class="btn btn-dark" type="submit">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>