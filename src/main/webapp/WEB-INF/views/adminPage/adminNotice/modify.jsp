<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
</head>

<style>
body {
	background: rgb(71, 66, 63) !important;
}
</style>
<body>
	<div class="row mb-3" style="background-color: rgb(179, 177, 178)">
		<div class="col">
			<nav class="navbar navbar-expand-lg navbar-light">
				<a class="navbar-brand" href="#">HomeArt</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active">
							<a class="nav-link" href="#">
								홈아트
								<span class="sr-only">(current)</span>
							</a>
						</li>

						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false"> 작가그림공유 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">공유게시판</a>

								<a class="dropdown-item" href="#">그림승인</a>
							</div>
						</li>

						<li class="nav-item active">
							<a class="nav-link" href="#">
								명화게시판
								<span class="sr-only">(current)</span>
							</a>
						</li>

						<li class="nav-item active">
							<a class="nav-link" href="#">
								자유게시판
								<span class="sr-only">(current)</span>
							</a>
						</li>

						<li class="nav-item active">
							<a class="nav-link" href="#">
								공지사항
								<span class="sr-only">(current)</span>
							</a>
						</li>

						<li class="nav-item active">
							<a class="nav-link" href="#">
								카테고리
								<span class="sr-only">(current)</span>
							</a>
						</li>

						<li class="nav-item active">
							<a class="nav-link" href="#">
								회원관리
								<span class="sr-only">(current)</span>
							</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<div class="row">
		<div class="col" style="background-color: rgb(132, 151, 143);">
			<form role="form" action="/controller/adminPage/adminNotice/modify?admin_no=<c:out value='${notice.admin_no}'/>" method="post">
				<h4>제목</h4>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">글제목</span>
					</div>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="admin_title" value="${notice.admin_title}">
				</div>
				<h4>작성자</h4>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">관리자ID</span>
					</div>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="admin_id" value="${notice.admin_id}">
				</div>
				<h4>파일</h4>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name="admin_file" value="${notice.admin_file}">
						<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">
						<h4>내용</h4>
					</label>
					<textarea class="form-control" rows="20" name="admin_content"><c:out value="${notice.admin_content}" /></textarea>
				</div>
				<button data-oper="modify" type="submit" class="btn">수정완료</button>
				<button data-oper="remove" type="submit" class="btn" data-target="#exampleModal" data-toggle="modal">
				삭제하기</button>
				<button data-oper="list" class="btn">리스트</button>
			</form>
		</div>
	</div>
	
    <div class="modal" tabindex="-1" id="exampleModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>게시물이 삭제되었습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn-alert">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			var formObj = $("form");
				
			$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'list') {
					self.location = "/controller/adminPage/adminNotice/AdminNoticeCUD";
				} else if(operation === 'remove') {
					formObj.attr("action", "/controller/adminPage/adminNotice/remove?admin_no=<c:out value='${notice.admin_no}'/>")
					return;
				}
				formObj.submit();
			});	
			
		});
	</script>
</body>
</html>