<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/resources/css/homeart.css"
	rel="stylesheet" type="text/css">

<script>
  $(document).ready(function() {
    /* contextPath */
    const appRoot = '${pageContext.request.contextPath}';

    /* 현재 게시물의 댓글 목록 가져오는 함수 */
    const listReply = function() {
      $("#discussionListContainer").empty();
      $.ajax({
        url : appRoot + "/discussion/masterpiece/${masterpiece_id.discussion_id}",
        success : function(list) {
          for (let i = 0; i < list.length; i++) {
            const discussionMediaObject = $(`
            		<hr>
                  <div class="media">
                    <div class="media-body">
                      <h5 class="mt-0"><i class="far fa-comment"></i>
                      <span class="discussion-nickName"></span>
                    	가 \${list[i].customInserted}에 작성</h5>
                      <p class="discussion-body" style="white-space: pre;"></p>
                    
                      <div class="input-group" style="display:none;">
                	    <textarea name="" id="discussionTextarea\${list[i].id}" class="form-control"></textarea>
                	    <div class="input-group-append">
                	      <button class="btn btn-outline-secondary cancel-button"><i class="fas fa-ban"></i></button>
                  		  <button class="btn btn-outline-secondary" id="sendReply\${list[i].id}"><i class="far fa-comment-dots fa-lg"></i></button>
                	    </div>
                      </div>
                    </div>
                  </div>`);
            
            replyMediaObject.find("#sendDiscussion" + list[i].id).click(function() {
              const discussion = discussionMediaObject.find("#discussionTextarea" + list[i].id).val();
              const data = {
            		  discussion : discussion
              };
              
              $.ajax({
                url : appRoot + "/discussion/" + list[i].id,
                type : "put",
                contentType : "application/json",
                data : JSON.stringify(data),
                complete : function() {
                  listDiscussion();
                }
              });
            });
            
            discussionMediaObject.find(".discussion-nickName").text(list[i].nickName);
            discussionMediaObject.find(".discussion-body").text(list[i].discussion);
            discussionMediaObject.find(".form-control").text(list[i].discussion);
            discussionMediaObject.find(".cancel-button").click(function() {
            	discussionMediaObject.find(".discussion-body").show();
            	discussionMediaObject.find(".input-group").hide();
            });
            
            if (list[i].own) {
              // 본인이 작성한 것만 
              // 수정버튼 추가
              const modifyButton = $("<button class='btn btn-outline-secondary'><i class='far fa-edit'></i></button>");
              modifyButton.click(function() {
                $(this).parent().find('.discussion-body').hide();
                $(this).parent().find('.input-group').show();
              });
              
              discussionMediaObject.find(".media-body").append(modifyButton);
              
              // 삭제버튼 추가
              const removeButton = $("<button class='btn btn-outline-danger'><i class='far fa-trash-alt'></i></button>");
              removeButton.click(function() {
                if (confirm("삭제 하시겠습니까?")) {
                  $.ajax({
                    url : appRoot + "/discussion/" + list[i].id,
                    type : "delete",
                    complete : function() {
                      listDiscussion();
                    }
                  });
                }
              });
              
              discussionMediaObject.find(".media-body").append(removeButton);
            }
            
            $("#discussionListContainer").append(discussionMediaObject);
          }
        }
      });
    }
    
    listDiscussion(); // 페이지 로딩 후 댓글 리스트 가져오는 함수 한 번 실행
    
    /* 댓글 전송 */
    $("#sendDiscussion").click(function() {
      const discussion = $("#discussionTextarea").val();
      const member_id = '${sessionScope.loggedInMember.member_id}';
      const masterpiece_id = '${masterpiece.masterpiece_id}';
      
      const data = {
    	  discussion : discussion,
          member_id : member_id,
          masterpiece_id : masterpiece_id
      };
      $.ajax({
        url : appRoot + "/discussion/write",
        type : "post",
        data : data,
        success : function() {
          // textarea reset
          $("#discussionTextarea").val("");
        },
        error : function() {
          alert("댓글이 작성되지 않았습니다. 권한이 있는 지 확인해보세요.");
        },
        complete : function() {
          // 댓글 리스트 새로고침
          listdiscussion();
        }
      });
    });
  });
</script>

<title>Insert title here</title>
<style>
body {
	background-color: #222;
}

.secondSection {
	background-color: rgb(173, 166, 146);
}

/* 클릭시 확대 스타일 */
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 100;
	background: rgba(255, 255, 255, 0.3);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 800px;
}

