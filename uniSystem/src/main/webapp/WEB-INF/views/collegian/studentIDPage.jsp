<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>시간표 조회</title>

	<link rel="stylesheet" href="/resources/css/style-main.css">
	<link rel="stylesheet"
		href="/resources/css/collegian/collegian-style.css">

	<script src="https://kit.fontawesome.com/9cd918496e.js"
		crossorigin="anonymous"></script>

</head>

<c:set var="myClassList" value="${map.myClassList}"/>

<body>

	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="main">
			<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />

			<div class="stu-container">
				<div class="stu-header">
					<h2>학생증 발급</h2>
				</div>
				

				<div class="stu-board pdf-area">
					<div class="updateBtn-area">
						<button id="updateBtn">재 발급</button>
					</div>
					
					<iframe src="${certificate.filePath}" title="${certificate.fileName}"
					 width="1000" height="500" frameborder="0" id="pdfViewer">
					 ${certificate.fileName}
					 </iframe>

					<%--  <a id="downBtn" href="${certificate.filePath}" download="${certificate.fileName}">
					 <img src="/resources/images/collegian/downBtn.png"/>
					 </a> --%>

					 
					</div>
			</div>
		</div>
			
	</main>

	<script>
		let no = location.href.split("?")[0].split("/")[5]

		document.getElementById("updateBtn").addEventListener("click", e=>{

			location.href = "/collegian/certificate/"+no+"?upNo=1";
		});

		window.onload = function(){

			history.replaceState({}, null, location.pathname)
			
		}
	</script>


</body>


</html>