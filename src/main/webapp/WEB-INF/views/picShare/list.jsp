<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<%@ page import="java.util.*"%>
<%@ page import="com.homeart.domain.picShare.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js" integrity="sha512-hPzAQ7RgUQ/jsM6VWPWBpv2btjd9HWvEm8WIwAngYpMuaoMpihN6ROj8cRFUeYnV0vTYHepksRyzzskrhoL5Zg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/picBoardlist.css" rel="stylesheet" type="text/css">

<title>HomeArt</title>

<style>
body {
	background-color: #222;
}

.card-img-top {
	height: 15rem;
	object-fit: cover;
}

.card-img-top-best {
	height: 10rem;
	object-fit: cover;
}

.secondSection {
	background-color: rgb(179, 177, 178);
}

.toTopLink {
	position: fixed;
	bottom: 50px;
	right: 50px;
	text-decoration: none;
	color: white;
	background-color: #222;
	display: block;
	width: 30px;
	height: 30px;
	text-align: center;
	font-size: xx-large;
}

#titleName {
	max-width: 210px;
	display: inline-block;
	overflow: hidden;
	word-wrap: break-word;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>

<script>
	//페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정.
	let currentPage = 1;
	// 현재 페이지가 로딩중인지 여부를 저장할 변수.
	let isLoading = false;
	
	// 웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
	$(window).on("scroll", function () {
		// 위로 스크롤된 길이
		let scrollTop = $(window).scrollTop();
		// 웹브라우저의 창의 높이
		let windowHeight = $(window).height();
		// 문서 전체의 높이
		let documentHeight = $(document).height();
		// 바닥까지 스크롤 되었는지의 여부
		let isBottom = scrollTop+windowHeight + 10 >= documentHeight;
		
		if (isBottom) {
			
			// 만일 현재 마지막 페이지라면
			if(currentPage == ${totalPageCount} || isLoading) {
				return;
			}
			
			// 현재 로딩 중을 표시.
			isLoading = true;
			// 로딩바
			$(".back-drop").show();
			// 요청할 페이지 번호를 1 증가.
			currentPage++;
			// 추가로 받아올 페이지를 서버에 ajax 요청을 하고
/* 			console.log("inscroll"+currentPage); */
			GetList(currentPage);
				
		};
		
	});
	
	
	
	const GetList = function (currentPage) {
		
		const appRoot = '${pageContext.request.contextPath}'; 
		
		/* console.log("inGetList"+currentPage); */
		
		// 무한 스크롤 부분
		$.ajax ({
			url: "ajax_page.do",
			method: "GET",
			//검색 기능이 있는 경우 type과 keyword를 함께 넘겨줘야 한다.
			data: "pageNum="+currentPage+"&type=${type}&keyword=${keyword}",
			//ajax_page.jsp의 내용이 data로 들어온다.
			success: function (data) {
				/* console.log(data); */
				//응답된 문자열은 html 형식이고 (picShare/ajax_page.jsp에 응답내용이 있다.)
				
				let dataElem = $(data);
				
				// hover -> dropdown 메뉴 보이고 안보이고
				dataElem.find(".card").each(function() {
					let boardId = $(this).attr('idx');
					
					$(this).hover(function () {
						$(this).find(".dropdown").css("display", "block");
						// console.log(boardId, "card");				
					}, function() {
						$(this).find(".dropdown").css("display", "none");
					});
					
					// delete 클릭시 -> removeSubmitButton 실행
					$(this).find("#removeSubmitButton" + boardId).click(function (e) {
						e.preventDefault();
						if (confirm("삭제하시겠습니까?")) {
							$("#modifyForm" + boardId).attr("action", "remove").submit();
						}
					});
					
					$(this).find("#shareButton" + boardId).click(function (e) {
						console.log("click shareButton");
						e.preventDefault();
						alert("url이 복사되었습니다.");
					});
					
					$(this).find("#declaration" + boardId).click(function (e) {
						console.log("click declaration");
						e.preventDefault();
						if (confirm("이 게시물을 신고하시겠습니까?")) {
							
						}
					});
				})
				
				
				
				
				
				
				//해당 문자열을 .card-list-container div에 html로 해석하라고 추가한다.
				$(".card-list-container").append(dataElem);
				//로딩바를 숨김.
				$(".back-drop").hide();
				isLoading=false;
				/* console.log("ajax"); */
				
				
				
		
				// 로그인을 한 상태에서 하트를 클릭했을 때 (로그인 상태의 a 태그의 class: heart-click)
				$(".heart-click").click(function () {
					
					// 게시물 번호를 idx로 전달받아 저장
					let boardId = $(this).attr('idx'); 
					/* console.log("heart-click"+boardId); */
					
					// 빈하트를 눌렀을 때,
					if($(this).children('i').attr('class') == "far fa-heart") {
						/* console.log("빈하트 클릭" + boardId); */
						
						$.ajax({
							url: 'saveHeart.do',
							type: 'GET',
							data: {
								boardId : boardId
							},
							success: function (board) {
								// 페이지 새로고침
								// document.location.reload(true);
								
							 	/* let heart = '${board.like_cnt}';  */
								
								/* console.log(board.like_cnt);
							 	console.log(board.likeId); */
								
								$('#heart'+boardId).text(board.like_cnt);
								
								/* console.log("하트추가 성공"); */
							},
							error: function () {
								alert('서버 에러');
							}
						});
						console.log("꽉 찬 하트로 바뀌어 주겠지? 바껴라!");
						
						// 꽉찬하트로 바꾸기
						// 안에 내용을 비우고, (추가한 코드)
						/* $(this).empty(); */
						// 안에 내용을 채우고,
						$(this).html(`<i class="fas fa-heart"></i>`);
						/* $('.heart_icon'+boardId).html(`<i class="fas fa-heart"></i>`); */
						
					// 꽉 찬 하트를 눌렀을때는? 다시 빈 하트로 바뀌어야함.
					} else if($(this).children('i').attr('class') == "fas fa-heart") {
						/* console.log("꽉 찬 하트를 클릭" + boardId); */
						
						$.ajax({
							url: 'removeHeart.do',
							type: 'GET',
							data: {
								boardId: boardId
							},
							success: function (board) {
								// 페이지 새로고침
								// document.location.reload(true);
								
							/* let heart = '${board.like_cnt}';  */
								/* console.log(board.like_cnt);	
								console.log(board.likeId); */
							
								// 페이지 하트 수 갱신
								$('#heart'+boardId).text(board.like_cnt);
								
								/* console.log("하트 삭제, 빈하트로 변경 성공!"); */
							},
							error: function () {
								alert('서버에러');
							}
						});
						/* console.log("빈하트로 다시 바뀌냐 ?"); */
						
						// 빈하트로 바꾸기
						// 안에 내용을 비우고, (추가한 코드)
					/* 	$(this).empty(); */
						// 안에 내용을 채우고,
						$(this).html(`<i class="far fa-heart"></i>`);
						/* $('.heart_icon'+boardId).html(`<i class="far fa-heart"></i>`); */
						
					}
					
					
				});
				
				// 로그인 한 상태에서 하트를 클릭하면 로그인 해야한다는 알림창을 뜨게끔
				$(".heart-notlogin").unbind('click');
				$(".heart-notlogin").click(function () {
					alert('로그인 후 이용가능합니다.');
				});
				
			}
		});
	}
	
	$(document).ready(function () {
		GetList(1);
		
		
		
	});
	
