<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/departmentBoardWrite.css">
</head>
<body>
	
	<main>
	    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	        <form action="/board/${categoryNo}/${board.boardNo}/update" method="POST" id="writeForm" enctype="multipart/form-data">
	            <div class="depart-top">
	                <h1>학과 공지</h1>
	            </div>
	            <div class="depart-title-write">
	                <div>제목 : </div>
	                <div><input type="text" placeholder="제목을 입력하세요." name="boardTitle" value="${board.boardTitle}"></div>
	            </div>
	            <div class="depart-file-area">
	                <div>
	                    학과 : 
	                </div>
	                <div>
	                    ${loginMember.departmentName}
	                </div>
	                <div>
	                    첨부파일 : 
	                </div>
	                <div>
	                    <input type="file" name="file">
						${board.fileList[0].boardFileOriginal}
	                </div>
	            </div>
	            <div class="image-area">
	                <img class="imgArea" src="${board.fileList[1].boardFilePath}${board.fileList[1].boardFileRename}" />
	                이미지 : <input type="file" name="images"accept="image/*" class="inputImage">
					<span class="deleteImage">&times;</span> 
	            </div>
	            <div class="depart-content-area">
	                <textarea name="boardContent">${board.boardContent}</textarea>
	            </div>
	            <div class="email-shoot">
	                <div>이메일 발송여부 :</div>
	                <div>
	                    발송 <input  type="radio" name="shoot" value="1">
	                    미발송 <input  type="radio" name="shoot" value="2">
	                </div>
	            </div>
	            <div class="departButton">
	                <button>등록하기</button>
	                <button id="goToList">취소</button>
	            </div>
	    
	        </form>
	        
	
	        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	</main>

	<script src="/resources/js/board/departmentBoard/departmentBoardWrite.js"></script>
</body>
</html>