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
            <label for="radio2">학번(학생)</label>
            <input type="radio" id="radio2" name="radios">
        </div>

        <div class="input-group">
            <!-- 이름 입력 -->
            <label for="name">이 름</label>
            <input type="text" id="name" name="name">
        </div>
    
        <div class="input-group" >
            <!-- 학과 입력 -->
            <label for="department">학 과</label>
            <select id="department" name="department">
                <option value="">------ 선  택 ------</option>
                <option value="computer_science">컴퓨터 공학</option>
                <option value="electrical_engineering">전기 공학</option>
                <option value="mechanical_engineering">기계 공학</option>
                <option value="civil_engineering">토목 공학</option>
            </select>
        </div>
    
        <div class="input-group">
            <!-- 교과목 선택 -->
            <label for="course">교과목</label>
            <select id="course" name="course" >
                <option value="">------ 선  택 ------</option>
                <option value="math">수학</option>
                <option value="physics">물리학</option>
                <option value="chemistry">화학</option>
                <option value="biology">생물학</option>
            </select>
        </div>
    
        <div class="input-group">
            <!-- 주민등록번호 입력 -->
            <label for="ssn">주민등록번호</label>
            <input type="text" id="ssn" name="ssn">
        </div>
        
        <div class="line"></div>
        
        
        <button>번 호 생 성</button>

        <span id="complete"></span>
        <span id="completeNo"></span>

    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
 
    </main>

    <script src="/resources/js/admin/UniqueNo.js"></script>
    <script src="/resources/js/header.js"></script>
    
</body>
</html>