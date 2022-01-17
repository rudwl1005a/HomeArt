<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="${pageContext.request.contextPath}/resources/css/freeBoard/get.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function() {
	/* 삭제버튼 기능 */
	$(".removeSubmitButton").click(function(e) {
		e.preventDefault(); //기본동작진행하지 않도록 함.
		if(confirm("정말 삭제 하시겠습니까?")){
			$("#modifyForm").attr("action", "remove").submit();
		}
	});
	
	/* textarea 글자수에따른 자동 높이 조절*/
	$('.replyText').keyup(function(e){
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
	 });
	
	/* 글자수 체크(제한) */
	$('.replyText').on('keyup', function() {
        $('.reply_cnt').html("("+$(this).val().length+" / 500)");
 
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            $('.reply_cnt').html("(500 / 500)");
        }
    });
	
	/* 댓글 */
	//root 경로
	const appRoot = "${pageContext.request.contextPath}";
	
	//현재 게시물의 댓글 목록 가져오기
	const listReply = function(){
		$("#ReplyList").empty();
		$.ajax({
			url : appRoot + "/reply/freeBoard/${freeBoard.board_id}",
			success : function(list){
				for(let i = 0; i < list.length; i++){
					const replyMediaObject = $(`
					<div class="reply-box">
						<div class="media">
							<div class="media-body">
								<h6 class="mt-0">
									<i class="fas fa-caret-right"></i> 
							    	<span class="reply-nickName"></span>
								</h6>
								
								<p class="reply-body" style="white-space: pre;"></p>
								
								<div class="reply-group ReplyBox" style="display: none;">
									<span class="reply-nickName" style="font-weight: 600;"></span>
									<div class="reply_cnt">0 / 500</div>
									<textarea id="reply\${list[i].id}" class="replyText"></textarea>
									<div class="float-right" style="margin-top: -30px;">
										<button class="btn btn btn-light cancel-button" style="font-size: 13px; padding: 5px 8px;">취소</button>
										<button class="btn btn btn-light" id="sendReply\${list[i].id}" style="font-size: 13px; padding: 5px 8px;">수정</button>
									</div>
								</div>
								
								<div class="reply-button-container"></div>
							</div>
						</div>
					<div>`);
					
					replyMediaObject.find("#sendReply" + list[i].id).click(function(e){
						e.preventDefault();
						const reply = replyMediaObject.find("#reply" + list[i].id).val();
						const data = {
								reply : reply
						};
						
						$.ajax({
							url : appRoot + "/reply/" + list[i].id,
							type : "put",
							contentType : "application/json",
							data : JSON.stringify(data),
							complete : function(){
								listReply();
							}
						});
					});
					
					/* textarea 글자수에따른 자동 높이 조절*/
					replyMediaObject.find('.replyText').keyup(function(e){
						$(this).css('height', 'auto');
						$(this).height(this.scrollHeight);
					 });
					
					/* 글자수 체크(제한) */
					replyMediaObject.find('.replyText').on('keyup', function() {
				        $('.reply_cnt').html("("+$(this).val().length+" / 500)");
				 
				        if($(this).val().length > 500) {
				            $(this).val($(this).val().substring(0, 500));
				            $('.reply_cnt').html("(500 / 500)");
				        }
				    });
					
					replyMediaObject.find(".reply-nickName").text(list[i].nickName);
					replyMediaObject.find(".reply-body").text(list[i].reply);
					replyMediaObject.find(".replyText").text(list[i].reply);
					replyMediaObject.find(".cancel-button").click(function(e){
						e.preventDefault();
						replyMediaObject.find(".mt-0").show();
						replyMediaObject.find(".reply-body").show();
						replyMediaObject.find(".reply-button-container").show();
						replyMediaObject.find(".reply-group").hide();
					});
					
					if(list[i].own){
						//본인이 작성한 것만 수정버튼 추가
						const Buttons = $(`
						<div class="float-right reply-button-container">
							<button class="btn btn-light modifyButton" style="font-size: 13px; padding: 5px 8px;">수정</button>
							<button class="btn btn-light removeButton" style="font-size: 13px; padding: 5px 8px;">삭제</button>
						</div>
								`);
						
						Buttons.find(".modifyButton").click(function(e){
							e.preventDefault();
							$(this).parent().parent().find('.mt-0').hide();
							$(this).parent().parent().find('.reply-body').hide();
							$(this).parent().parent().find(".reply-button-container").hide();
							$(this).parent().parent().find('.reply-group').show();
						});
						
						Buttons.find(".removeButton").click(function(e){
							e.preventDefault();
							if(confirm("댓글을 삭제하시겠습니까?")){
								$.ajax({
									url : appRoot + "/reply/" + list[i].id,
									type : "delete",
									complete : function(){
										listReply();
									}
								});
							}
						});
						
						replyMediaObject.find(".media-body").append(Buttons);
					}
					$("#ReplyList").append(replyMediaObject);
				}
			}
		});
	}
	
	//페이지 로딩 후 댓글 리스트 가져오는 함수 한번 실행.
	listReply();
	
	//댓글 전송
	$("#sendReply").click(function(e){
		e.preventDefault(); //기존의 form 안에있는 post기능 막기(#sendReply버튼이 form-post기능을 가진곳 안에 있음.)
		const reply = $("#reply").val();
		const memberId = '${sessionScope.loggedInMember.member_id}';
		const boardId = '${freeBoard.board_id}';
		
		const data = {
				reply : reply,
				member_id : memberId,
				board_id : boardId
		};
		
		$.ajax({
			url : appRoot + "/reply/write",
			type : "post",
			data : data,
			success : function(){
				//댓글창 reset
				$("#reply").val("");
			},
			error : function(){
				alert("댓글이 작성되지 않았습니다. 권한이 있는지 확인해주세요.");
			},
			complete : function(){
				//댓글 리스트 새로고침
				listReply();
			}
		});
	});
});

