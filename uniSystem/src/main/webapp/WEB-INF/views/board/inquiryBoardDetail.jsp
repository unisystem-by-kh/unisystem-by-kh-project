<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${categoryList}" var="categoryType">
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

	<main>
	
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
                                    download="${board.fileList[0].boardFileOriginal}">${board.fileList[0].boardFileRename}</a> 
			</c:if>
			<c:if test="${empty board.fileList}">
	        	<div>첨부된 파일이 없습니다.</div>

			</c:if>
	    </div>
	    <div class="update-delete-btn">
	        <button type="">수정</button>
	        <button>삭제</button>
	    </div>
	
	    <div class="reply-area">
	        <h1>답변</h1>
	    </div>
	    <div class="reply-nick">
	        <div>답변자 : 관리자</div>
	        <div>답변일 : 2024.02.23</div>
	    </div>
	    <div class="reply-title">
	        <div>제목 : [RE]문의내용</div>
	    </div>
	    <div class="reply-content">
	        <div>
	            asdasdasdsadasdsad
	        </div>
	    </div>
	
	    <form>
	        <div class="reply-write">
	            <textarea placeholder="답변을 작성해주세요.">
	    
	            </textarea>
	            <button >답변작성</button>
	        </div>
	    </form>
	
	    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>


	 <script>

        // JSP에서 작성 가능한 언어/라이브러리
        // -> html, css, js, java, EL, JSTL

        // JSP 해석 우선 순위 : java/EL/JSTL > HTML, CSS, JS

        // 게시글 번호 전역 변수로 선언
        const boardNo = "${board.boardNo}";
        
        const categoryNo = "${categoryType.CATEGORY_NO}";
       
		console.log(categoryNo)
		
        const loginMemberNo = "${loginMember.memberNo}"

    </script>
</body>
</html>