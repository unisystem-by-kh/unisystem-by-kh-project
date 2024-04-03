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
    <link rel="stylesheet" href="/resources/css/board/noticeBoardWrite.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>


<main>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        
        <div class="announcement">
            <h2>공 지 사 항</h2>
        </div>
    <form action="/board/${categoryNo}/${boardNo}/update" method="POST" id="boardWriteFrm"  enctype="multipart/form-data">
        <div class="title">
            <p>제목</p>
            <input type="text"  name="boardTitle"  value="${board.boardTitle}">
        </div>

        <div class="division">

            <div>작성자</div>
				<div>${loginMember.memberName}</div>
            </div>

        <div class="content">
            <p>내용</p>
            <textarea type="text" name="boardContent" >${board.boardContent}</textarea>
        </div>

        <div class="uploadFile">
            <p>첨부파일</p>
              <input type="file" id="file" name="file" >
                        ${board.fileList[0].boardFileOriginal}
        </div>

        

        <div class="saveCancle">
            <input type="submit" id="savaBtn" value="수 정">
            <input type="button" id="goToListBtn" value="취 소">
        </div>

      </form>  

    </div>


    <%-- <jsp:include page="댓글.html"></jsp:include> --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/noticeBoard/noticeBoardUpdate.js"></script>

</body>
</html>