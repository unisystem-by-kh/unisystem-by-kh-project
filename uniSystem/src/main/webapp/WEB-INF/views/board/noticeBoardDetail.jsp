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
    <link rel="stylesheet" href="/resources/css/board/noticeBoardDetail.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />
     <div class="container">
        <div class="announcement">
            <h2>공지사항</h2>
        </div>

        <div class="title">
            <p>제 목</p>
            <span id="contentTitle">2024학년도 정시모집 3차(최종)</span>
        </div>

        <div class="writer">
            <p>구 분</p>
            <span id="WriterName">인사공지</span>
        </div>

        <div class="content">
            <p>내 용</p>
            <span id="outputContent"></span>
        </div>

        <div class="uploadFile">
            <p>첨부파일</p>
            <span id="uploadName" value>선택된 파일 없음</span>
        </div>

        <div class="comment">
            <p>댓글쓰기</p>
            <input type="text" name="conmment" placeholder="댓글을 입력해주세요.">
            <button id="commentBtn">등 록</button>
        </div>

        <div class="commentList">
            
        </div>
        


    </div>


    </main>

    <script src="/resources/js/header.js"></script>

</body>
</html>