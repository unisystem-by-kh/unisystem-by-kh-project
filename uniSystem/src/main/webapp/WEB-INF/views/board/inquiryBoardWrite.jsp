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
<link rel="stylesheet" href="/resources/css/board/inquiryBoardWrite.css">
</head>
<body>

	<main>

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<form action="/board/${categoryNo}/write" method="POST" id="boardWriteFrm"  enctype="multipart/form-data">

			<div class="boardName">
				<h1>1 : 1 문의</h1>
			</div>
			<div class="boardTop">
				<div>신청인</div>
				<div>${loginMember.memberName}</div>
				<div>학과</div>
				<div>${loginMember.departmentName}</div>
			</div>
			<div class="boardEmail">
				<div>이메일</div>
				<div>${loginMember.memberEmail}</div>
			</div>
			<div class="boardTitle">
				<div>제목</div>
				<input type="text" name="boardTitle" >
			</div>
			<div class="boardContent">
				<div>내용</div>
				<textarea name="boardContent" ></textarea>
			</div>
			<div class="boardFile">
				<div>첨부파일</div>
				<div>
                    <input type="file" id="file" name="file">
				</div>
			</div>
			<div class="boardOpen">
				<div>공개여부</div>
				<div>
					<div>
						공개 <input type="radio" name="boardSt" value="D" id="open"> 
						비공개 <input type="radio" name="boardSt" value="N" id="open">
					</div>
					<div>본인의 게시글을 타인에게 보이고 싶지 않을 경우에는 '비공개'를 선택하세요.</div>
				</div>
			</div>

			<div class="btnArea">
				<button type="submit">등록하기</button>
			</div>
		</form>
			<div class="btnArea">
				<button id="goToListBtn">취소</button>
			</div>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>


	<script>
	const boardNo = "${board.boardNo}";
	</script>

	<script src="/resources/js/board/inquiryBoard/inquiryBoardDetail.js"></script>
	<script src="/resources/js/board/inquiryBoard/inquiryBoardWrite.js"></script>
</body>
</html>