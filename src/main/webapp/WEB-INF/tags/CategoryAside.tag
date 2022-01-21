<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/adminPage/AdminMain">HomeArt</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="${pageContext.request.contextPath}">
							홈아트
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item">
						<a class="nav-link" href="../adminPicShare/AdminPicShare" 
						role="button" aria-expanded="false"> 작가그림공유 </a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="../adminPic/AdminPicBoard">
							명화게시판
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="../adminFreeBoard/list">
							자유게시판
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="../adminNotice/AdminNoticeCUD">
							공지사항
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="../adminMemManage/AdminMemManage?pageNum=1&amount=9&keyword=">
							회원관리
							<span class="sr-only">(current)</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>


