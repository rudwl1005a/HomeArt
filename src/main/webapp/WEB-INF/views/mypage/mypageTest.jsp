<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>
<!-- 이미지 테스트 (나중에삭제) -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<c:url value="/mypage" var="mypageUrl"></c:url>
<c:url value="/mypage/my_picture" var="mypicUrl"></c:url>
<c:url value="/mypage/favorite_picture" var="favpicUrl"></c:url>
<c:url value="/mypage/my_post" var="mypostUrl"></c:url>
<c:url value="/mypage/my_reply" var="myreplyUrl"></c:url>
<c:url value="/mypage/modify" var="modifyUrl"></c:url>
<c:url value="/freeBoard/get" var="freeBoardUrl"></c:url>
<c:url value="/picShare/get" var="picBoardUrl"></c:url>

<script>
	/* 답글 토글 */
	$(document).ready(function(){
		$(".guestbookReply").click(function(){
			var element = $(this).parent();
			var element2 = element.parent();
			element2.next().slideToggle("fast");
		});
		
		/* 모달 창 */
		if(history.state == null){
			$("#modal1").modal('show');
			history.replaceState({}, null);
		}
		/* 방명록 */
		/* contextPath */
	    const appRoot = '${pageContext.request.contextPath}';

	    /* 현재 게시물의 댓글 목록 가져오는 함수 */
		const listReply = function() {
			$("#replyListContainer").empty();
			$.ajax({
				url : appRoot + "/guestbook/${member_id}",
				success : function(list) {
					for (let i = 0; i < list.length; i++) {
						const replyMediaObject = $(`
							<c:forEach items="\${list }" var="guestbook">
								<div class="row guestbook">
									<c:if test="${guestbook.profile_file_name eq NULL }">
										<img class="pic40" src="\${staticUrl }/profile/basic_profile.jpg" class="img-thumbnail" alt="...">
									</c:if>
									<c:if test="\${guestbook.profile_file_name ne NULL }">
										<img class="pic40" src="\${staticUrl }/profile/\${guestbook.member_id}/\${guestbook.profile_file_name}" class="img-thumbnail" alt="...">
									</c:if>
									<a class="guestbookContent" href="\${mypageUrl }?member_id=\${guestbook.member_id }">\${guestbook.member_id }</a>
									<p class="guestbookContent">　　</p>
									<p class="guestbookContent">\${guestbook.content }</p>
									<div class="guestbookButton ml-auto">
										<span class="guestbookModify">수정</span>
										<span class="guestbookDelete">삭제</span>
										<span class="guestbookReply">답글</span>
									</div>
								</div>

							</c:forEach>
						`)
				 	}
				}
			});
	    }
	});
</script>

