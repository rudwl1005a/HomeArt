<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/board"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>Insert title here</title>
</head>
<body>
  <b:navBar></b:navBar>

  <!-- .container>.row>.col>h1{회원 가입} -->
  <div class="container">
    <div class="row">
      <div class="col">
        <h1>회원 가입</h1>

        <c:if test="${not empty alertMessage}">
          <div class="alert alert-warning">${alertMessage }</div>
        </c:if>

        <!-- form>.form-group*4>label[for=input$]+input.form-control#input$[required]^button.btn.btn-outline-primary{가입} -->
        <form method="post">
          <div class="form-group">
            <label for="input1">아이디</label>
            <!-- .input-group>.input-group-append>button.btn.btn-secondary#idCheckButton{중복확인} -->
            <div class="input-group">
              <input type="text" class="form-control" id="input1" required name="id" value="${member.id }">
              <div class="input-group-append">
                <button class="btn btn-secondary" id="idCheckButton" type="button">중복확인</button>
              </div>
            </div>
            <!-- small.form-text#idCheckMessage -->
            <small class="form-text" id="idCheckMessage"></small>
          </div>
          <div class="form-group">
            <label for="input2">패스워드</label>
            <input type="password" class="form-control" id="input2" required name="password" value="${member.password }">
          </div>
          <div class="form-group">
            <label for="input6">패스워드 확인</label>
            <input type="password" class="form-control" id="input6" required>
          </div>
          <div class="form-group">
            <label for="input5">닉네임</label>
            <div class="input-group">
              <input type="text" class="form-control" id="input5" required name="nickName" value="${member.nickName }">
              <!-- .input-group-append>button.btn.btn-secondary#nickNameCheckButton[type=button]{중복확인} -->
              <div class="input-group-append">
                <button class="btn btn-secondary" id="nickNameCheckButton" type="button">중복확인</button>
              </div>
            </div>
            <small class="form-text" id="nickNameCheckMessage"></small>
          </div>
          <div class="form-group">
            <label for="input3">이메일</label>
            <input type="email" class="form-control" id="input3" required name="email" value="${member.email }">
          </div>
          <div class="form-group">
            <label for="input4">주소</label>
            <input type="text" class="form-control" id="input4" required name="address" value="${member.address }">
          </div>
          <button class="btn btn-outline-primary" id="submitButton1">가입</button>
        </form>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


  <script>
      $(document).ready(
          function() {
            // 아래 코드에서 필요한 요소들 선택 
            const passwordInput = $("#input2");
            const passwordConfirmInput = $("#input6");
            const submitButton = $("#submitButton1");

            // submit 버튼 활성화 조건 변수
            let idAble = false;
            let passwordCheck = false;
            let nickNameAble = false;

            // submit 버튼 활성화 메소드
            let enableSubmit = function() {
              if (idAble && passwordCheck && nickNameAble) {
                submitButton.removeAttr("disabled");
              } else {
                submitButton.attr("disabled", true);
              }
            }

            // contextPath
            const appRoot = '${pageContext.request.contextPath}';
            // 아이디 중복확인 버튼이 클릭되면
            // 아이디 input요소에 입력된 값을 
            // 서버에 전송 후
            // 응답 받은 값에 따라서 
            // 1) 서브밋 버튼 활성화 또는 비활성화 AND 
            // 2) 사용가능 또는 불가능 메세지 출력
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
                      id : idValue
                    },
                    success : function(data) {
                      switch (data) {
                      case "able":
                        // 사용가능할 때
                        $("#idCheckMessage").text("사용 가능한 아이디 입니다.")
                            .removeClass("text-danger text-warning").addClass(
                                "text-primary");
                        
                        $("#input1").attr("readonly", true);

                        // 서브밋 버튼 활성화 조건 추가
                        idAble = true;
                        break;
                      case "unable":
                        // 사용불가능할 때
                        $("#idCheckMessage").text("이미 있는 아이디 입니다.")
                            .removeClass("text-warning text-primary").addClass(
                                "text-danger");

                        // 서브밋 버튼 비활성화 조건 추가
                        idAble = false;
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

            // 암호input과 암호확인input값 비교해서 서브밋 버튼 활성화 또는 비활성화
            const confirmFunction = function() {
              // 두 인풋 요소의 값을 비교해서 서브밋 버튼 활성화 또는 비활성화
              const passwordValue = passwordInput.val();
              const passwordConfirmValue = passwordConfirmInput.val();

              if (passwordValue === passwordConfirmValue) {
                // submitButton.removeAttr("disabled");
                passwordCheck = true;
              } else {
                // submitButton.attr("disabled", true);
                passwordCheck = false;
              }

              enableSubmit();// 조건이 충족되었을 때만 submit 버튼 활성화
            };

            submitButton.attr("disabled", true);
            passwordInput.keyup(confirmFunction);
            passwordConfirmInput.keyup(confirmFunction);

            // nickNameCheckButton이 클릭되었을 때
            // nickName input의 값을 읽어서
            // /member/nickNameCheck 로 요청 보낸 결과에 따라
            // 메세지 출력 and 서브밋 버튼 활성화/비활성
            $("#nickNameCheckButton").click(
                function() {
                  $("#nickNameCheckButton").attr("disabled", true);

                  const nickName = $("#input5").val().trim();

                  if (nickName === "") {
                    $("#nickNameCheckMessage").text("닉네임을 입력해주세요.")
                        .removeClass("text-danger text-primary").addClass(
                            "text-warning");
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
                            .removeClass("text-warning text-danger").addClass(
                                "text-primary");
                        
                        $("#input5").attr("readonly", true);

                        nickNameAble = true;

                        break;
                      case "unable":
                        // 사용 불가능 할 때
                        $("#nickNameCheckMessage").text("이미 있는 닉네임입니다.")
                            .removeClass("text-warning text-primary").addClass(
                                "text-danger");

                        nickNameAble = false;

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















