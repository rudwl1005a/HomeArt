<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 이미지 테스트 (나중에삭제) -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<style>
.logo2 {
	padding-left: 30px;
}

.white-text {
	text-color: #FFFFFF;
}

</style>

<hr>

<div class="row" style="width: 100%; margin-bottom: 10px;">
	
	<span class="logo2"><img src="<spring:url value='/resources/img/logo3.jpg'/>" height="100px"></span>
	<div class="col">
		<div class="white-text">
			<div> ⓒHomeArt </div>
			<div> (Developer : 민경대, 강성빈, 김원표, 김재헌, 정시윤) </div>
		</div>
	</div>
	
</div>


