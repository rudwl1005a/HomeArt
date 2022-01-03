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
        span {
            color: rgb(173, 166, 146);
        }

        body {
            background: rgb(71, 66, 63) !important;
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
           
            <div class="col-4">
                <div class="card">
                    <div class="card-header">
                        포인트
                    </div>

                    <div class="card-body">
                        <h5 class="card-text">회원</h5>
                        
                        <span><input type="text"></span>
                        <p class="card-text">현재 포인트</p>
                        <input type="text">
                        <p class="card-text">포인트 수정 사유</p>
                        <textarea class="form-control" name="" id="" cols="10" rows="10"></textarea>
                        <input type="submit" class="btn" value="전송"> 
                    </div>
                </div>
            </div>
           
            <div class="col-5">
                <div class="card">
                    <div class="card-header">
                        회원 밴
                    </div>

                    <div class="card-body">
                        <h5 class="card-text">회원</h5>
                        <select name="" id="" >
                            <option value="1" selected>회원ID</option>
                            <option value="2" >본문</option>
                        </select>
                        <span><input type="text"></span>
                        <p class="card-text">현재 상태</p>
                        <input type="text">
                        <p class="card-text">정지 사유</p>
                        <textarea class="form-control" name="" id="" cols="10" rows="10"></textarea>
                        <input type="submit" class="btn" value="전송"> 
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
</body>
</html>