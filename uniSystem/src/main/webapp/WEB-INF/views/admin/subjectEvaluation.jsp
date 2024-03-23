<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pagination" value="${map.pagination}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>평가 조회</title>

<link rel="stylesheet" href="/resources/css/style-main.css">
<link rel="stylesheet" href="/resources/css/admin/subjectEvaluation.css">

</head>
<body>

	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="main-top">
			<h1>강의 평가 목록</h1>
		</div>

		${map}

		<div class="select">
			<div>
				<select value="select">
					<option value="" selected disabled hidden>과목명</option>
					<option value="1">Java</option>
					<option value="2">Html</option>
					<option value="3">CSS</option>
				</select>
			</div>
			<div>
				<button>조회</button>
			</div>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>만족도</th>
					<th>내용</th>
					<th>담당 교수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>만족</td>
					<td>강의가실하네요</td>
					<td>김교수</td>
				</tr>
				<tr>
					<td>2</td>
					<td>매우 만족</td>
					<td>강의가 실하네요</td>
					<td>김교수</td>
				</tr>
				<tr>
					<td>3</td>
					<td>보통</td>
					<td>강의가 실하네요</td>
					<td>김교수</td>
				</tr>
				<tr>
					<td>4</td>
					<td>불만족</td>
					<td>강의가 실하네요</td>
					<td>김교수</td>
				</tr>
				<tr>
					<td>5</td>
					<td>보통</td>
					<td>강의가 실하네요</td>
					<td>김교수</td>
				</tr>
				<tr>
					<td>6</td>
					<td>매우 만족</td>
					<td>강의가 실하네요</td>
					<td>김교수</td>
				</tr>


			</tbody>
		</table>

		<div class="pagi">
			<ul>
				<li>&lt;&lt;</li>
				<li>&lt;</li>
				<li id="current">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li>&gt;</li>
				<li>&gt;&gt;</li>
			</ul>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>

	<script src="/resources/js/header.js"></script>

</body>
</html>