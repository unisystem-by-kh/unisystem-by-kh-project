<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/boardDataWrite.css">
    
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer con">
            <form action="/board/${categoryNo}/${board.boardNo}/update" method="POST" id="boardWriteFrm" enctype="multipart/form-data">
                <div class="detail-title">
                    <input class="title-input" placeholder="제목을 입력하세요." name="boardTitle" value="${board.boardTitle}">
                </div>

                <div class="detail-content">
                    <div class="content-header">
                        <span>작성자 : ${loginMember.memberName}</span>
                        <span>${categoryNo}</span>
                        <span>첨부 파일 : <input type="file" name="file" id="inputFile"/> </span>
                    </div>

                    <div class="content-body">
                        <textarea name="boardContent" class="content-area" placeholder="내용을 입력하세요.">${board.boardContent}</textarea>
                    </div>
                </div>
                <div>
                    <button type="submit">수정하기</button>
                    <button type="reset">초기화</button>
                </div>
            </form>
            
            
            <c:if test="${!empty boardFile}" >
                <div class="write">
                    <a href="#">자료실 업로드</a>
                </div>
            </c:if>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <%-- <script src="/resources/js/board/freeBoard/freeBoardInsert.js"></script> --%>

</body>
</html>