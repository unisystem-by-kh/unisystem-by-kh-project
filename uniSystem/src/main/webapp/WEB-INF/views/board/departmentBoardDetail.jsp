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
			<h1>학과 공지</h1>
		</div>
		<div class="date-con">
			<div>작성일 : 2024.02.22</div>
			|
			<div>수정일 : 2024.02.23</div>
			|
			<div>작성자 : 관리자</div>
			|
			<div>조회수 : 1</div>
		</div>
		<div class="title-con">
			<div>제목</div>
		</div>
		<div class="image-con"></div>
		<div class="content-con"></div>
		<div class="file-button">
			<div>첨부파일 :</div>
			<div>첨부된 파일이 없습니다.</div>
			<div>
				<button>수정</button>
				<button>삭제</button>
			</div>
		</div>

		<div class="reply-con">
			<h1>댓글</h1>
		</div>
		<div class="reply-content-con">
			<textarea></textarea>
			<button>등록</button>
		</div>

		<div class="dat-con">
			<div>댓글 1</div>
		</div>
		<div class="dat-info">
			<div>이름 : 유저일</div>
			|
			<div>학과 : 경영학과</div>
			|
			<div>작성일 : 2024.02.23</div>
		</div>
		<div class="dat-con">
			<div>댓글 1</div>
		</div>
		<div class="dat-info">
			<div>이름 : 유저일</div>
			|
			<div>학과 : 경영학과</div>
			|
			<div>작성일 : 2024.02.23</div>
		</div>
		<div class="goto">
			<button>목록으로</button>
		</div>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>
</body>
</html>