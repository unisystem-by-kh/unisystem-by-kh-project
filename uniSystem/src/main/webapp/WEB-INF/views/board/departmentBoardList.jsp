<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/departmentBoardList.css">
</head>
<body>
	
	<main>
	
	    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	    <div class="depart-area">
	        <div>
	            <h1>학과 공지</h1>
	        </div>
	        <div>
	            <a href="/board/departmentBoardWrite">공지 등록</a>
	        </div>
	    </div>
	    <form>
	        <div class="select-search-area">
	            <div>
	                <select value="depart" >
	                    <option value="" selected disabled hidden>전체</option>
	                    <c:forEach items="${deptCodeList}" var="deptCode">
                            <option value="${deptCode.DEPARTMENT_NO}">${deptCode.DEPARTMENT_NAME}</option>
                        </c:forEach>
	                </select>
	            </div>
	            <div>
	                <input type="search" placeholder="제목 검색">
	            </div>
	        </div>
	    </form>
	    <table class="depart-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>학과</th>
	                <th>작성일</th>
	                <th>조회수</th>
	            </tr>
	        </thead>
	        <tbody>
			<c:forEach var="board" items="${boardList}">
	            <tr>
	                <td>${board.boardNo}</td>
	                <td><a href="/board/${categoryNo}/${board.boardNo}?cp=${pagination.currentPage}${sp}">${board.boardTitle}</a></td>
	                <td>${board.departmentName}</td>
	                <td>${board.boardCDate}</td>
	                <td>${board.readCount}</td>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
	<div class="pagi">
			<ul>
				<!-- 첫 페이지로 이동 -->
				<li><a href="/board/${categoryNo}?cp=1${sp}">&lt;&lt;</a></li>

				<!-- 이전 목록 마지막 번호로 이동 -->
				<li><a
					href="/board/${categoryNo}?cp=${pagination.prevPage}${sp}">&lt;</a></li>


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
							<li><a href="/board/${categoryNo}?cp=${i}${sp}">${i}</a></li>

						</c:otherwise>
					</c:choose>
				</c:forEach>


				<!-- 다음 목록 시작 번호로 이동 -->
				<li><a
					href="/board/${categoryNo}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

				<!-- 끝 페이지로 이동 -->
				<li><a
					href="/board/${categoryNo}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

			</ul>
		</div>
	    
	
	    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>
</body>
</html>