</script>
<title>HomeArt 자유게시판 글 조회</title>
</head>
<body>
<b:navBar></b:navBar>
<div class="contents-wrap">
<!-- 글 내용 -->
<div class="container">
		<div class="row">
			<div class="col" style="margin-bottom: 20px;">
				<div class="board-view">
					<form id="modifyForm" method="post" enctype="multipart/form-data">
						<div class="get-group">
							<input type="hidden" name="id" value="${freeBoard.board_id }">
							<!-- 글제목 -->
							<h2>${freeBoard.title }</h2>
							<div class="title-sub">
								<span>by ${freeBoard.nickName }</span>
								<span class="tsub">${freeBoard.boardInserted }</span>
								<c:if test="${sessionScope.loggedInMember.member_id eq freeBoard.writer }">
									<a class="tsub" href="modify?id=${freeBoard.board_id }">수정</a>
									<a class="removeSubmitButton tsub" href="">삭제</a>
								</c:if>
							</div>
						</div>
						<div class="get-group2">
							<!-- 글내용 -->
							<c:out value="${freeBoard.content }" escapeXml="false" ></c:out>
							<c:forEach items="${fileNames }" var="fileName">
								<div class="row">
									<div class="col">
										<img class="img-fluid" src="${staticUrl }/freeBoard/${freeBoard.board_id }/${fileName }" alt="${fileName }">
									</div>
								</div>
							</c:forEach>
						</div>
						
						<!-- 댓글 리스트 -->
						<div id="ReplyList"></div>
						
						<!-- 댓글 등록 -->
						<c:if test="${not empty sessionScope.loggedInMember }">
							<div class="Reply">
								<h5 style="font-weight: 550;">댓글</h5>
								<!-- 댓글 작성 textarea -->
								<div class="ReplyBox">
									<span class="reply-writer">${sessionScope.loggedInMember.nickName }</span>
									<div class="reply_cnt">0 / 500</div>
									<textarea id="reply" class="replyText" placeholder="댓글을 입력하세요."></textarea>
									<button class="btn btn btn-light" id="sendReply">등록</button>
								</div>
							</div>
						</c:if>
						
						<div class="get-buttons">
							<a class="btn btn-dark float-left" type="button" href="post">글쓰기</a>
							<div class="float-right">
								<button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/freeBoard/list'">목록</button>
								<c:if test="${sessionScope.loggedInMember.member_id eq freeBoard.writer }">
									<button class="btn btn-dark removeSubmitButton" type="button">삭제</button>
									<a href="modify?id=${freeBoard.board_id }" class="btn btn-dark" type="button">수정</a>
								</c:if>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


<!-- 페이지 이동 (자유게시판 다른 글들 표시)-->
<div class="container">
	<div class="row">
		<div class="col">
			
		</div>
	</div>
</div>
<b:bottomInfo></b:bottomInfo>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>