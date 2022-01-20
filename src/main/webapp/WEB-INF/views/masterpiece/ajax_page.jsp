<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:forEach items="${list }" var="m">

<script>
	$("#removeSubmitButton${m.masterpiece_id }").click(function(e) {
    		e.preventDefault(); // 기본 동작을 진행하지 않도록 함.
    $("#modifyForm${m.masterpiece_id }").attr("action", "remove").submit();
  });
</script>
</c:forEach> --%>

<c:forEach items="${list }" var="m">

	<form id="modifyForm${m.masterpiece_id }" method="post" enctype="multipart/form-data">
		<div class="col mb-5">
			<div class="card h-100" id="card${m.masterpiece_id }">
				<c:if test="${sessionScope.loggedInMember.member_id eq m.member_id}">
					<!-- dropdown -->
					<div class="dropdown" id="dropdown${m.masterpiece_id }" name="masterpiece_id">
						<button
							class="btn btn-outline-light dropdown-toggle position-absolute badge"
							style="top: 0.5rem; right: 0.5rem;" type="button"
							data-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item"
								href="modify?masterpiece_id=${m.masterpiece_id }">modify</a> 
					<input type="hidden" value="${m.masterpiece_id }" name="masterpiece_id">
								<a
								class="dropdown-item" id="removeSubmitButton${m.masterpiece_id }"
								type="button">delete</a>
						</div>
					</div>
				</c:if>


				<!-- HOT badge -->
				<!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div> -->
				<!-- Product image-->
				<img class="card-img-top"
					src="${staticUrl }/masterpiece/${m.masterpiece_id }/${m.file_name }"
					alt="${m.file_name }">
				<!-- Product details-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- 작품 이름-->
						<h5 class="fw-bolder titleName">${m.title }</h5>
						<!-- text-warning이 글씨의 색깔을 나타냄. -->
						<!-- 작가 이름 -->
						<div class="d-flex justify-content-center small text-dark mb-2">
							<div class="bi-star-fill">작가 : ${m.artist }</div>
						</div>
						<!-- 작품 나라 -->
						<div class="d-flex justify-content-center small text-dark mb-2">
							<div class="bi-star-fill">나라 : ${m.country }</div>
						</div>
						<!-- 작품 시대 -->
						<div class="d-flex justify-content-center small text-dark mb-2">
							<div class="bi-star-fill">시대 : ${m.age }</div>
						</div>
					</div>
				</div>
				<!-- Product actions-->
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark mt-auto"
							href="get?masterpiece_id=${m.masterpiece_id }">Go art</a>
						<%-- <span class="text-muted text-decoration-line-through" id="updateLike">${m.likeSu}</span> --%>
						<button id="likeBtn${m.masterpiece_id }" class="btn btn-dark"
							type="button"
							onclick="updateLike('${m.masterpiece_id }','${sessionScope.loggedInMember.member_id }')">좋아요
							${m.likeSu }</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</c:forEach>

<c:forEach items="${list }" var="m">
<script>
/* $(document).ready(function () {
	$("#removeSubmitButton${m.masterpiece_id }").click(function(e) {
		
		console.log("click");
   		e.preventDefault(); // 기본 동작을 진행하지 않도록 함.
   		if(confirm("정말 삭제하시겠습니까?")) {
   			
		   $("#modifyForm${m.masterpiece_id }").attr("action", "remove").submit();
		   console.log("clean");
   		}
 });
	
}); */

$(document).ready(function() {
	  $("#removeSubmitButton${m.masterpiece_id }").click(function(e) {
	    e.preventDefault(); // 기본 동작을 진행하지 않도록 함.
	    if(confirm("정말 삭제하시겠습니까?2222")) 
	    $("#modifyForm${m.masterpiece_id }").attr("action", "remove").submit();
	  });
});
</script>
</c:forEach>










