<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="board" value="${map.board}" />
<c:if test="${!empty map.boardFile}" >
    <c:set var="boardFile" value="${map.boardFile}"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/boardData.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer con">

            <div class="detail-title">
                <h1 class="dataTitle">자료실</h1>
                <c:if test="${loginMember.memberNo == board.memberNo}" >
                    <div>
                        <button class="detail-button update-btn">수정</button>
                        <button class="detail-button delete-btn">삭제</button>
                    </div>
                </c:if>
            </div>

            <div class="detail-content">
                <div class="content-header">
                    <span>작성자 : ${board.memberName} </span>
                    <span>${board.boardTitle} </span>
                    <c:if test="${!empty boardFile}">
                        <div class="write">
                            <a href="${boardFile[0].boardFilePath}${boardFile[0].boardFileRename}"
                                                download="${boardFile[0].boardFileOriginal}">${boardFile[0].boardFileOriginal}</a> 
                            
                        </div>
                    </c:if>
                    <c:if test="${empty boardFile}">
                        <div class="write">첨부된 파일이 없습니다.</div>

                    </c:if>
                    <br>
                    <span>작성일 : ${board.boardCDate}</span>
                    <span>조회수 : ${board.boardCount}</span>
                </div>

                <div class="content-body">
                    ${board.boardContent}
                </div>

            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <%-- <script src="/resources/js/board/freeBoard/freeBoardInsert.js"></script> --%>

</body>
</html>