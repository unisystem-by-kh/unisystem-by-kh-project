<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${categoryType}" var="categoryType">
    <c:if test="${categoryType.CATEGORY_NO == categoryNo}" >
        <c:set var="categoryName" value="${categoryType.CATEGORY_NAME}"/>
    </c:if>
</c:forEach>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/inquiryBoardDetail.css">
</head>
<body>

	<main class="main-con">
	
	    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	    <div class="boardname-area">
	        <h1>${categoryName}</h1>
	    </div>
	    <div class="title-date">
	        <div>제목 : ${board.boardTitle}</div>
	        <div>신청일 : ${board.boardCDate}</div>
	    </div>
	    <div class="nick-hak">
	        <div>신청인 : ${board.memberName }</div>
	        <div>학과 : ${board.departmentName}</div>
	    </div>
	    <div class="content-area">
	        <div>${board.boardContent}</div>
	    </div>
	    <div class="file-area">
	        <div>첨부 파일 :</div>

			<c:if test="${!empty board.fileList}">
				  <a href="${board.fileList[0].boardFilePath}${board.fileList[0].boardFileRename}"
                                    download="${board.fileList[0].boardFileOriginal}">${board.fileList[0].boardFileOriginal}</a> 
			</c:if>
			<c:if test="${empty board.fileList}">
	        	<div>첨부된 파일이 없습니다.</div>

			</c:if>
	    </div>
	    <div class="update-delete-btn">
		<c:if test="${loginMember.memberNo == board.memberNo}">
			<c:if test="${board.replyCount == 0}">
	        	<button id="updateBtn">수정</button>
			</c:if>
	        <button id="deleteBtn">삭제</button>
		</c:if>
			<button id="goToListBtn">목록으로</button>
	    </div>

		
		<div class="reply-area">
			<h1>답변</h1>
		</div>
		<c:if test="${board.replyCount == 0}">
			<c:if test="${fn:substring(loginMember.memberNo, 0, 2) == '03'}" >
				<div class="reply-write">
					<textarea placeholder="답변을 작성해주세요." id="replyWriteCon"></textarea>
					<button id="addReply">답변작성</button>
				</div>
			</c:if>
		</c:if>
		<div class="reply-nick">
			<div>답변자 : 관리자</div>
			<div>답변일 : 2024.02.23</div>
		</div>
		<div class="reply-title">
			<div>제목 : [RE]문의내용</div>
		</div>
		<div class="reply-content">
			<div id="content">
				asdasdasdsadasdsad
			</div>
		</div>
		<c:if test="${board.replyCount != 0}">
			<div class="button-container">
				<button id="replyUpBtn">수정</button>
				<button id="replyDeBtn">삭제</button>
			</div>
		</c:if>
	
	
	    
	
	    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>


	 <script>

        // JSP에서 작성 가능한 언어/라이브러리
        // -> html, css, js, java, EL, JSTL

        // JSP 해석 우선 순위 : java/EL/JSTL > HTML, CSS, JS


        // 게시글 번호 전역 변수로 선언
        const boardNo = "${board.boardNo}";
		console.log(boardNo)
        const categoryNo = "${board.categoryNo}";
		console.log(categoryNo)
       
		const boardTitle = "${board.boardTitle}"

    </script>

	<script src="/resources/js/board/inquiryBoard/inquiryBoardDetail.js"></script>
</body>
</html>