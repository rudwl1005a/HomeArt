<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/resources/css/homeart.css"
	rel="stylesheet" type="text/css">

<title>Insert title here</title>
<style>
body {
	background-color: #222;
}


</style>
</head>
<body>


	<b:navBar></b:navBar>

	<div class="contents-wrap">

		<!-- Section -->
		<section class="py-5">
			<form method="post" enctype="multipart/form-data" id="modifyForm">
				<div class="container px-4 px-lg-8 my-5">
					<div class="row gx-4 gx-lg-5 align-items-center">
						
						<!-- fileUpload(left) -->
						<div class="form-group col-md-6">
							<div class="input-group mb-3">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="input-image" name="file">
									<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
								</div>
								<div class="input-group-append">
									<span class="input-group-text" id="inputGroupFileAddon02">Upload</span>
								</div>
							</div>
							<img class="card-img-top mb-5 mb-md-0" id="preview-image" src="${staticUrl }/masterpiece/${masterpiece.masterpiece_id }/${masterpiece.file_name }" alt="${masterpiece.file_name}">
						</div>
						<!-- artName, artist, artInfo (right) -->
						<div class="form-group col-md-6">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="TITLE"
									aria-describedby="button-addon2" name="title"
									value="${masterpiece.title }">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="button-addon2" name="artist"
									value="${masterpiece.artist }">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="button-addon2" name="country"
									value="${masterpiece.country }">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="button-addon2" name="age"
									value="${masterpiece.age }">
							</div>
							<div class="input-group mb-3"></div>
							<div>
								<div class="input-group-prepend"></div>
								<textarea class="form-control" aria-label="With textarea"
									style="resize: none;" rows="10"
									name="content" >${masterpiece.content }</textarea>
							</div>

							<div class="input-group mb-3">
							<input type="hidden" name="member_id" value="${sessionScope.loggedInMember.member_id }"> --%>
							</div>								<!-- // 세션 로그드인 멤버^ -->
						</div>
					</div>
				</div>
				<div class="container send-button" style="text-align: right;">
					<input type="hidden" name="masterpiece_id"
						value="${masterpiece.masterpiece_id }">
					<button class="btn btn-outline-danger" type="submit"
						id="removeSubmitButton">Delete</button>
					<button class="btn btn-outline-light" type="submit"
						id="modifySubmitButton">Modify</button> 		
				</div>
			</form>


		</section>


		<b:bottomInfo></b:bottomInfo>

	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>

	
	
<script>
		
// 버튼 클릭시 remove, modify  실행
$(document).ready(function() {
  $("#removeSubmitButton").click(function(e) {
    e.preventDefault(); // 기본 동작을 진행하지 않도록 함.
    $("#modifyForm").attr("action", "remove").submit();
  });

  $("#modifySubmitButton").click(function(e) {
    e.preventDefault();
    $("#modifyForm").attr("action", "modify").submit();
  });
  
});


//이미지 업로드시 미리보기
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});

</script>
</body>
</html>
