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
					<h2>시간표 조회</h2>
				</div>

				<div class="search-area">
					<form action="">
						<span>학과</span> <input type="text" value="${loginMember.departmentName}" readonly>

						<span>학번</span> <input type="text" value="${loginMember.memberNo}" readonly>

						<span>성명</span> <input type="text" value="${loginMember.memberName}" readonly> 
						<%--  <div class="select">
						<select	name="grade" id="">
							<option value="">1학년</option>
							<option value="">2학년</option>
							<option value="">전체</option>
						</select>
						</div>

						 <div class="select">
						 <select name="step" id="">
							<option value="">1학기</option>
							<option value="">2학기</option>
							<option value="">전체</option>
						</select>
						</div> --%>

					</form>
				</div>

				<div class="stu-board">
					<div class="schedule-btn-area">
						<button id="schedule-btn">출력</button>
					</div>
					<div class="schedule-area">
						<table class="schedule" id="table">
							<thead>
								<tr>
									<th>교시</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
								</tr>
							</thead>
							<tbody>


							<c:forEach var="i" begin='1' end='8'>
									<tr>
										<td>${i}교시</td>

										<td>
											<c:forEach items="${myClassList}" var="myC" varStatus="st">
											
												<c:if test="${fn:contains(myC.classDay,'월')}">

													<c:if test="${myC.classStart <= i && myC.classEnd >= i}" >
														${myC.className}
													</c:if>
													
												</c:if>

											</c:forEach>
										</td>
										<td>
											<c:forEach items="${myClassList}" var="myC" varStatus="st">
											
												<c:if test="${fn:contains(myC.classDay,'화')}">

													<c:if test="${myC.classStart <= i && myC.classEnd >= i}" >
														${myC.className}
													</c:if>

												</c:if>

											</c:forEach>
										</td>
										<td>
											<c:forEach items="${myClassList}" var="myC" varStatus="st">
											
												<c:if test="${fn:contains(myC.classDay,'수')}">

													<c:if test="${myC.classStart <= i && myC.classEnd >= i}" >
														${myC.className}
													</c:if>

												</c:if>

											</c:forEach>
										</td>
										<td>
											<c:forEach items="${myClassList}" var="myC" varStatus="st">
											
												<c:if test="${fn:contains(myC.classDay,'목')}">

													<c:if test="${myC.classStart <= i && myC.classEnd >= i}" >
														${myC.className}
													</c:if>

												</c:if>

											</c:forEach>
										</td>
										<td>
											<c:forEach items="${myClassList}" var="myC" varStatus="st">
											
												<c:if test="${fn:contains(myC.classDay,'금')}">

													<c:if test="${myC.classStart <= i && myC.classEnd >= i}" >
														${myC.className}
													</c:if>

												</c:if>

											</c:forEach>
										</td>
										
									</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
	</main>
	<script src="/resources/js/collegian/nav.js"></script>



</body>


</html>