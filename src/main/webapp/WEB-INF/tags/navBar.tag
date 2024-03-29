<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ attribute name="active" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&display=swap');

.logo {
	background-color: white;
	color: white;
	height: 115px;
	text-align: center;
}

.textlogo {
	font-size: 25pt;
	letter-spacing: 2px;
	color: white;
	text-shadow: 4px 4px 4px rgb(173, 166, 146);
	vertical-align: bottom;
	font-family: 'Hahmlet', serif;
}

.logopic {
	vertical-align: center;
	margin-top: 10px;
}

#topheader {
	border-style: solid none;
	border-width: 2px;
	background-color: white;
	padding-left: 100px;
}

.memberSign {
	padding-right: 20px;
}

.memberSign:link {
	color: black;
	text-decoration-line: none;
}

.memberSign:visited {
	color: black;
	text-decoration-line: none;
}
.memberSign:hover {
	color: black;
	text-decoration-line: none;
}

.memberSign:active {
	color: black;
	text-decoration-line: none;
}

.navbar-nav {
 	/*원래 nav기능 덮어씌움*/
	flex-direction : row;
}
li{
	padding : 0 10px;
}
</style>

<c:url value="/" var="mainUrl"></c:url>
<c:url value="/picShare/list" var="picShareUrl"></c:url>
<c:url value="/masterpiece/list" var="masterpieceUrl"></c:url>
<c:url value="/freeBoard/list" var="freeBoardUrl"></c:url>
<c:url value="/mypage" var="mypageUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/member/logout" var="logoutUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/adminPage/AdminMain" var="adminUrl"></c:url>

<div class="logo">
	<a href="${mainUrl }"><img class="logopic" src="<spring:url value='/resources/img/logo1.jpg'/>" height="100px"></a>
</div>
<nav class="navbar navbar-expand-lg navbar-light" id="topheader">
	<a class="navbar-brand" href="${mainUrl }" style="font-family: 'Hahmlet', serif;">HomeArt</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent" style="min-width: 610px;">
		<div class="w-100 d-flex justify-content-between">
			<div class="d-flex">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link ${active == 'picture' ? 'active' : '' }" href="${picShareUrl }">그림공유</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${active == 'masterpiece' ? 'active' : '' }" href="${masterpieceUrl }">명화추천</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${active == 'free' ? 'active' : '' }" href="${freeBoardUrl }">자유게시판</a>
					</li>
				</ul>
			</div>
			<div class="d-flex" style="padding-top: 8px;">
				<c:if test="${not empty sessionScope.loggedInMember }">	
					<div id="loggedInNickName" style="padding-right: 20px;">${sessionScope.loggedInMember.nickName }님</div>
				</c:if>
				<c:if test="${empty sessionScope.loggedInMember }">
					<div style="padding-right: 50px">
						<a class="memberSign" id="login" title="로그인" href="${loginUrl }">
							로그인
						</a>
						<a class="memberSign" id="signUp" title="회원가입" href="${signupUrl }">
							회원가입
						</a>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.loggedInMember }">	
					<c:if test="${sessionScope.loggedInMember.isAdmin == 1 }">
						<a class="memberSign" id="admin" title="관리자 페이지" href="${adminUrl }">
							관리자 페이지
						</a>
					</c:if>
					<a class="memberSign" id="mypage" title="마이페이지" href="${mypageUrl }?member_id=${sessionScope.loggedInMember.member_id}">
						마이페이지
					</a>
					<a class="memberSign" id="logout" title="로그아웃" href="${logoutUrl }">
						로그아웃
					</a>
				</c:if>
			</div>
		</div>
	</div>
</nav>

