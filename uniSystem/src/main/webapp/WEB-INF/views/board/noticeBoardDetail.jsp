<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="boardType" items="${boardTypeList}">
    <c:if test="${boardType.CATEGORY_NO == categoryNo}">
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/noticeBoardDetail.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />
     <div class="container">
        <div class="announcement">
            <h2>공 지 사 항</h2>
        </div>

        <div class="title">
            <p>제 목</p>
            <span id="contentTitle">${board.boardTitle}</span>
        </div>
      

        <div class="content">
            <p>내 용</p>
            <span id="outputContent">${board.boardContent}</span>
        </div>

        <div class="uploadFile">
            <p>첨부파일</p>
            <img src="/resources/images/board/downloadIMG.png" width="30" height="30">
            <span id="uploadName" value> 파일 없음</span>
        </div>

        <div class="comment">
            <p>댓글쓰기</p>
            <input type="text" name="conmment" placeholder="댓글을 입력해주세요.">
            <button id="commentBtn">등 록</button>
        </div>

        <div class="noticeBtn">
            <c:if test="${loginMember.memberNo == board.memberNo}">
                <button id="editBtn">수정</button>
                <button id="deleteBtn">삭제</button>
            </c:if>
            <button id="cancelBtn">취소</button>
            <button id="listBtn"><a href="/board/1"> 목 록</a> </button>
        </div>
        
    </div>

    <%-- <jsp:include page="/WEB-INF/views/board/noticeReply.jsp"/>  --%>
    <!-- 오류나서 주석처리함 -->
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

</body>
</html>
