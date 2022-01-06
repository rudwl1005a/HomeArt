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
  <div class="container-fluid">
        <div class="row mb-3">
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

        <div class="row">
            <div class="col-3">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="회원ID" aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn" type="button">찾기</button>
                    </div>
                  </div>
                <h4>
                    회원목록
                </h4>
                <div class="input-group">
                    <textarea class="form-control" aria-label="With textarea" rows="20"></textarea>
                </div>
            </div>

            <div class="col-5 align-self-center justify-content-center">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                  </div>

                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-default">회원ID</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                  </div>

                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-default">닉네임</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                  </div>

                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                  </div>

                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-default">회원 밴</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                    placeholder="사유 입력">
                    <div class="input-group-append">
                        <button class="btn" type="button">제출하기</button>
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
        
    <script>
    $(document).ready(function (e) {
        $('nav, .dropdown-menu').css('background-color', '#b3b1b2')
    });

    $(document).ready(function () {
        $('li>a, li>div>a').css('color', '#fff')
    });
    </script>
</body>
</html>