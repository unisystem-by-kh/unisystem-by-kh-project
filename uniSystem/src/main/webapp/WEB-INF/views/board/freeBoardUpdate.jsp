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
    <link rel="stylesheet" href="/resources/css/board/freeBoardUpdate.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <form action="/board/${categoryNo}/${board.boardNo}/update" method="POST" id="boardWriteFrm"  enctype="multipart/form-data" class='board-write'>
                
                <div class="row1">
                    <div><%-- <a href="/board/freeBoardList" style="color: crimson;">자유게시판</a> --%></div>
                    <div>게 시 글 수 정 중 . . .</div>
                </div>
    
                <div class="row2"><input type="text" placeholder="게시글 제목을 입력해주세요." value="${board.boardTitle}" name='boardTitle'></div>

                <div class="row3">
                    <div>
                        <div class="row3-imgArea">
                            <label for="file">
                                <img class="preview" src="${board.fileList[0].boardFilePath}${board.fileList[0].boardFileRename}">
                            </label>
                            <input type="file" name="file" class="inputImage" id="file" accept="image/*">
                        </div>
                        <textarea placeholder="게시글 내용을 입력해주세요." maxlength="1400" name='boardContent'>${board.boardContent}</textarea>
                    </div>
                </div>

                <%-- <div class="row4">게시글 글자수 확인(최대 1400자) : 현재 <span class="inputCount"> 1234 </span>글자 입력 중...</div> --%>

                <div class="row5"><button>게시글 수정 완료</button></div>

                <input type="hidden" name="deleteList" value="">
                <input type="hidden" name="cp" value="${param.cp}">     

            </form>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardUpdate.js"></script>

</body>
</html>