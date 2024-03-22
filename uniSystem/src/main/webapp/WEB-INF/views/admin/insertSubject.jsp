<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교과목 등록</title>
    
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/admin/subjectWrite.css">

</head>
<body>
	
	<main>
	
		<jsp:include page="/WEB-INF/views/common/header.jsp" />	
		
        <div class="container">
            <h2>교과목 등록</h2>
            <form action="insert" method="post" id="insertFrm">

                <div class="form-group">
                    <label for="departmentName">학과</label>
                    <select name="departmentNo" id="departmentNo">
                        <option value="0">전체</option>
                        <c:forEach items="${deptCodeList}" var="deptCode">
                            <option value="${deptCode.DEPARTMENT_NO}">${deptCode.DEPARTMENT_NAME}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="professor">담당 교수</label>
                    <input type="text" id="teacher" name="memberName" placeholder="담당 교수님을 입력해주세요." autocomplete="off">
                    <div class="resultSet-area">
                        <p id="x-btn">&times;</p>
                        <ul id="resultSet" class="resultSet"></ul>
                    </div>
                </div>

                <div class="form-group">
                    <label for="className">과목명</label>
                    <input type="text" id="className" name="className" placeholder="과목명을 입력해주세요.">
                </div>

                <div class="form-group">
                    <label for="classPoint">강의 학점</label>
                    <input type="text" id="classPoint" name="classPoint" placeholder="전공:3 교양:2" maxlength="1">
                </div>

                <div class="form-group">
                    <label for="classMax">수강 정원</label>
                    <input type="text" id="classMax" name="classMax" placeholder="최대 수강 인원을 입력해주세요." maxlength="3">
                </div>

                <div class="form-group">
                    <label>강의 학기</label>
                    <select name="classGrade" id="grade">
                        <option value="0">학년</option>
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                    </select>
                    <select name="classTrem" id="semester">
                        <option value="0">학기</option>
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                    </select>
                    <!-- <input type="text" id="semester" name="semester" > -->
                </div>

                <div class="form-group">
                    <label for="classDay">강의 요일</label>
                    <select name="classDay" id="classDay">
                        <option value="0">요일</option>
                        <option value="월">월</option>
                        <option value="화">화</option>
                        <option value="수">수</option>
                        <option value="목">목</option>
                        <option value="금">금</option>
                    </select>
                    <!-- <input type="text" id="lectureDay" name="lectureDay" > -->
                </div>

                <div class="form-group" id="classTime-area">
                    <label for="classTime">강의 시간</label>
                    <input type="text" id="classStart" name="classStart" placeholder="시작">교시
                    <input type="text" id="classEnd" name="classEnd" placeholder="마치는">교시
                    <button type="button" id="checkTime">시간 체크</button>
                </div>

                <div class="btn-area">
                    <button type="reset">초기화</button>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
        
    	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
        
    </main>
    
    <script src="/resources/js/admin/insertSubject.js"></script>
    
</body>
</html>