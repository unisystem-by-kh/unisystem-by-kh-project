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
                <label for="radio1">교번(교수)</label><br>
                <input type="radio" id="radio1" name="radios">
                <label for="radio3">교직원</label>
                <input type="radio" id="radio3" name="radios">
                <label for="radio2">학번(학생)</label>
                <input type="radio" id="radio2" name="radios">
            </div>

            <form action="/admin/UniqueNo" method="POST" id="generateForm" enctype="multipart/form-data">
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
                        <option value="1">경영학과</option>
                        <option value="2">경제학과</option>
                        <option value="3">국어국문학과</option>
                        <option value="4">영어영문학과</option>
                        <option value="5">중어중문학과</option>
                        <option value="6">법학과</option>
                        <option value="7">행정학과</option>
                        <option value="8">무역학과</option>
                        <option value="9">미디어영상학과</option>
                        <option value="10">컴퓨터과학과</option>
                        <option value="11">보건환경학과</option>
                        <!-- 다른 학과들의 옵션들 -->
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
                        <img src="/resources/images/admin/copy.png" alt="복사하기 아이콘"> 복사하기
                    </button>
                </div>
            </form>

            <button id="generateBtn" onclick="generateNumber()">번호 생성</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>

    <script src="/resources/js/admin/UniqueNo.js"></script>
    <script src="/resources/js/header.js"></script>
</body>
</html>