<title>${member.member_id}'s MyPage</title>
</head>
<body>
<b:navBar></b:navBar>
<div class="contents-wrap">
	<div class="container" style="max-width: 900px;">
		<div class="row">
			<div class="col">
				<!-- 회원 정보 -->
				<div class="row memberInfo">
					<c:choose>
					<c:when test="${sessionScope.loggedInMember.member_id == member.member_id }">
						<c:if test="${isProfile == true }">						
							<img src="${staticUrl }/profile/${member.member_id}/${profile.profile_file_name}" class="profilepic">
						</c:if>
						<c:if test="${isProfile == false }">
							<img src="${staticUrl }/profile/basic_profile.jpg" class="profilepic">
						</c:if>
						<div class="col" style="padding-left: 20px;">
							<div class="row" style="padding-left: 15px;">
								<div style="font-weight: bold;"><i class="fas fa-info-circle" style="color: rgb(173, 166, 146);"></i> MyInfo</div>
								<a class="memberModify" href="${modifyUrl }?member_id=${sessionScope.loggedInMember.member_id }"> edit </a>
							</div>
							<div>아이디 : ${sessionScope.loggedInMember.member_id }</div>
							<div>이　름 : ${sessionScope.loggedInMember.member_name }</div>
							<div>닉네임 : ${sessionScope.loggedInMember.nickName }</div>
							<div>국　가 : ${sessionScope.loggedInMember.country }</div>
							<div>이메일 : ${sessionScope.loggedInMember.email }</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${isProfile == true }">						
							<img src="${staticUrl }/profile/${member.member_id}/${profile.profile_file_name}" class="profilepic">
						</c:if>
						<c:if test="${isProfile == false }">
							<img src="${staticUrl }/profile/basic_profile.jpg" class="profilepic">
						</c:if>
						<div class="col">
							<div style="font-weight: bold;"><i class="fas fa-info-circle" style="color: rgb(173, 166, 146);"></i> ${member.member_id }'s Info</div>
							<div>이　름 : ${member.member_name }</div>
							<div>닉네임 : ${member.nickName }</div>
							<div>국　가 : ${member.country }</div>
							<div>이메일 : ${member.email }</div>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
				
				<hr style="margin-bottom:30px">
				<!-- 방명록 -->
				<h2> ${member.nickName }님의 방명록 </h2>
				<div class="gusetbookWrap"></div>
				<c:forEach items="${list }" var="guestbook">
					<div class="row guestbook">
						<c:if test="${guestbook.profile_file_name eq NULL }">
							<img class="pic40" src="${staticUrl }/profile/basic_profile.jpg" class="img-thumbnail" alt="...">
						</c:if>
						<c:if test="${guestbook.profile_file_name ne NULL }">
							<img class="pic40" src="${staticUrl }/profile/${guestbook.member_id}/${guestbook.profile_file_name}" class="img-thumbnail" alt="...">
						</c:if>
						<a class="guestbookContent" href="${mypageUrl }?member_id=${guestbook.member_id }">${guestbook.member_id }</a>
						<p class="guestbookContent">　　</p>
						<p class="guestbookContent">${guestbook.content }</p>
						<div class="guestbookButton ml-auto">
							<span class="guestbookModify">수정</span>
							<span class="guestbookDelete">삭제</span>
							<span class="guestbookReply">답글</span>
						</div>
					</div>
					<div class="guestbookCommentWrap">
						<c:forEach items="${commentList }" var="guestbookComment">
							<c:if test="${guestbookComment.key == guestbook.guestbook_id}">
								<div class="col">
									<c:forEach items="${guestbookComment.value }" var="comment">
										<div class="row guestbookComment">
											<a class="guestbookCommentContent" href="${mypageUrl }?member_id=${comment.member_id }">${comment.member_id }</a>
											<p class="guestbookCommentContent">　　</p>
											<p class="guestbookCommentContent">${comment.content }</p>
											<div class="guestbookButton ml-auto">
												<span class="guestbookCommentModify">수정</span>
												<span class="guestbookCommentDelete">삭제</span>
											</div>						
										</div>
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
						<div class="input-group mb-3 guestbookCommentSubmit">
						  <input type="text" class="form-control" placeholder="답글을 작성해주세요. (최대 100자)" aria-label="답글" aria-describedby="guestbookComment">
						  <div class="input-group-append">
						    <button class="btn btn-dark" type="button" id="guestbookComment">작성</button>
						  </div>
						</div>
					</div>
				</c:forEach>
				
				<c:if test="${sessionScope.loggedInMember.member_id != member.member_id }">
					<div class="input-group mb-3 guestbookSubmit">
					  <input type="text" class="form-control" placeholder="방명록을 작성해주세요. (최대 100자)" aria-label="방명록" aria-describedby="guestbook">
					  <div class="input-group-append">
					    <button class="btn btn-dark" type="button" id="guestbook">작성</button>
					  </div>
					</div>
				</c:if>
				
				<hr style="margin-top:30px">
				<!-- 내 활동 -->
				<c:if test="${sessionScope.loggedInMember.member_id == member.member_id }">
					<div class="activeBox" style="margin-top: 30px;">
						<div class="row d-flex justify-content-between">
							<h3>내 그림들</h3>
							<a class="more" href="${mypicUrl }">..more</a>
						</div>
						<div class="row">
							<c:forEach items="${picBoardLimit5 }" var="picBoard">
								<a href="${picBoardUrl }?id=${picBoard.board_id }">
									<img class="pic150" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
								</a>
							</c:forEach>
						</div>
					</div>
					<div class="activeBox">
						<div class="row d-flex justify-content-between">
							<h3>좋아요 누른 그림</h3>
							<a class="more" href="${favpicUrl }">..more</a>
						</div>
						<div class="row">
							<img class="pic150" src="<spring:url value='/resources/img/logo.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic150" src="<spring:url value='/resources/img/logo1.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic150" src="<spring:url value='/resources/img/logo2.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic150" src="<spring:url value='/resources/img/logo3.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic150" src="<spring:url value='/resources/img/logo4.jpg'/>" class="img-thumbnail" alt="...">	
						</div>
					</div>
					<div class="activeBox">
						<div class="row d-flex justify-content-between">
							<h3>내가 쓴 글</h3>
							<a class="more" href="${mypostUrl }">..more</a>
						</div>
						<ul>
							<c:forEach items="${freeBoardLimit5 }" var="writing">
								<li><a href="${freeBoardUrl }?id=${writing.board_id}">${writing.title }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="activeBox">
						<div class="row d-flex justify-content-between">
							<h3>내 댓글</h3>
							<a class="more" href="${myreplyUrl }">..more</a>
						</div>
						<ul>
							<li>댓글댓글댓글1</li>
							<li>댓글댓글댓글2</li>
							<li>댓글댓글댓글3</li>
							<li>댓글댓글댓글4</li>
							<li>댓글댓글댓글5</li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<b:bottomInfo></b:bottomInfo>
	
		
	<!-- modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">결과</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>${result }</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</c:if>
			
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>
