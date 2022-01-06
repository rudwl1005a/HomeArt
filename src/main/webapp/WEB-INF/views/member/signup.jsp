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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<title>회원가입</title>

<style>

table tr td {
	text-align: left;
	border-width: 1px;
	border-style: solid;
	width: 650px;
}

table tr th {
	text-align: center;
	border-style: solid;
	border-width: 1px;
	width: 150px;
}

table tr td > input {
	margin: 10px 10px 0px 10px;
}

table tr td > div {
	margin: 0px 0px 10px 10px;
}

#input1 {
	width: 500px;
	display: inline;
}

#input2,#input3,#input4,#input5,#input6,#input7,#input8 {
	width: 630px;
}

#input3, #input5, #input6, #input7 {
	margin-bottom: 10px;
}

.valid, .invalid {
	font-size: 11px;
	font-weight: bold;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}

.mustinfo {
	text-align: left;
	margin: 0 auto;
	padding-bottom: 5px;
	padding-left: 610px;
	font-size: 13px;
	color: blue;
}
</style>

</head>
<body>
<b:navBar></b:navBar>

<div class="contents-wrap">
	<div class="container" >
		<div class="row">
			<div class="col">
				<h1 style="margin: 10px;">회원가입</h1>
				
				<c:if test="${not empty alertMessage}">
			    	<div class="alert alert-warning">${alertMessage }</div>
			   	</c:if>
				
				<form method="post" id="signupForm">
					<p class="mustinfo">*는 필수 입력 항목입니다.</p>
					<table>
						<tr>
							<th>* 아이디</th>
							<td>
								<input type="text" class="form-control" id="input1" required name="member_id" value="${member.member_id }" />
								<button class="btn btn-outline-primary" style="margin-left: 5px;" id="idCheck">중복 확인</button>
								<div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
							</td>
						</tr>
						<tr>
							<th>* 비밀번호</th>
							<td>
								<input type="password" class="form-control" id="input2" required name="password" value="${member.password }" />
								<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
							</td>
						</tr>
						<tr>
							<th>* 비밀번호 확인</th>
							<td>
								<input type="password" class="form-control" id="input8" required/>
								<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
							</td>
						</tr>
						<tr>
							<th>* 이름</th>
							<td>
								<input type="text" class="form-control" id="input3" required name="member_name" value="${member.member_id }" />
							</td>
						</tr>
						<tr>
							<th>* 닉네임</th>
							<td>
								<input type="text" class="form-control" id="input4" required name="nickName" value="${member.nickName }" />
								<div class="valid">닉네임을 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="email" class="form-control" id="input5" name="email" value="${member.email }" />
							</td>
						</tr>
						<tr>
							<th>거주국가</th>
							<td>
								<input type="text" class="form-control" id="input6" required name="country" value="${member.country }" />
							</td>
						</tr>
						<tr>
							<th>관리자</th>
							<td>
								<input type="text" class="form-control" id="input7" required name="isAdmin" value="${member.isAdmin }" />
							</td>
						</tr>
					</table>
					<button class="btn btn-outline-primary" style="margin: 10px 0px 0px 5px;" id="submit">가입</button>
				</form>
			</div>
		</div>
	</div>
	<b:bottomInfo></b:bottomInfo>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
	/* 나중에 구현
	$(document).ready(function(){
		const signupForm = $("#signupForm");
		
		$("#idCheck").click(function(e) {
			// 아이디 중복확인
			e.preventDefault();
			signupForm.attr("action", "");
			signupForm.submit();
		});
		
		$("#submit").click(function(e) {
			// 가입확인
			e.preventDefault();
			if(confirm("가입하시겠습니까?")){
				signupForm.attr("action", "remove");
				signupForm.submit();		
			}
		})
	});
	*/
</script>

</body>
</html>
