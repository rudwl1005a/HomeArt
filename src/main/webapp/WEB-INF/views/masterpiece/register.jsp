<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<title>Register</title>
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

			<form method="post" enctype="multipart/form-data">
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
							<img class="card-img-top mb-5 mb-md-0" id="preview-image" src="https://dummyimage.com/600X700/dee2e6/6c757d.jsp" alt="...">
						</div>

						<!-- artName, artist, artInfo (right) -->
						<div class="form-group col-md-6">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="TITLE" aria-describedby="button-addon2" name="title">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="ARTIST" aria-describedby="button-addon2" name="artist">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="COUNTRY" aria-describedby="button-addon2" name="country">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="AGE" aria-describedby="button-addon2" name="age">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend"></div>
								<textarea class="form-control" aria-label="With textarea" placeholder="ARTINFO" style="resize: none;" rows="10" name="content"></textarea>
							</div>
							
							<div class="input-group mb-3">
								<input type="hidden" name="member_id" value="${sessionScope.loggedInMember.member_id }">
							</div>
							
						</div>
					</div>
				</div>
				<div class="container send-button" style="text-align: right;">
					<button class="btn btn-outline-light" type="submit">Send</button>
				</div>
			</form>


		</section>


		<b:bottomInfo></b:bottomInfo>

	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
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
