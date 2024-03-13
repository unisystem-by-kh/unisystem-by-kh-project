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
    <link rel="stylesheet" href="/resources/css/board/noticeReply.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>

<body>

<main>
    <div class="commentArea">
        <div class="count">
            <p>댓글</p>
            <span id="replyCount" >12</span>
        </div>

        <div class="replyContent">
            <div class="replyCotent1">
            <span id="replyId">아이디</span>
            <span id="replyTime">02.28 15:20</span>
            </div>

            <div class="replyContent2">
            <textarea id="replyText">adsdfasdfads</textarea>
            </div>
        </div>
        
        <div class="btnArea">
            <button>수정</button>
            <button>삭제</button>
        </div>

        </div>


</main>

    <script src="/resources/js/header.js"></script>

</body>
</html>