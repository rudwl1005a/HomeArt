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
  <!-- .container>.row>.col>h1{회원정보} -->
  <div class="container">
    <div class="row">
      <div class="col">
        <h1>회원정보</h1>
        <!-- form>.form-group*4>label[for=input$]+input.form-control[name][value] -->
        <form method="post" id="infoForm">
          <div class="form-group">
            <label for="input1">아이디</label>
            <input type="text" required id="input1" class="form-control" name="id" value="${sessionScope.loggedInMember.id }" readonly>
          </div>
          <div class="form-group">
            <label for="input2">패스워드</label>
            <input type="password" required id="input2" class="form-control" name="password" value="${sessionScope.loggedInMember.password }">
          </div>
          <div class="form-group">
            <label for="input6">패스워드 확인</label>
            <input type="password" required id="input6" class="form-control">
          </div>
          <div class="form-group">
            <label for="input5">닉네임</label>
            <div class="input-group">
              <input type="text" required id="input5" class="form-control" name="nickName" value="${sessionScope.loggedInMember.nickName }">
              <div class="input-group-append">
                <button class="btn btn-secondary" id="nickNameCheckButton" type="button">중복확인</button>
              </div>
            </div>
            <small class="form-text" id="nickNameCheckMessage"></small>
          </div>
          <div class="form-group">
            <label for="input3">이메일</label>
            <input type="email" required id="input3" class="form-control" name="email" value="${sessionScope.loggedInMember.email }">
          </div>
          <div class="form-group">
            <label for="input4">주소</label>
            <input type="text" required id="input4" class="form-control" name="address" value="${sessionScope.loggedInMember.address }">
          </div>
          <!-- button.btn.btn-outline-secondary{수정}+button.btn.btn-outline-danger{삭제} -->
          <button class="btn btn-outline-secondary" id="modifyButton">수정</button>
          <button class="btn btn-outline-danger" id="removeButton">삭제</button>
        </form>
      </div>
    </div>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

  <script>
      $(document).ready(
          function() {
            const oldNickName = $("#input5").val(); 
            const appRoot = '${pageContext.request.contextPath}';
            const infoForm = $("#infoForm");
            const modifyButton = $("#modifyButton");
            const removeButton = $("#removeButton");

            let nickNameAble = true;
            let passwordCheck = false;
            
            // 닉네임이 기존과 같지 않을 때만 중복확인버튼 활성화
            $("#nickNameCheckButton").attr("disabled", true);
            $("#input5").keyup(function() {
              const typed = $("#input5").val();
              if (oldNickName === typed) {
                $("#nickNameCheckButton").attr("disabled", true);
                nickNameAble = true;
              } else {
                $("#nickNameCheckButton").removeAttr("disabled");
                nickNameAble = false;
              }
              enableSubmit();
            });
            
            // 패스워드 확인과 닉네임 중복확인이 
            // 완료되었을 때만 수정버튼 활성화
            const enableSubmit = function() {
              if (passwordCheck && nickNameAble) {
                modifyButton.removeAttr("disabled");
              } else {
                modifyButton.attr("disabled", true);
              }
            }

            // nickNameCheckButton 클릭 시 
            // /member/nickNameCheck 로
            // 작성한 nickName 전송해서
            // 받은 결과에 따라
            // 수정버튼 활성화 또는 비활성화 
            // AND 적절한 메세지 출력
            $("#nickNameCheckButton").click(
                function() {
                  $("#nickNameCheckButton").attr("disabled", true);
                  
                  const nickName = $("#input5").val().trim();
                  
                  if (nickName === "") {
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
                      default:
                        break;
                      }
                    }, 
                    complete : function() {
                      enableSubmit();
                      $("#nickNameCheckButton").removeAttr("disabled");
                    }
                  });
                });

            // 수정버튼 또는 삭제버튼 클릭 시 form의 action 속성값 변경


            modifyButton.click(function(e) {
              e.preventDefault();
              infoForm.attr("action", "");
              infoForm.submit();
            });

            removeButton.click(function(e) {
              e.preventDefault();
              if (confirm("탈퇴하시겠습니까?")) {
                infoForm.attr("action", "remove");
                infoForm.submit();
              }
            });

            // 패스워드, 패스워드확인 인풋요소 값 일치할 때만 수정버튼 활성화
            const passwordInput = $("#input2");
            const passwordConfirmInput = $("#input6");
            const confirmFunction = function() {
              const passwordValue = passwordInput.val();
              const passwordConfirmValue = passwordConfirmInput.val();

              if (passwordValue === passwordConfirmValue) {
                passwordCheck = true;
                // modifyButton.removeAttr("disabled");
              } else {
                passwordCheck = false;
                // modifyButton.attr("disabled", true);
              }
              
              enableSubmit();
            }

            modifyButton.attr("disabled", true); // 수정 버튼 비활성화

            passwordInput.keyup(confirmFunction);
            passwordConfirmInput.keyup(confirmFunction);
          });
    </script>

</body>
</html>














