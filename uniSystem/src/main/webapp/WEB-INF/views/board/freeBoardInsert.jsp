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
    <link rel="stylesheet" href="/resources/css/board/freeBoardInsert.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <form action="/board/${categoryNo}/insert" method="POST" id="boardWriteFrm"  enctype="multipart/form-data" >
                
                <div class="row1">
                    <div></div>
                    <div>게 시 글 작 성 중 . . .</div>
                </div>
    
                <div class="row2" class="boardTitle"><input type="text" placeholder="게시글 제목을 입력해주세요."></div>

                <div class="row3">
                    <div class="boardContent">
                        <div class="row3-imgArea" >
                            <label for="file">
                                <img class="preview" src="#">
                            </label>
                            <input type="file" name="file" class="inputImage" id="file" accept="image/*">
                        </div>
                        ${board}
                        <textarea placeholder="게시글 내용을 입력해주세요." maxlength="1400" name="boardContent"></textarea>
                    </div>
                </div>

                <div class="row4">게시글 글자수 확인(최대 1400자) : 현재 <span class="inputCount"> 1234 </span>글자 입력 중...</div>

                <div class="row5"><button type="submit">게시글 작성 완료</button></div>

            </form>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardInsert.js"></script>

</body>
</html>