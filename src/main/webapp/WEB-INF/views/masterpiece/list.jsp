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
<link href="${pageContext.request.contextPath}/resources/css/masterpiece/list.css" rel="stylesheet" type="text/css">
<title>Masterpiece-list</title>
</head>
<body>

	<b:navBar active="masterpiece"></b:navBar>

	<div class="contents-wrap">

		<!-- header board -->
		<!-- 상단 이미지 보드 -->
		<!-- .header_board>ul.header_wp>li.header_items -->
		<section class="py-4">
			<div class="container px-4 px-lg-8 my-5">
				<div class="row gx-4 gx-lg-5 main-top-img justify-content-center" >
					<c:forEach items="${ran }" var="ran">
						<a href="get?masterpiece_id=${ran.masterpiece_id }"><!-- class="help-tip" --> 
							<img src="${staticUrl }/masterpiece/${ran.masterpiece_id }/${ran.file_name }" alt="${ran.file_name }" style="width: auto; height: 650px;">
							<%-- <p>마우스 오버시 알림메시지창이 뜹니다.<br>CSS로만 만들어졌습니다.</p> --%>
						</a>
						
					</c:forEach>
					
				
					
	<%--				<div id="carouselExampleCaptions" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
							 <c:forEach items="${ran }" var="ran" varStatus=”status”>
							${status.count }
							<c:choose>
								<c:when>
								
								</c:when>
								
							</c:choose> 
								<div class="carousel-item active">
									<img
										src="${staticUrl }/masterpiece/${ran.masterpiece_id }/${ran.file_name }"
										alt="${ran.file_name }" style="width: auto; height: 650px;">
								</div>
								<div class="carousel-item">
									<img
										src="${staticUrl }/masterpiece/${ran.masterpiece_id }/${ran.file_name }"
										alt="${ran.file_name }" style="width: auto; height: 650px;">
								</div>

								<div class="carousel-item">
									<img
										src="${staticUrl }/masterpiece/${ran.masterpiece_id }/${ran.file_name }"
										alt="${ran.file_name }" style="width: auto; height: 650px;">
								</div>
							 </c:forEach> 
						</div>
						</div> 
						
					<button class="carousel-control-prev" type="button"
						data-target="#carouselExampleCaptions" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-target="#carouselExampleCaptions" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</button>--%>
				</div>
				
				
			</div>

		</section>


		<!-- main board -->
		<!-- 검색바 -->
		<!-- .container>.main_board>.main_content -->
		<!-- 		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div class="main_board" style="background-color: white;">
					검색바 및 카테고리 분류판
					여기서 ajax사용해서 하단 이미지 리스트 보여주기 바꾸고싶다
					ul.main_search>li.search_bar^ul.main_select>li.category*4
					<ul class="main_category">
						<li class="search_bar"></li> 검색창은 필요한가??
						<div class="row">
							<li class="col" id="category_menu">COUNTRY <i class="fas fa-caret-down"></i>
								<div class="category" id="category">나라1</div>
								<div class="category" id="category">나라2</div>
								<div class="category" id="category">나라3</div>
							</li>
							<li class="col">ARTIST</li>
							<li class="col">AGE</li>
						</div>
					</ul>
				</div>
			</div> -->

		<!-- register button & search button -->
		<section>
			<div class="py-3 pt-5" id="cardStart">
				<div class="container card-search" id="card-search">
					<form action="./list.do" method="get" class="d-flex">
						<!-- list button -->
						<button class="btn btn-outline-light mx-1" type="button"
							onclick="location.href='${pageContext.request.contextPath}/masterpiece/list'">List</button>
						<!-- register button -->
						<button class="btn btn-outline-light mx-1" type="button"
							onclick="location.href='${pageContext.request.contextPath}/masterpiece/register'">Post</button>
						<!-- search button -->
						<select name="type" class="btn btn-outline-light mx-1 form-select"
							id="type">
							<option class="text-weight-light" selected value="all"
								${type eq 'all' ? 'selected' : '' }>select <i
									class="fas fa-caret-square-down"></i></option>
							<option value="title" ${type eq 'title' ? 'selected' : '' }>title</option>
							<option value="artist" ${type eq 'artist' ? 'selected' : '' }>artist</option>
							<option value="country" ${type eq 'country' ? 'selected' : '' }>country</option>
							<option value="age" ${type eq 'age' ? 'selected' : '' }>age</option>
						</select> <input class="form-control me-2 mx-1" type="text"
							placeholder="Search" aria-label="Search" name="keyword"
							value="${keyword }">
						<button class="btn btn-outline-light" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
			</div>

			<c:if test="${not empty keyword }">
				<div class="alert text-center my-0">
					<h3 class="text-light font-weight-light my-3">"${totalRow }개"
						의 자료가 검색되었습니다.</h3>
				</div>
			</c:if>
		</section>
		<!-- Section art-->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center card-list-container">


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

	<script>
	
const appRoot = '${pageContext.request.contextPath}';
/* $(function(){
		console.log(1234);
		
}
 */
	function updateLike(mp,mb) {
			/* console.log("나옴");
			console.log("엠피"+mp);
			console.log("엠비"+mb); */
			var data = {
					masterpiece_id : mp,
					member_id : mb
			}
			/* console.log(appRoot); */

		$.ajax({
	          url : appRoot + "/masterpiece/like",
	          type : "get",
	          data : data,
	          success : function(result) {
	        	  /* console.log(result); */ //이거일듯 
	        	  var resultSu = result.result;
	        	  var msg = result.msg;
	        	  var likeSu = result.likeSu;
	        	  
	        	  if (resultSu == 1 ) {
	        		  alert(msg);
	        		  $("#likeBtn" + mp).text("좋아요! " + likeSu);
	        		  
	        	  } else {
	        		  alert("실패");
	        	  }
	        	  location.herf= appRoot+"/masterpiece/list.do";

	        	  /*  $.ajax({
			          url : appRoot + "/masterpiece/list.do",
			          type : "get",
			          data : null,
			          success : function() {
			            alert("리스트 다시조회");
			          },
			          error : function() {
			            alert("리스트 다시조회 실패.");
			          }
			        }); */
	        	  

	          },
	          error : function() {
	            alert("아작스 실패.");
	          }
	        });
		
	}
 	

//페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정.
let currentPage = 1;
//현재 페이지가 로딩중인지 여부를 저장할 변수.
let isLoading = false;

//웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
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
		/* console.log("inscroll"+currentPage); */
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
			//해당 문자열을 .card-list-container div에 html로 해석하라고 추가한다.
			$(".card-list-container").append(data);
			//로딩바를 숨김.
			$(".back-drop").hide();
			isLoading=false;
			/* console.log("ajax"); */
			
		}
	});
}

$(document).ready(function () {
	GetList(1);
	
	
});

	

	
</script>
</body>
</html>