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

            <form action="#" >
                
                <div class="row1">
                    <div><a href="/board/freeBoardList" style="color: crimson;">자유게시판</a></div>
                    <div>게 시 글 작 성 중 . . .</div>
                </div>
    
                <div class="row2"><input type="text" placeholder="게시글 제목을 입력해주세요."></div>

                <div class="row3">
                    <div>
                        <div class="row3-imgArea">
                            <label for="img">
                                <img src="https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/02/a0002727/img/ko/a0002727_parts_5bea39afbf327.jpg?20201211115557&q=80&rw=686&rh=490" alt="#">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                        </div>
                        <textarea placeholder="게시글 내용을 입력해주세요." maxlength="1400"></textarea>
                    </div>
                </div>

                <div class="row4">게시글 글자수 확인(최대 1400자) : 현재 <span class="inputCount"> 1234 </span>글자 입력 중...</div>

                <div class="row5"><button>게시글 작성 완료</button></div>

            </form>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardInsert.js"></script>

</body>
</html>