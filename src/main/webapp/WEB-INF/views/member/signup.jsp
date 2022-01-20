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
<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>HomeArt - 회원가입</title>

<style>

/* id,nickName */
#input-group1, #input-group2 { 
	width: 540px;
	margin: 10px 10px 0px 10px;
}

/* password */
#input2, #input8 {
	width: 500px;
	display: inline;
}

/* other */
#input3,#input5 {
	width: 540px;
	margin-bottom: 10px;
}

#input6, .input-group>.custom-select {
	width: 540px;
    max-width: 540px;
    margin-top: 10px;
}

#signupButton {
	margin: 10px 4px 10px 595px;
	width: 100px;
}

#idCheckMessage, #nickNameCheckMessage, #passwordMessage, #passwordCheckMessage {
	margin: 0px 0px 10px 10px;
}

</style>

</head>
<body>
<b:navBar></b:navBar>
	<div class="container">
		<div class="row justify-content-center align-items-center vertical-center">
			<div class="col-9">
				<h1 style="margin: 10px;">회원가입</h1>
				
				<form method="post" id="signupForm">
					<p class="mustinfo">*는 필수 입력 항목입니다.</p>
					<table>
						<tr>
							<th nowrap>* 아이디</th>
							<td>
								<div class="input-group" id="input-group1">
							        <input type="text" class="form-control" id="input1" required name="member_id" value="${member.member_id }" />
							        <div class="input-group-append">
							        	<button class="btn btn-dark" id="idCheckButton" type="button">중복확인</button>
							        </div>
						        </div>
								<small class="form-text valid" id="idCheckMessage" >아이디를 입력하세요. (영문 대/소문자, 숫자만 입력 가능)</small>
							</td>
						</tr>
						<tr>
							<th nowrap>* 비밀번호</th>
							<td>
								<input type="password" class="form-control" id="input2" required name="password" value="${member.password }" />
								<i id="pwchk1" class="fa fa-eye fa-lg"></i>
								<small class="form-text valid" id="passwordMessage" >비밀번호를 입력하세요. (영문 대/소문자, 숫자만 입력 가능)</small>
							</td>
						</tr>
						<tr>
							<th nowrap>* 비밀번호 확인</th>
							<td>
								<input type="password" class="form-control" id="input8" required/>
								<i id="pwchk2" class="fa fa-eye fa-lg"></i>
								<small class="form-text valid" id="passwordCheckMessage" >비밀번호를 입력하세요. (영문 대/소문자, 숫자만 입력 가능)</small>
							</td>
						</tr>
						<tr>
							<th nowrap>* 이름</th>
							<td>
								<input type="text" class="form-control" id="input3" required name="member_name" value="${member.member_name }" />
							</td>
						</tr>
						<tr>
							<th nowrap>* 닉네임</th>
							<td>
								<div class="input-group" id="input-group2">
								<input type="text" class="form-control" id="input4" required name="nickName" value="${member.nickName }" />
									<div class="input-group-append">
										<button class="btn btn-dark" id="nickNameCheckButton" type="button">중복확인</button>
									</div>
								</div>
								<small class="form-text valid" id="nickNameCheckMessage">닉네임을 입력하세요. (영문 대/소문자, 숫자, 한글을 모두 포함)</small>
							</td>
						</tr>
						<tr>
							<th nowrap>이메일</th>
							<td>
								<input type="email" class="form-control" id="input5" name="email" value="${member.email }" />
							</td>
						</tr>
						<tr>
							<th nowrap>* 거주국가</th>
							<td>
								<div class="input-group mb-3">
								  <select class="custom-select" id="input6" required name="country">
								    <option selected></option>
								    <optgroup label="국가 선택">
									    <c:forEach items="${countryList }" var="list">
										    <c:if test="${list.country_code < 1000 }">
										    	<option value="${list.english }">${list.korean }</option>
										    </c:if>
									    </c:forEach>
								    </optgroup>
								    <optgroup label="대륙 선택(국가 리스트에 없을때)">
									    <c:forEach items="${countryList }" var="list">
										    <c:if test="${list.country_code >= 1000 }">
										    	<option value="${list.english }">${list.korean }</option>
										    </c:if>
									    </c:forEach>
								    </optgroup>
								  </select>
								</div>
							</td>
						</tr>
					</table>
					<button class="btn btn-dark" id="signupButton">가입</button>
				</form>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		/* 비밀번호 보이기 */
	    $('#pwchk1').on('click',function(){
	        $(this).prev('input').toggleClass('active');
	        if($(this).prev('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	    
	    $('#pwchk2').on('click',function(){
	    	$(this).prev('input').toggleClass('active');
	        if($(this).prev('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	    
	    // 필요한 요소들
        const passwordInput = $("#input2");
        const passwordConfirmInput = $("#input8");
        const signupButton = $("#signupButton");
        
        // submit 버튼 활성화 조건 변수
        let idCheck = false;
        let passwordCheck = false;
        let nickNameCheck = false;
        
        // submit 버튼 활성화 메소드
        let enableSubmit = function() {
          if (passwordCheck && idCheck && nickNameCheck) {
			signupButton.removeAttr("disabled");
          } else {
			signupButton.attr("disabled", true);
          }
        }
        
        // contextPath
        const appRoot = '${pageContext.request.contextPath}';

        /* 패스워드 확인 */
        // 암호input과 암호확인input값 비교해서 서브밋 버튼 활성화 또는 비활성화
        const confirmFunction = function() {
          // 두 인풋 요소의 값을 비교해서 서브밋 버튼 활성화 또는 비활성화
          const passwordValue = passwordInput.val();
          const passwordConfirmValue = passwordConfirmInput.val();

          if (passwordValue === passwordConfirmValue) {
            passwordCheck = true;
          } else {
            passwordCheck = false;
          }

          enableSubmit();// 조건이 충족되었을 때만 submit 버튼 활성화
        };
        
        /* 패스워드 일치 메세지 표시 */
        $('#input2, #input8').on('keyup', function(){
        	if($('#input2').val() === $('#input8').val()){
				$("#passwordCheckMessage").text("비밀번호가 일치합니다.")
				.removeClass("text-danger text-warning").addClass("text-primary");
        	} else {
        		$("#passwordCheckMessage").text("비밀번호가 일치하지 않습니다.")
				.removeClass("text-warning text-primary").addClass("text-danger");
        	}
        })

        signupButton.attr("disabled", true);
        passwordInput.keyup(confirmFunction);
        passwordConfirmInput.keyup(confirmFunction);
        
        /* 아이디 확인 */
		$("#idCheckButton").click(
			function() {
				$("#idCheckButton").attr("disabled", true);

				const idValue = $("#input1").val().trim();

				// 아이디 input에 입력안되었을 경우 더 이상 진행하지 않고
				// 아이디 입력하라는 메세지 출력
				if (idValue === "") {
					$("#idCheckMessage").text("아이디를 입력해주세요.").removeClass(
						"text-primary text-danger").addClass("text-warning");
					$("#idCheckButton").removeAttr("disabled");
					return;
				}

				$.ajax({
					url : appRoot + "/member/idcheck",
					data : {
						member_id : idValue
					},
					success : function(data) {
						switch (data) {
						case "able":
							// 사용가능할 때
							$("#idCheckMessage").text("사용 가능한 아이디 입니다.")
							.removeClass("text-danger text-warning").addClass("text-primary");
							
							$("#input1").attr("readonly", true);
							
							// 서브밋 버튼 활성화 조건 추가
							idCheck = true;
							break;
						case "unable":
							// 사용불가능할 때
							$("#idCheckMessage").text("이미 있는 아이디 입니다.")
							.removeClass("text-warning text-primary").addClass("text-danger");
							
							// 서브밋 버튼 비활성화 조건 추가
							idCheck = false;
							break;

						default:
							break;
						}
					},
					complete : function() {
						enableSubmit(); // 조건이 충족되었을 때만 submit 버튼 활성화
						$("#idCheckButton").removeAttr("disabled");
					}
				});
			});
        
		/* 닉네임 확인 */
		$("#nickNameCheckButton").click(
			function() {
				$("#nickNameCheckButton").attr("disabled", true);

				const nickName = $("#input4").val().trim();

				if (nickName === "") {
					$("#nickNameCheckMessage").text("닉네임을 입력해주세요.")
						.removeClass("text-danger text-primary").addClass("text-warning");
					$("#nickNameCheckButton").removeAttr("disabled");
                return;
              }

				$.ajax({
					url : appRoot + "/member/nickNameCheck",
					data : {
						nickName : nickName
					},
					success : function(data) {
						switch (data) {
						case "able":
							// 사용가능 할 때
							$("#nickNameCheckMessage").text("사용 가능한 닉네임입니다.")
								.removeClass("text-warning text-danger").addClass("text-primary");
	                    
							$("#input4").attr("readonly", true);
	
							nickNameCheck = true;
	
							break;
						case "unable":
							// 사용 불가능 할 때
							$("#nickNameCheckMessage").text("이미 있는 닉네임입니다.")
								.removeClass("text-warning text-primary").addClass("text-danger");
	
							nickNameCheck = false;
	
							break;
						}
					},
					complete : function() {
						enableSubmit();
						$("#nickNameCheckButton").removeAttr("disabled");
					}
				});
			});
		});

</script>

</body>
</html>
