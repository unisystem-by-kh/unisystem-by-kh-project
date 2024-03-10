<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- font awesome 라이브러리 추가 + key 등록 -->
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>


<header>

    <div class="headerAll">

        <!-- 첫번째 줄 네비게이션 바 -->
        <nav class="navigation1">
            <!-- 공통 -->
            <div class="navigation1-row1">
                <a href="/board/comeMap">오시는길</a>
                <a href="/board/noticeBoardList">공지사항</a>
                <a href="/board/boardData">자료실</a>
            </div>
    
            <!-- 로그인 안했을 경우 -->
            <!-- <div class="navigation1-row2">
                <button><a href="#">회원가입</a></button>
                <button><a href="#">로그인</a></button>
            </div> -->
            
            <!-- 교수로 로그인 했을 경우 -->
            <div class="navigation1-row2-professor">
                <div>컴퓨터학과 <a href="#">홍길동 </a> 교수</div>
                <div class="quickMenu">
                    <div id="quickMenu-easy"><a href="#">로그아웃</a></div>
                </div>
            </div>

        </nav>
    
        <!-- 두번째줄 네비게이션바 -->
        <nav class="navigation2">
            <!-- 클릭 시 메인 페이지로 이동하는 문구 -->
            <div class="logoArea">
                <a href="/" class="logoText">
                    <div>UNI-SYSTEM</div>
                    <div>KH INFORMATION EDUCATION CENTER</div>
                    <div>UNIVERSITY</div>
                </a>
            </div>

            <div class="navigation2-row2">
                <a href="/" id="home">소식</a>


                <!-- 로그인(조건:학생,교수,교직원) 전 과 후로 메뉴 표시 다르게 -->
                
                <!-- 교수전용 -->
                <a href="#" id="student">학생</a>
                <a href="#" id="subject">교과목</a>
                <a href="#" id="exam">과제</a>
                <a href="#" id="professor">교수</a>
            </div>
        </nav>
    
        <!-- 세번째줄 네비게이션바 -->
        <nav class="navigation3">

            <!-- 클릭한 것에 따라서 내용 변경 -->

            <!-- 홈을 올렸을 경우 -->
            <div class="navigation3-home">
                <a href="#">학사일정</a>
                <a href="/board/departmentBoardList">학과공지</a>
                <a href="/board/freeBoardList">자유게시판</a>
                <a href="/board/inquiryBoardList">1:1문의</a>
            </div>

            <!-- 학생을 올렸을 경우 -->
            <div class="navigation3-student">
                <a href="professor/professorPageStudentSearch">학생 조회</a>
                <a href="professor/professorPageStudentGrade">성적 조회</a>
                <a href="professor/professorPageStudentGradeInsert">성적 등록</a>
                <a href="professor/professorPageStudentGradeUpdate">성적 수정</a>
            </div>

            <!-- 교과목을 올렸을 경우 -->
            <div class="navigation3-subject">
                <a href="/admin/subjectList">교과목 조회</a>
            </div>

            <!-- 과제를 올렸을 경우 -->
            <div class="navigation3-exam">
                <a href="/professor/taskWrite">과제 등록</a>
                <a href="#">과제 수정</a>
                <a href="/professor/taskList">과제 목록 조회</a>
            </div>

            <!-- 교수에 올렸을 경우 -->
            <div class="navigation3-professor">
                <a href="#">교원증 발급</a>
                <a href="#">교수 평가 조회</a>
            </div>

        </nav>

    </div>

</header>