/* 하단 카드 이미지 고정 */
.bottom-card-img-top {
	height: 15rem;
	object-fit: cover;
}
</style>

</head>
<body>

	<b:navBar></b:navBar>

	<!-- 이미지 확대 -->
	<div class='bigPictureWrapper'>
		<div class='bigPicture'></div>
	</div>

	<div class="contents-wrap">
		<!-- Product section-->
		<section class="py-5 my-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0"
							src="${staticUrl }/masterpiece/${masterpiece.masterpiece_id }/${masterpiece.file_name }"
							alt="${masterpiece.file_name }" id="zoom-img">
					</div>
					<div class="col-md-6 text-white">

						<h1 class="display-5 fw-bolder">${masterpiece.title }</h1>
						<div class="fs-5 mb-5">
							<span>${masterpiece.artist }</span>
						</div>
						<div class="fs-5 mb-5">
							<span>${masterpiece.country }</span>
						</div>
						<div class="fs-5 mb-5">
							<span>${masterpiece.age }</span>
						</div>
						<div class="fs-5 mb-5">
							<span>${masterpiece.member_id }</span>
						</div>
						<p class="lead text-white">${masterpiece.content }</p>
						<div class="fs-5 mb-5">
							<a href="${masterpiece.source }">${masterpiece.source }</a>
						</div>
						
						<%-- <div class="d-flex">
							<button class="btn btn-light flex-shrink-0" type="button">Go Artist(작가 더보러가기)</button>
						</div> --%>

					</div>
				</div>
			</div>


		</section>


		<!-- Reply section -->
<%-- 		<section class="py-5 my-5 bg-rgb(100, 0, 0)">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
				
					<c:if test="${not empty sessionScope.loggedInMember }">
					
						<!-- 댓글 작성 textarea container -->
						<div class="col">
							<hr>
							<!-- .input-group>textarea#replyTextarea.form-control+.input-group-append>button.btn.btn-outline-secondary#sendReply -->
							<div class="input-group">
								<textarea name="" id="discussionTextarea" class="form-control"></textarea>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" id="sendDiscussion">
										<i class="far fa-comment-dots fa-lg"></i>
									</button>
								</div>
							</div>
						</div>
						
					</c:if>
					
				</div>
			</div> --%>

			<!-- 댓글 container -->
<!-- 			<div class="container">
				<div class="row">
					<div class="col">

						<div id="discussionListContainer"></div>

					</div>
				</div>
			</div> -->
	
	</section>

	<!-- Related items section-->
	<section class="py-5 bg-rgb(173, 166, 146) secondSection">
		<div class="container px-4 px-lg-5 mt-5 bg-rgb(173, 166, 146)">
			<h2 class="fw-bolder mb-4">the Other arts</h2>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				
				<c:forEach items="${ran4 }" var="ran4">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="bottom-card-img-top"
								src="${staticUrl }/masterpiece/${ran4.masterpiece_id }/${ran4.file_name }"
								alt="${ran4.file_name}">
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 작품 이름-->
									<h5 class="fw-bolder">${ran4.title }</h5>
									<!-- text-warning이 글씨의 색깔을 나타냄. -->
									<!-- 작가 이름 -->
									<div class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill">작가 : ${ran4.artist }</div>
									</div>
									<!-- 작품 나라 -->
									<div class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill">나라 : ${ran4.country }</div>
									</div>
									<!-- 작품 시대 -->
									<div class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill">시대 : ${ran4.age }</div>
									</div>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto" href="get?masterpiece_id=${ran4.masterpiece_id }">Go art</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>

	</section>

	<b:bottomInfo></b:bottomInfo>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		// 클릭시 이미지 확대
		$(document).ready(
				function(e) {
					
					$(document).on("click", "#zoom-img", function() {
						var path = $(this).attr('src')
						/* console.log(path) */
						showImage(path);
					});//end click event

					function showImage(fileCallPath) {

						$(".bigPictureWrapper").css("display", "flex").show();

						$(".bigPicture").html("<img src='"+fileCallPath+"' >")
								.animate({
									width : '100%',
									height : '100%'
								}, 1000);

					}//end fileCallPath

					$(".bigPictureWrapper").on("click", function(e) {
						$(".bigPicture").animate({
							width : '0%',
							height : '0%'
						}, 1000);
						setTimeout(function() {
							$('.bigPictureWrapper').hide();
						}, 1000);
					});//end bigWrapperClick event
				});
	</script>

</body>
</html>











