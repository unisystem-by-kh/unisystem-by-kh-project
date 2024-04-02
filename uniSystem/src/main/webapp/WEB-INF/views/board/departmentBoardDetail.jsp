<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/resources/css/style-main.css">
<link rel="stylesheet"
	href="/resources/css/board/departmentBoardDetail.css">
</head>
<body>
		<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="depart-detail">
			<h1>📢 학과 공지</h1> - ${board.departmentName}
		</div>
		<div class="date-con">
			<div>
				${board.boardTitle}
			</div>
			<div>
				👵🏿 ${board.memberName}  
				<c:if test="${empty board.boardUDate}">
				🕒 ${board.boardCDate} 
				</c:if>
				<c:if test="${!empty board.boardUDate}">
				🕒 ${board.boardUDate} 
				</c:if>
				👀 ${board.boardCount}
			</div>
			
		</div>
		
		<c:if test="${!empty board.fileList[1]}">
			<div class="image-con">
			<img src="${board.fileList[1].boardFilePath}${board.fileList[1].boardFileRename}">
			</div>
		</c:if>
		<c:if test="${empty board.fileList[1]}">

		</c:if>
		<div class="content-con">${board.boardContent}</div>
		<div class="file-button">
			<div>첨부파일 :</div>
			<c:if test="${!empty board.fileList}">
				💾<a href="${board.fileList[0].boardFilePath}${board.fileList[0].boardFileRename}"
                                    download="${board.fileList[0].boardFileOriginal}">${board.fileList[0].boardFileOriginal}</a> 
			</c:if>
			<c:if test="${empty board.fileList}">
	        	<div>💾첨부된 파일이 없습니다.</div>

			</c:if>
		</div>
		<div class="button-area">
			<c:if test="${loginMember.memberNo == board.memberNo}">
				<button type="button" id="updateBtn">수정</button>
				<button id="deleteBtn">삭제</button>
			</c:if>
			<button id="goToListBtn">목록으로</button>
		</div>

		<div class="reply-con">
			<h1>💬 댓글</h1>
		</div>
		<div class="reply-content-con">
			<textarea id="replyWriteCon" placeholder="댓글을 입력하세요"></textarea>
			<button id="addReply">등록</button>
		</div>
		<div id="reply-area">
			<div class="dat-con">
				<div>댓글 1</div>
			</div>
			<div class="dat-info">
				<div>이름 : 유저일</div>
				|
				<div>작성일 : 2024.02.23</div>
			</div>
			<div class="button-container">
				<button type="button" id="replyUpBtn">수정</button>
				<button  id="replyDeBtn">삭제</button>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>

	<script>

        // JSP에서 작성 가능한 언어/라이브러리
        // -> html, css, js, java, EL, JSTL

        // JSP 해석 우선 순위 : java/EL/JSTL > HTML, CSS, JS


        // 게시글 번호 전역 변수로 선언
        const boardNo = "${board.boardNo}";
        const categoryNo = "${board.categoryNo}";

		const boardTitle = "${board.boardTitle}"

    </script>

	<script src="/resources/js/board/departmentBoard/departmentBoardDetail.js"></script>
</body>
</html>