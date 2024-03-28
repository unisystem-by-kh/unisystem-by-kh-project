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
<title>1:1 문의</title>

<link rel="stylesheet" href="/resources/css/style-main.css">
<link rel="stylesheet" href="/resources/css/board/inquiryBoardList.css">
</head>
<body>
	<main>

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<c:if test="${!empty param.key}">
            <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
        </c:if>
        
		<section class="main-title">
			<div id="title">
				<h1>1 : 1 문의</h1>
			</div>
			<form  action="/board/4" method="get">
				<label>
					<div id="search">
						<input type="hidden" name="key" value="w">
						<input type="text" placeholder="작성자로 검색" name="query">
						<button>
							<img src="/resources/images/board/search.png" id="searchicon">
						</button>
					</div>
				</label>
			</form>
		</section>
		<c:if test="${!empty param.query}">
			<h3 style="margin: 30px 100px">"${param.query}" 검색결과</h3>
		</c:if>
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
				<c:choose>
					<c:when test="${empty boardList}">
						<!-- 조회된 게시글 목록이 비어있거나 null인 경우 -->

						<!-- 게시글 목록 조회 결과가 비어있다면 -->
						<tr>
							<th colspan="5">게시글이 존재하지 않습니다.</th>
						</tr>
					</c:when>
					<c:otherwise>
						<!-- 게시글 목록 조회 결과가 있다면 -->
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.boardNo}</td>
								<td>

									
									<!-- ${boardCode} : @PathVariable로 request scope에 추가된 값 --> 
									<c:choose>
										<c:when test="${board.boardSt == 'D' }">
											<a href="/board/${categoryNo}/${board.boardNo}?cp=${pagination.currentPage}${sp}" id="boardTitle-con">${board.boardContent}</a>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${fn:substring(loginMember.memberNo, 0, 2) == '03'}">
													<a href="/board/${categoryNo}/${board.boardNo}?cp=${pagination.currentPage}${sp}" id="boardTitle-con">'${board.memberName}'님의 문의글입니다.</a>🔒
												</c:when>
												<c:otherwise>
													<a data="${board.boardNo}" onclick=modal(this)>'${board.memberName}'님의 문의글입니다.</a>🔒
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${board.memberName}</td>
								<td>${board.boardCDate}</td>
								<c:choose>
									<c:when test="${board.replyCount == 0}">
										<td>[답변대기]</td>
									</c:when>
									<c:otherwise>
										<td>[답변완료]</td>
									</c:otherwise>
								</c:choose>
							</tr>

						</c:forEach>
					</c:otherwise>

				</c:choose>
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
		<c:if test="${fn:substring(loginMember.memberNo, 0, 2) == '01'}" >
			<div class="btn-area">
				<a href="/board/${categoryNo}/write" id="btn">문의하기</a>
			</div>
		</c:if>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>


	<div class="modal-back">
            <div class="pw-modal">
                <div class="pw-modal-area">
                    <h1>비밀번호 확인</h1>
					<span id="closeBtn">&times;</span>
                </div>
                <div class="pw-modal-write">
                    <p>비밀글 기능으로 보호된 게시글입니다.</p>
                    <p>작성자와 관리자만 열람하실 수 있습니다. 본인이라면 비밀번호를 입력해주세요.</p>
                </div>
                <div class="pw-modal-input">
                    <input type="password"  id="modal-pw">
                    <button type="submit" id="modalBtn">확인</button>
                </div>
            </div>
    </div>

	<script src="/resources/js/board/inquiryBoard/inquiryBoardList.js"></script>
	<script>
		
	</script>
</body>
</html>