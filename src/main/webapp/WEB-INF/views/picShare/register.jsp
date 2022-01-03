<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>Register</title>
<style>
body {
	background-color: rgb(71, 66, 63);
}

header, footer {
	background-color: rgb(179, 177, 178);
}
.send-button{
	text-align: right;
}
</style>
</head>
<body>


		<!-- Header-->
		<header class="py-5">
				<div class="container px-4 px-lg-5 my-4">
						<div class="text-center text-black">
								<h1 class="display-4 fw-bolder">art register header</h1>
								<p class="lead fw-normal text-rgb-71,66,63 mb-0">picShareBoard(명화와 같이 카테고리화 해서 올릴지도 결정/따로 해도 됨.)</p>
						</div>
				</div>
		</header>

		<!-- Section -->
		<section class="py-5">

				<div class="container px-4 px-lg-8 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">

								<!-- file Upload (left) -->
								<div class="col-md-6">
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

								<!-- artName, artist (right) -->
								<div class="col-md-6">
										<div class="input-group mb-3">
												<input type="text" class="form-control" placeholder="artName" aria-describedby="button-addon2">
												<div class="input-group-append">
														<button class="btn btn-outline-secondary" type="button" id="button-addon2">Send</button>
												</div>
										</div>
										<div class="input-group mb-3">
												<input type="text" class="form-control" placeholder="artist" aria-describedby="button-addon2">
												<div class="input-group-append">
														<button class="btn btn-outline-secondary" type="button" id="button-addon2">Send</button>
												</div>
										</div>
										<!-- artInfo (right) -->
										<div class="input-group mb-3">
												<div class="input-group-prepend"></div>
												<textarea class="form-control" aria-label="With textarea" placeholder="artinfo" style="resize: none;" rows="10"></textarea>
												<div class="input-group-append">
														<button class="btn btn-outline-secondary" type="button" id="button-addon2">Send</button>
												</div>
										</div>
										
										<!--  send 를 오른쪽으로 보내고 싶은데 어떻게 할지 생각중. -->
										<div class="px-0 send-button">
												<button class="btn btn-secondary" type="submit">Send</button>
										</div>
								</div>
						</div>
				</div>


		</section>


		<!-- Footer-->
		<footer class="py-5 bg-light">
				<div class="container">
						<p class="m-0 text-center text-black">@homeart</p>
				</div>
		</footer>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>