</script>

</head>
<body>

	<b:navBar active="picture"></b:navBar>

	<div class="contents-wrap">

		<!-- 맨 위로 올라가는 버튼? 링크? -->
		<a class="toTopLink" href="#top">
			<i class="fas fa-chevron-up"></i>
		</a>

		<!-- register button & search button -->
		<div class="py-3 pt-5" id="cardStart">
			<div class="container card-search" id="card-search">
				<form action="./list.do" method="get" class="d-flex">
					<!-- list button -->
					<button class="btn btn-outline-light mx-1" type="button" onclick="location.href='${pageContext.request.contextPath}/picShare/list'">List</button>
					<!-- register button -->
					<button class="btn btn-outline-light mx-1" type="button" onclick="location.href='${pageContext.request.contextPath}/picShare/register'">Post</button>
					<!-- search button -->
					<select name="type" class="btn btn-outline-light mx-1 form-select" id="type">
						<option class="text-weight-light" value="all" ${type eq 'all' ? 'selected' : '' }>select
							<i class="fas fa-caret-square-down"></i></option>
						<option value="title" ${type eq 'title' ? 'selected' : '' }>title</option>
						<option value="nickName" ${type eq 'nickName' ? 'selected' : '' }>artist</option>

					</select>
					<input class="form-control me-2 mx-1" type="text" placeholder="Search" aria-label="Search" name="keyword" value="${keyword }">
					<button class="btn btn-outline-light" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</div>

		<c:if test="${not empty keyword}">
			<div class="alert text-center my-0">
				<h3 class="text-light font-weight-light my-3">"${totalRow }개" 의 자료가 검색되었습니다.</h3>
			</div>
		</c:if>

		<!-- Section art-->
		<section class="card-list" id="card-list">

			<div class="container px-4 py-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center card-list-container"></div>
			</div>
			<a class="toTopLink" href="#top">
				<i class="fas fa-chevron-up"></i>
			</a>
		</section>



		<div class="back-drop">
			<div>
				<i class="fas fa-spinner"></i>
				로딩중
				<i class="fas fa-spinner"></i>
			</div>
		</div>

		<b:bottomInfo></b:bottomInfo>
	</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>



</body>

</html>




























