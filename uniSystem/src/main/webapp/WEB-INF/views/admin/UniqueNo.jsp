<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/admin/UniqueNo.css">
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container">
            <div class="title">
                <h2>교번 및 학번 생성</h2>
            </div>
            <div class="checkList">
                <label for="radio3">교직원</label>
                <input type="radio" id="radio3" name="radios">
                <label for="radio1">교번(교수)</label>
                <input type="radio" id="radio1" name="radios">
                <label for="radio2">학번(학생)</label>
                <input type="radio" id="radio2" name="radios">
            </div>

            <form id="generateForm">
                <div class="input-group">
                    <!-- 이름 입력 -->
                    <label for="memberName">이름</label>
                    <input type="text" id="memberName" name="memberName">
                </div>
                
                <div id="departmentGroup" class="input-group">
                    <!-- 학과 입력 -->
                    <label for="department">학과</label>
                    <select id="department" name="department">
                        <option value="">------ 선택 ------</option>
                        <c:forEach items="${deptCodeList}" var="deptCode">
                            <option value="${deptCode.DEPARTMENT_NO}">${deptCode.DEPARTMENT_NAME}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="input-group">
                    <!-- 주민등록번호 입력 -->
                    <label for="ssn">주민등록번호</label>
                    <input type="text" id="ssn" name="memberSsn" placeholder="ex) 000000-0000000">
                </div>
                
                <div class="line"></div>
                
                <div id="numberAndCopyBtn" class="input-group" style="display:none;">
                    <!-- 번호 표시 -->
                    <span id="completeNo"></span>
                    <!-- 복사하기 버튼 -->
                    <button id="copyBtn" onclick="copyNumber()">
                        <img src="/resources/images/background/user.png" alt=""> 복사하기
                    </button>
                </div>
            </form>

            <button id="generateBtn">번호 생성</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>

    <script src="/resources/js/admin/UniqueNo.js"></script>
    <script src="/resources/js/header.js"></script>
</body>
</html>
