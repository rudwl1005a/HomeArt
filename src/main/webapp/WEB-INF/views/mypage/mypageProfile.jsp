<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<c:url value="/mypage?member_id=${sessionScope.loggedInMember.member_id }" var="mypageUrl"></c:url>

<title>Profile Picture Edit</title>
</head>
<body>
<b:navBar></b:navBar>
<div class="contents-wrap">
	<!-- Section -->
	<section class="py-5">
		<form method="post" enctype="multipart/form-data">
			<div class="container px-4 px-lg-8 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="form-group col-md-6">
						<div class="input-group mb-3">
							<div class="custom-file image-container">
								<input type="file" name="file" class="custom-file-input input-image" id="inputGroupFile02">
								<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file..</label>
							</div>
								<c:if test="${isProfile == false }">
									<img class="card-img-top mb-5 mb-md-0" id="preview-image" src="${staticUrl }/profile/basic_profile.jpg" alt="basic_profile">
								</c:if>
								<c:if test="${isProfile == true }">
									<img class="card-img-top mb-5 mb-md-0" id="preview-image" src="${staticUrl }/profile/${loggedInMember.member_id}/${profile.profile_file_name}" alt="basic_profile">
								</c:if>
						</div>			
					</div>
				</div>
			</div>
			<div class="container send-button" style="text-align: right;">
				<button class="btn btn-dark" type="submit">등록</button>
				<a href="${mypageUrl }" class="btn btn-dark">취소</a>
			</div>
		</form>
	</section>
	
	<b:bottomInfo></b:bottomInfo>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		// Add the following code if you want the name of the file appear on select
		// Choose File 에 fileName 얻어온 것을 적어줌.
		$(".custom-file-input").on("change", function() {
			var fileName = $(this).val().split("\\").pop();
			$(this).siblings(".custom-file-label").addClass("selected")
				.html(fileName);
		});
		
		// 업로드한 파일 미리 보여주기.
		function readImage(input) {
			if(input.files && input.files[0]) {
				const reader = new FileReader()
				reader.onload = e => {
					const previewImage = document.getElementById("preview-image")
					previewImage.src = e.target.result
				}
				reader.readAsDataURL(input.files[0])
			}
		}
		
		const inputImage = document.getElementById("inputGroupFile02")
		inputImage.addEventListener("change", e => {
			readImage(e.target)
		});

	</script>

</body>
</html>
