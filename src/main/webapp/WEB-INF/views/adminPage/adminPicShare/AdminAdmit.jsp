<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" rel="stylesheet"
        crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title></title>

 	<style>
        body { background: rgb(71, 66, 63) !important; }
        .fixed1 {
            width: 50px;
        }
        span {
            color: rgb(173, 166, 146);
        }

        h4 {
            color: white;
        }

        .btn {
            color: rgb(223, 223, 223);
        }
    </style>

</head>
<body>
	<div class="container-lg">
        <div class="row">
            <div class="col-3">
                <nav class="navbar navbar-light">
                    <a class="navbar-brand" href="#">
                        <a href="HomePageActivation.html">
                            <img src="HomeArt.jpg" width="30" height="30" class="d-inline-block align-top">
                        </a>
                        <span>카테고리</span>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button"
                                        data-toggle="dropdown" aria-expanded="false" href="#">
                                        <span>작가그림공유 편집</span></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">그림공유 편집</a>
                                        <a class="dropdown-item" href="#">그림 승인</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button"
                                        data-toggle="dropdown" aria-expanded="false" href="#">
                                        <span>명화 편집</span></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">명화 편집</a>
                                        <a class="dropdown-item" href="#">댓글 편집</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button"
                                        data-toggle="dropdown" aria-expanded="false" href="#">
                                        <span>자유게시판 편집</span></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">게시판 편집</a>
                                        <a class="dropdown-item" href="#">댓글 편집</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="navbarDropdownMenuLink1" role="button" aria-expanded="false"
                                        href="#"><span>공지사항</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="navbarDropdownMenuLink1" role="button" aria-expanded="false"
                                        href="#"><span>카테고리 편집</span></a>

                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" role="button"
                                        data-toggle="dropdown" aria-expanded="false" href="#">
                                        <span>회원 관리</span></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">포인트 관리</a>
                                        <a class="dropdown-item" href="#">회원 차단 관리</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </a>
                </nav>
            </div>
            <div class="col-9">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="background.png" class="d-block w-100" alt="그림 여기에">
                        </div>
                    </div>
                </div>

                <div class="d-flex">
                    <div class="input-group mb-3">
                        <div class="mr-auto p-1">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">@</span>
                                <input type="text" class="form-sm-control fixed1" readonly placeholder="추천"
                                    aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                        </div>

                        <div class="p-1">
                            <div class="input-group-append" id="button-addon4">
                                <button class="btn btn-outline" type="button">승인</button>
                                <button class="btn btn-outline" type="button" data-toggle="collapse"
                                    data-target="#collapse" aria-expanded="false" aria-controls="collapse">거절</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="collapse" id="collapse">
                    <form action="">
                        <h4>거절 사유를 입력해주세요</h4>
                        <input type="textarea" class="form-control">
                        <input type="submit" class="btn" value="입력완료">
                    </form>
                </div>

 <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <script>

            </div>
        </div>
    </div>
</body>
</html>