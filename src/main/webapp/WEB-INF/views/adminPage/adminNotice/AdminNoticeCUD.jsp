<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ca" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>

<style>
 body {
        background: rgb(71, 66, 63) !important;
    }

    .card {
        margin-left: 10%;
        margin-right: 10%;
    }

    h4 {
        color: rgb(82, 117, 120);
    }
</style>

</head>
<body>
	 <div class="container-fluid">
        <div class="row" style="background-color: rgb(179, 177, 178)">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="#">HomeArt</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">홈아트 <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-expanded="false">
                                    작가그림공유
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">공유게시판</a>

                                    <a class="dropdown-item" href="#">그림승인</a>
                                </div>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="#">명화게시판 <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="#">자유게시판 <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="#">공지사항 <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="#">카테고리 <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="#">회원관리 <span class="sr-only">(current)</span></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-3">
                <button class="btn" data-target="#collapse1" data-toggle="collapse">공지 생성</button>
            </div>
        </div>

        <div class="row mt-3 mb-3">
            <div class="col" style="background-color: rgb(173, 166, 146);">
                <div id="carouselExample" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="card-group d-flex justify-content-around">
                            <c:forEach items="${list}" var="list">
                                <div class="card border-success mr-3" style="max-width: 18rem;" type="button"
                                    data-target="#collapse1" data-toggle="collapse">
                                    <div class="card-header bg-transparent border-success">${list.admin_id}의 공지</div>
                                    <div class="card-body text-success">
                                        <h5 class="card-title">${list.admin_title}</h5>
                                        <p class="card-text">${fn:substring(list.admin_content,0,10)}...</p>
                                    </div>
                                    <div class="card-footer bg-transparent border-success">${list.admin_date}</div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-target="#carouselExample" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-target="#carouselExample" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col" style="background-color: rgb(132, 151, 143);">
            <div class="collapse" id="collapse1">
                <form role="form" action="/controller/adminPage/adminNotice/AdminNoticeCUD" method="post">
                    <h4>제목</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text" id="inputGroup-sizing-default">글제목</span>
                        </div>
                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                        name="admin_title">
                      </div>
                    <h4>파일</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                        </div>
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
                          name="admin_file">
                          <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                        </div>
                      </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"><h4>내용</h4></label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10"
                        name="admin_content"></textarea>
                    </div>
                    <input type="submit" class="btn" value="입력완료" style="color: white;">
                    <input type="submit" class="btn" value="삭제하기" style="color: white;">
                </form>
            </div>
        </div>
    </div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	  <script>
        $(document).ready(function (e) {
            $('nav, .dropdown-menu').css('background-color', '#b3b1b2')
        });

        $(document).ready(function () {
            $('li>a, li>div>a').css('color', '#fff')
        });

        $(document).ready(function () {
            $('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn').css('color', '#fff')
        });

        $(document).ready(function () {
            $('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn').css('border-color', '#fff')
        });

        $(document).ready(function () {
            $('.btn-toolbar>.btn-group>.card>.btn').css('background-color', '#b3b1b2')
        });
    </script>
</body>
</html>