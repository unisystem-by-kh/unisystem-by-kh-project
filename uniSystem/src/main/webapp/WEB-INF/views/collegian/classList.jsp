<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교과목 조회</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/collegian/collegian-style.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
    
</head>
<body>

	<c:set var="classList" value="${map.classList}"/>
	<c:set var="pagination" value="${map.pagination}"/>
	<c:set var="department" value="${map.departmentList}"/>

	 <main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	 
	 	<div class="main">
	 		<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />
	        
	        <div class="stu-container">
	            <div class="stu-header">
	                <h2>교과목 조회</h2>
	            </div>
	
	            <div class="search-area">
	                <form action="/collegian/classList">
						<div class="select">
							<select name="major" id="">
								<c:forEach items="${department}" var="d">
									<option value="${d.departmentNo}">${d.departmentName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="select">
							<select name="grade" id="">
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년</option>
								<option value="0">전체</option>
							</select>
						</div>
						<div class="select">
							<select name="step" id="">
								<option value="1">1학기</option>
								<option value="2">2학기</option>
								<option value="0">전체</option>
							</select>
						</div>
						<div class="select">
							<select name="type" id="">
								<option value="0">전체</option>
								<option value="3">전공</option>
								<option value="2">교양</option>
							</select>
						</div>
	                    <label for="" class="query-label">
	                        <input type="text" name="query" placeholder="검색할 과목명을 입력해주세요.">
	                        <button type="submit"><img src="/resources/images/collegian/search.png" alt=""></button>
	                    </label>
	                </form>
	            </div>
	
	            <div class="stu-board">
	                <table id="ajax-area">
	                    <tr>
	                        <th>No.</th>
	                        <th>학과명</th>
	                        <th>학년</th>
	                        <th>학기</th>
	                        <th>과목명</th>
	                        <th>분류</th>
	                        <th>학점</th>
	                        <th>담당교수</th>
	                    </tr>

						<c:choose>
						   <c:when test="${empty classList}">
								<tr>
									<td colspan ="8" style="text-align: center;">과목이 존재하지 않습니다.</td>
								</tr>
						   </c:when>

						   <c:otherwise>
									<c:forEach items="${classList}" var="cl">
										<tr>
											<td>${cl.classNo}</td>
											<td>${cl.departmentName}</td>
											<td>${cl.classGrade}학년</td>
											<td>${cl.classTrem}학기</td>
											<td>${cl.className}</td>
											<c:if test="${cl.classPoint == 2}" >
												<td>교양</td>
											</c:if>
											<c:if test="${cl.classPoint == 3}" >
												<td>전공</td>
											</c:if>
											<td>${cl.classPoint}</td>
											<td>${cl.memberName}</td>
										</tr>
									</c:forEach>
						   </c:otherwise>
						</c:choose>
					
						
						
	                    
	                </table>
            
                
            	</div>

	            <div class="pagination-area">
	                <div class="pagination">
	                    <a href="#">&laquo;</a>
						
						<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

							<c:choose>
								<c:when test="${i == pagination.currentPage}">
									<a class="active">${i}</a>
								</c:when>
							   <c:otherwise>
									<a href="#">{i}</a>
							   </c:otherwise>
							</c:choose> 
						</c:forEach>

	                    <a href="#">&raquo;</a>
                </div>
            </div>
        </div>
	 	
	 	</div>
        
    </main>
	<script>
		
	</script>
	<script src="/resources/js/collegian/collegian.js"></script>
</body>


</html>