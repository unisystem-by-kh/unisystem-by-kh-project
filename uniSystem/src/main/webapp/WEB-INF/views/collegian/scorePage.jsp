<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>시간표 조회</title>

<link rel="stylesheet" href="/resources/css/style-main.css">
<link rel="stylesheet" href="/resources/css/collegian/collegian-style.css">

<script src="https://kit.fontawesome.com/9cd918496e.js"	crossorigin="anonymous"></script>

</head>
<body>

	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="main">
			<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />

			<div class="stu-container">
            <div class="stu-header">
                <h2>학점 조회</h2>
            </div>

				<h4>📣 강의 평가는 제출 후 수정이 불가 합니다.</h4>
            <div class="stu-board">
                <table>
                    <tr>
                        <th>학년</th>
                        <th>학기</th>
                        <th>과목명</th>
                        <th>분류</th>
                        <th>학점</th>
                        <th>담당교수</th>
                        <th>점수</th>
                        <th>강의 평가</th>
                    </tr>

					<c:choose>
					   <c:when test="${!empty score}">
					   		<c:forEach items="${score}" var="sc">
								<tr>
									<td>${sc.lectureGrade}</td>
									<td>${sc.lectureTerm}</td>
									<td>${sc.classNm}</td>
									<td>${sc.classType}</td>
									<td>${sc.classPoint}</td>
									<td>남궁성</td>
									<td>${sc.realPoint}</td>
									<td>
										<c:choose>
										   <c:when test="${sc.rateFlag == 'Y'}">
										   		<button>평가완료</button>
										   </c:when>
										   <c:otherwise>
												<button onclick="submitTask(this)">제출하기</button>
										   </c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
					   </c:when>
					   <c:otherwise>
					   			<tr>
									<td colspan="10">조회할 성적 목록이 존재하지 않습니다.
									</td>
								</tr>
					   </c:otherwise>
					</c:choose>
                </table>
            </div>
			
	</main>

    <!-- 모달 -->
        <div class="modal" id="modal">
            <div class="modal_body">
                <div class="m_head">
                    <div class="modal_title">강의 평가</div>
                    <div class="close_btn " id="close_btn" onclick = notShow()>X</div>
                </div>
                <div class="m_body">
                    <div class="modal_label" id="name_box"><h2></h2></div>
					
                <form action="/collegian/insertRate" method="POST" id="insertRate" onsubmit= "return taskSubmitValidation()">
                    <input type="hidden" name="taskNo" id="task_no" />

					<div class="modal_label"><h3>1. 해당 강의의 수업 방식은 어떠하였습니까?</h3></div>

					<div class="like-area">
						<label>매우 만족<input type="radio" name="lateLike" value="5"><label>
						<label>만족<input type="radio" name="lateLike" value="4"><label>
						<label>보통<input type="radio" name="lateLike"value="3"><label>
						<label>불만족<input type="radio" name="lateLike" value="2"><label>
						<label>매우 불만족<input type="radio" name="lateLike" value="1"><label>
					</div>

					<div class="modal_label"><h3>2. 해당 내용을 선택한 이유를 작성해주세요.</h3></div>

					<textarea name="content" id="" cols="100" rows="8" placeholder="내용을 입력해주세요."></textarea>
                </div>
                <div class="m_footer">
                    <div class="modal_btn cancle" id="close_btn" onclick = notShow()>CANCLE</div>
                    <div class="modal_btn save" id="save_btn"><button type="submit">SAVE</button></div>
                </div>
                </form>
            </div>
        </div>

    <script src="/resources/js/collegian/score.js"></script>
	<script src="/resources/js/collegian/nav.js"></script>

</body>


</html>