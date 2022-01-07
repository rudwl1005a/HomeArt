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


<title>Modify</title>
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
									<input type="file" class="custom-file-input" id="inputGroupFile02">
									<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
								</div>
								<div class="input-group-append">
									<span class="input-group-text" id="inputGroupFileAddon02">Upload</span>
								</div>
							</div>
							<img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600X700/dee2e6/6c757d.jsp" alt="...">
						</div>

						<!-- artName, artist, artInfo (right) -->
						<div class="form-group col-md-6">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="artName" aria-describedby="button-addon2">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="artist" aria-describedby="button-addon2">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend"></div>
								<textarea class="form-control" aria-label="With textarea" placeholder="artinfo" style="resize: none;" rows="10"></textarea>
							</div>

						</div>
					</div>
				</div>
				
				<div class="container send-button" style="text-align: right;">
					<button class="btn btn-outline-danger" type="submit">Delete</button>
					<button class="btn btn-outline-light" type="submit">Modify</button>
				</div>
			</form>


		</section>
		
		<b:bottomInfo></b:bottomInfo>

	</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>