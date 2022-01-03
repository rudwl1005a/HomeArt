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

<title>Insert title here</title>
</head>
<body>
  <b:navBar></b:navBar>

  <!-- .container>.row>.col>h1{회원 목록} -->
  <div class="container">
    <div class="row">
      <div class="col">
        <h1>회원 목록</h1>

        <!-- table.table>thead>tr>th*5^^tbody -->
        <table class="table">
          <thead>
            <tr>
              <th>아이디</th>
              <th>패스워드</th>
              <th>닉네임</th>
              <th>이메일</th>
              <th>주소</th>
              <th>가입일시</th>
              <th>
                <i class="far fa-sticky-note"></i>
              </th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${memberList }" var="member">
              <tr>
                <td>${member.id }</td>
                <td>
                  <c:out value="${member.password }" />
                </td>
                <td>
                  <c:out value="${member.nickName }" />
                </td>
                <td>
                  <c:out value="${member.email }" />
                </td>
                <td>
                  <c:out value="${member.address }" />
                </td>
                <td>${member.inserted }</td>
                <td>${member.numberOfBoard }</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!--  pagination -->

  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <c:if test="${pageInfo.hasPrevButton }">
        <c:url value="/member/list" var="pageLink">
          <c:param name="page" value="${pageInfo.currentPage - 1 }"></c:param>
        </c:url>
        <li class="page-item">
          <a class="page-link" href="${pageLink }" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
      </c:if>

      <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
        <c:url value="/member/list" var="pageLink">
          <c:param name="page" value="${pageNumber }" />
        </c:url>
        <li class="page-item ${pageNumber == pageInfo.currentPage ? 'active' : '' }">
          <a class="page-link" href="${pageLink }">${pageNumber }</a>
        </li>
      </c:forEach>

      <c:if test="${pageInfo.hasNextButton }">
        <c:url value="/member/list" var="pageLink">
          <c:param name="page" value="${pageInfo.currentPage + 1 }"></c:param>
        </c:url>
        <li class="page-item">
          <a class="page-link" href="${pageLink }" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </c:if>
    </ul>
  </nav>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>


















