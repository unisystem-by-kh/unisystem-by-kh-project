<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/inquiryBoardList.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <section class="main-title">
        <div id="title">
            <h1>1 : 1 문의</h1>
        </div>
        <label>
            <div id="search">
                <input type="text" placeholder="작성자로 검색">
                <button><img src="/resources/images/board/search.png" id="searchicon"></button>
            </div>
        </label>
    </section>
    <table class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목(공개여부)</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>답변여부</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>
            <tr>
                <td>100</td>
                <td><a href="/board/inquiryBoardDetail">유저일님의 문의내용입니다<img src="/resources/images/board/lock.png" id="rock"></a></td>
                <td>유저일</td>
                <td>2024.02.22</td>
                <td>[답변완료]</td>
            </tr>

        </tbody>
    </table>

    <div class="pagi">
        <ul>
            <li>&lt;&lt;</li>
            <li>&lt;</li>
            <li id="current">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li>&gt;</li>
            <li>&gt;&gt;</li>
        </ul>
    </div>
    <div class="btn-area">
        <a href="/board/inquiryBoardWrite" id="btn">문의하기</a>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>