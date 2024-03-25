<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="lateList" value="${map.lateList}"/>
<c:set var="classList" value="${map.classList}"/>

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
		
		<form class="select" action="/late" id="selectForm">
			<div>
				<select value="select" id="classSelect" name="key">
					<option value="">과목명</option>
					<c:if test="${!empty classList}" >
						<c:forEach items="${classList}" var="c">
							<option>${c.className}</option>
						</c:forEach>
					</c:if>
					<%-- <option value="1">Java</option>
					<option value="2">Html</option>
					<option value="3">CSS</option> --%>
				</select>
			</div>
			<div>
				<button>조회</button>
			</div>
			<c:if test="${!empty param.key}" >
				<h3>"${param.key}" 평가</h3>
			</c:if>
		</form>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>만족도</th>
					<th>내용</th>
					<c:if test="${fn:substring(loginMember.memberNo, 0, 2) == '03'}" >
						<th>담당 교수</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
			<c:choose>
                   <c:when test="${empty lateList}">
                    <tr>
                        <th colspan="4">평가가 존재하지 않습니다.</th>
                    </tr>
                   </c:when>
                
                   <c:otherwise>

                        <c:forEach var="late" items="${lateList}" >
                            <tr>
                                <td>${late.lateNo}</td>
								
                                <td>
									<c:if test="${late.lateLike == 5}" >
										<span title="매우 만족">☺️</span>
									</c:if>
									<c:if test="${late.lateLike == 4}" >
										<span title="만족">🙂</span>
									</c:if>
									<c:if test="${late.lateLike == 3}" >
										<span title="보통">😐</span>
									</c:if>
									<c:if test="${late.lateLike == 2}" >
										<span title="불만족">😕</span>
									</c:if>
									<c:if test="${late.lateLike == 1}" >
										<span title="매우 불만족">😠</span>
									</c:if>
								</td>
                                <td>${late.lateContent}</td>
								<c:if test="${fn:substring(loginMember.memberNo, 0, 2) == '03'}" >
                                	<td>${late.memberName}</td>
								</c:if>			
                            </tr>
                        </c:forEach>
                   </c:otherwise>
                </c:choose>

			</tbody>
		</table>

		<div class="pagi">
			<ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/late?cp=1">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/late?cp=${pagination.prevPage}">&lt;</a></li>

                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <!-- 현재 보고있는 페이지 -->
                                <li><a id="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <li><a href="/late?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/late?cp=${pagination.nextPage}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/late?cp=${pagination.maxPage}">&gt;&gt;</a></li>
                </ul>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>

	<script src="/resources/js/header.js"></script>
	<script>
		const selectForm = document.getElementById("selectForm");
		const classSelect = document.getElementById("classSelect");
		const options = document.querySelectorAll("#classSelect > option");

		(()=>{
			const params = new URL(location.href).searchParams;
			const key = params.get("key");

			if(key != null){
				for(let op of options){
					if(key == op.value){
						op.selected = true;
					}
				}
			}
		})();

		selectForm.addEventListener("submit", e =>{
			
			if(classSelect.value == ""){
				e.preventDefault();
				location.href = location.pathname;
			}

		})
	</script>

</body>
</html>