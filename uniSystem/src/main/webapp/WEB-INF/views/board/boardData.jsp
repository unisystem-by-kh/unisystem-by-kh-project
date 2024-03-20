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
    <link rel="stylesheet" href="/resources/css/board/boardData.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer con">

        <h1 class="dataTitle">자료실</h1>

        <div class="write">
            <a href="#">자료실 업로드</a>
        </div>

        <table>
            <thead>
                <tr class="tableHead">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr class="tableTr">
                    <td>1</td>
                    <td>샘플제목샘플제목</td>
                    <td>작성자1</td>
                    <td>2024-03-03</td>
                    <td>100</td>
                </tr>
                <tr class="tableTr">
                    <td>2</td>
                    <td>샘플 제목2</td>
                    <td>작성자2</td>
                    <td>2024-03-05</td>
                    <td>150</td>
                </tr>
                <c:forEach var="i" items="${map}">
                    <tr>
                        <td>${i.boardNo}</td>
                        <td>${i.boardTitle}</td>
                        <td>${i.memberName}</td>
                        <td>${i.boardCDate}</td>
                        <td>${i.boardUDate}</td>
                        <td>${i.boardCount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardInsert.js"></script>

</body>
</html>