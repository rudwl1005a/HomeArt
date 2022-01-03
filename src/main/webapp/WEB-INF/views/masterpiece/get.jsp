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

<script>
  $(document).ready(function() {
    /* contextPath */
    const appRoot = '${pageContext.request.contextPath}';

    /* 현재 게시물의 댓글 목록 가져오는 함수 */
    const listDiscussion = function() {
      $("#discussionListContainer").empty();
      $.ajax({
        url : appRoot + "/discussion/masterpiece/${masterpiece.id}",
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
                  		  <button class="btn btn-outline-secondary" id="sendDiscussion\${list[i].id}"><i class="far fa-comment-dots fa-lg"></i></button>
                	    </div>
                      </div>
                    </div>
                  </div>`);
            
            discussionMediaObject.find("#sendDiscussion" + list[i].id).click(function() {
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
              
              replyMediaObject.find(".media-body").append(modifyButton);
              
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
      const memberId = '${sessionScope.loggedInMember.id}';
      const masterpieceId = '${masterpiece.id}';
      
      const data = {
    		discussion : discussion,
          memberId : memberId,
          masterpieceId : masterpieceId
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
          listDiscussion();
        }
      });
    });
  });
</script>

<title>Insert title here</title>
</head>
<body>
  <b:navBar></b:navBar>

  <!-- .container>.row>.col>h1{게시물 조회} -->
  <div class="container">
    <div class="row">
      <div class="col">
        <h1>게시물 조회</h1>
        <div class="board-view">
          <!-- .form-group*3>label[for=input$]+input.form-control#input$[readonly] -->
          <div class="form-group">
            <label for="input1">제목</label>
            <!--<input type="text" class="form-control" id="input1" readonly value="${masterpiece.title }"> -->
            <p>${Masterpiece.title }</p>
          </div>
          <div class="form-group">
            <label for="input2">내용</label>
            <!-- <input type="text" class="form-control" id="input2" readonly=""> -->
            <textarea class="form-control" id="input2" readonly>${masterpiece.content }</textarea>
          </div>

          <c:forEach items="${fileNames }" var="fileName">
            <div class="row">
              <div class="col">
                <img class="img-fluid" src="${staticUrl }/${masterpiece.id }/${fileName }" alt="${fileName }">
              </div>
            </div>
          </c:forEach>

          <div class="form-group">
            <label for="input3">작성자</label>
            <input type="text" class="form-control" id="input3" readonly value="${masterpiece.nickName }">
          </div>

          <!-- a.btn.btn-outline-secondary>i.far.fa-edit -->

          <c:if test="${sessionScope.loggedInMember.id eq masterpiece.writer }">
            <a href="modify?id=${masterpiece.id }" class="btn btn-outline-secondary">
              수정/삭제
              <!-- <i class="far fa-edit"></i> -->
            </a>
          </c:if>
        </div>
      </div>
    </div>
  </div>

  <c:if test="${not empty sessionScope.loggedInMember }">
    <!-- 댓글 작성 textarea container -->
    <div class="container">
      <div class="row">
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
      </div>
    </div>
  </c:if>


  <!-- 댓글 container -->
  <div class="container">
    <div class="row">
      <div class="col">

        <div id="discussionListContainer"></div>

      </div>
    </div>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>















