<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 이미지 테스트 (나중에삭제) -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<style>
.logo2 {
	padding-left: 30px;
	padding-top: 10px;
	width: 120px;
	height: 80px;
	vertical-align: center;
}

.white-text {
	text-color: #FFFFFF;
}

</style>

<hr>

<div class="row" style="width: 100%; margin-bottom: 10px;">
	
	<span><img class="logo2" src="<spring:url value='/resources/img/bottomlogo.jpg'/>" height="100px"></span>
	<div class="col">
		<div class="white-text">
			<div> <i class="far fa-copyright"></i> HomeArt </div>
			<div> <i class="fas fa-user-circle"></i> 민경대, 강성빈, 김원표, 김재헌, 정시윤 </div>
			<div> <i class="fas fa-info-circle"></i> INFP*3 ENFP ISFP / A1O4 / M3W2 </div>
			<a href="https://github.com/rudwl1005a/HomeArt" style="color: black; text-decoration-line: none"> <i class="fab fa-github"></i> https://github.com/rudwl1005a/HomeArt </a>
		</div>
	</div>
	
</div>


