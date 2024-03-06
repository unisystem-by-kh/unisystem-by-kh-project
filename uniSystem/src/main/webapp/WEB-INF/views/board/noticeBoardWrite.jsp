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

        <div class="title">
            <p>제&nbsp;&nbsp;&nbsp;목</p>
            <input type="text"  name="inputTitle"  placeholder="제목을 입력해주세요">
        </div>

        <div class="division">

            <p>구&nbsp;&nbsp;&nbsp;분</p>
            <select>
                <option>인사공지</option>
                <option>학사공지</option>
            </select>
        </div>

        <div class="content">
            <p>내&nbsp;&nbsp;&nbsp;용</p>
            <textarea type="text" name="inputContent" placeholder="내용을 입력하세요"></textarea>
        </div>

        <div class="uploadFile">
            <p>첨부파일</p>
            <input type="button" id="uploadBtn" value="파일선택">
            <span id="uploadName" value>선택된 파일 없음</span>
        </div>

        

        <div class="saveCancle">
            <input type="button" id="savaBtn" value="등 록">
            <input type="button" id="cancleBtn" value="취 소">
        </div>

        

    </div>


    <jsp:include page="댓글.html"></jsp:include>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</main>

    <script src="/resources/js/header.js"></script>

</body>
</html>