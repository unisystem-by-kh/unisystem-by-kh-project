<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/inquiryBoardWrite.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <form>

        <div class="boardName">
            <h1>1 : 1 문의</h1>
        </div>
        <div class="boardTop">
            <div>신청인</div>
            <div>유저일</div>
            <div>학과</div>
            <div>경영학과</div>
        </div>
        <div class="boardEmail">
            <div>이메일</div>
            <div>user01@kh.or.kr</div>
        </div>
        <div class="boardTitle">
            <div>제목</div>
            <input type="text" name="title">
        </div>
        <div class="boardContent">
            <div>내용</div>
            <textarea id=""></textarea>
        </div>
        <div class="boardFile">
            <div>첨부파일</div>
            <div><input type="file" id="file"></div>
        </div>
        <div class="boardOpen">
            <div>공개여부</div>
            <div>
                <div>
                    공개 <input type="radio" name="open" value="open">
                    비공개 <input type="radio" name="open" value="notopen">
                </div>
                <div>본인의 게시글을 타인에게 보이고 싶지 않을 경우에는 '비공개'를 선택하세요.</div>
            </div>
        </div>
    
        <div class="btnArea">
            <button type="submit">등록하기</button>
            <button>취소</button>
        </div>
    </form>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>