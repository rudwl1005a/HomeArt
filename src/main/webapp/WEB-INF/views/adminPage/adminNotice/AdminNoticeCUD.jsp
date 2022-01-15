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
    
    a {
	  color: black;
  }
  	a:hover {
  	color: black;
  	text-decoration: none;
  	}
	  
}
</style>

</head>
<body>
	 <div class="container-fluid">
        <div class="row" style="background-color: rgb(179, 177, 178)">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="/controller/">HomeArt</a>
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
                <a href="/controller/adminPage/adminNotice/register" class="btn">공지생성</a>
            </div>
        </div>

        <div class="row mt-3 mb-3">
    		 <c:forEach items="${list}" var="list">
            <div class="col-md-2"">
               <div class="card" style="width: 15rem;">
                    <img src="https://i.imgur.com/ZTkt4I5.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${list.admin_id}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">
                        <a href='/controller/adminPage/adminNotice/get?admin_no=<c:out value="${list.admin_no}"/>'>
                        ${list.admin_title}</a></h6>
                        <p class="card-text">
                        <a href='/controller/adminPage/adminNotice/get?admin_no=<c:out value="${list.admin_no}"/>'>
                        ${fn:substring(list.admin_content,0,10)}...</a></p>
                        <a href="/controller/adminPage/adminNotice/modify?admin_no=<c:out value='${list.admin_no}'/>" class="btn mr-2"><i class="fas fa-link"></i> 글 수정</a>
                        <div class="card-footer">${list.admin_date}</div>
                    </div>
                </div>
            </div>
		      </c:forEach>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	  <script>
        $(document).ready(function () {
            $('nav, .dropdown-menu').css('background-color', '#b3b1b2');
            $('li>a, li>div>a').css('color', '#fff');
            $('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn').css('color', '#fff');
            $('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn').css('border-color', '#fff');
        });
    </script>
</body>
</html>