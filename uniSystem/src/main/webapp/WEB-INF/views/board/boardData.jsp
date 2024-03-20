<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pagination" value="${map.pagination}" />
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

        <c:if test="${fn:substring(loginMember.memberNo,0,2) != '01'}" >
            <div class="write">
                <a href="#">자료실 업로드</a>
            </div>
        </c:if>

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
                <c:forEach var="i" items="${map.boardList}">
                    <tr class="tableTr">
                        <td>${i.boardNo}</td>
                        <td>${i.boardTitle}</td>
                        <td>${i.memberName}</td>
                        <td>${i.boardCDate}</td>
                        <td>${i.boardCount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagi">
			<ul>
				<!-- 첫 페이지로 이동 -->
				<li><a href="/board/${categoryNo}?cp=1">&lt;&lt;</a></li>

				<!-- 이전 목록 마지막 번호로 이동 -->
				<li><a
					href="/board/${categoryNo}?cp=${pagination.prevPage}">&lt;</a></li>


				<!-- 특정 페이지로 이동 -->
				<c:forEach var="i" begin="${pagination.startPage}"
					end="${pagination.endPage}" step="1">
					<c:choose>
						<c:when test="${i == pagination.currentPage}">
							<!-- 현재 보고있는 페이지 -->
							<li><a id="current">${i}</a></li>

						</c:when>
						<c:otherwise>
							<!-- 현재 페이지를 제외한 나머지 -->
							<li><a href="/board/${categoryNo}?cp=${i}">${i}</a></li>

						</c:otherwise>
					</c:choose>
				</c:forEach>


				<!-- 다음 목록 시작 번호로 이동 -->
				<li><a
					href="/board/${categoryNo}?cp=${pagination.nextPage}">&gt;</a></li>

				<!-- 끝 페이지로 이동 -->
				<li><a
					href="/board/${categoryNo}?cp=${pagination.maxPage}">&gt;&gt;</a></li>

			</ul>
		</div>


        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/dataBoard/dataBoardList.js"></script>

</body>
</html>