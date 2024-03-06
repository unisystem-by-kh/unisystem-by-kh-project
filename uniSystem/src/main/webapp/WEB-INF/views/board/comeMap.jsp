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
    <link rel="stylesheet" href="/resources/css/board/comeMap.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <div class="map-area">

                <img src="https://ncondesign.com/wp-content/uploads/2023/01/naver-%EA%B4%91%ED%99%94%EB%AC%B8.jpg" alt="#">

            </div>

            <div class="info-area">

                <div>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F-6F</div>
                <div>TEL : 02-123-4657</div>
                <div>FAX : 02-123-4568</div>
                <div>지하철 2호선 역삼역 3번 출구 100M 도보 5분 거리 이내</div>

            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

</body>
</html>