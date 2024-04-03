<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- font awesome 라이브러리 추가 + key 등록 -->
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<header>

    <div class="headerAll">

        <!-- 첫번째 줄 네비게이션 바 -->
        <nav class="navigation1">
            <!-- 공통 -->
            <div class="navigation1-row1">
                <a href="/comeMap">오시는길</a>
                
                <a href="/board/5">자료실</a>

                <%-- 테스트용으로 삭제 예정 --%>
                <a href="/admin/selectStudentList">테스트용 교직원 학생 조회</a>
            </div>

            <%-- 로그인 헤더 조건 변수 선언 --%>
            <c:set var='memberNo' value='${loginMember.memberNo}' />

            <%-- 학생일 경우 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '01'}" >
                <div class="navigation1-row2-professor">
                    <%-- a태그 href에 마이페이지 경로 넣기 --%>
                    <div>${loginMember.departmentName} <a href="#">${loginMember.memberName} </a> 학생</div>
                    <div class="quickMenu">
                        <div id="quickMenu-easy"><a href="/logout">로그아웃</a></div>
                    </div>
                </div>
            </c:if>
            <%-- 교수일 경우 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '02'}" >
                <div class="navigation1-row2-professor">
                    <%-- a태그 href에 마이페이지 경로 넣기 --%>
                    <div>${loginMember.departmentName} <a href="#">${loginMember.memberName} </a> 교수</div>
                    <div class="quickMenu">
                        <div id="quickMenu-easy"><a href="/logout">로그아웃</a></div>
                    </div>
                </div>
            </c:if>
            <%-- 교직원일 경우 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '03'}" >
                <div class="navigation1-row2-professor">
                    <%-- a태그 href에 마이페이지 경로 넣기 --%>
                    <div>${loginMember.departmentName} <a href="#">${loginMember.memberName} </a> 교직원</div>
                    <div class="quickMenu">
                        <div id="quickMenu-easy"><a href="/logout">로그아웃</a></div>
                    </div>
                </div>
            </c:if>
            
            

        </nav>
    
        <!-- 두번째줄 네비게이션바 -->
        <nav class="navigation2">
            <!-- 클릭 시 메인 페이지로 이동하는 문구 -->
            <div class="logoArea">
                <a href="/main" class="logoText">
                    <img src="/resources/images/main-logo2.png" id="mainLogo">
                    <%-- <div>UNI-SYSTEM</div>
                    <div>KH INFORMATION EDUCATION CENTER</div>
                    <div>UNIVERSITY</div> --%>
                </a>
            </div>

            <div class="navigation2-row2">
                <%-- 소식은 고정 --%>
                <a href="/board/1" id="home">소식</a>

                <!-- 로그인(조건:학생,교수,교직원) 전 과 후로 메뉴 표시 다르게 -->

                <%-- 학생 전용 --%>
                <c:if test="${fn:substring(memberNo, 0, 2) == '01'}" >
                    <%-- <a href="/board/4">1:1문의</a> --%>
                    <a href="/collegian/classList" id="lecture">수강</a>
                    <a href="/collegian/certificate/4" id="certificate">증명서 발급</a>
                    <a href="/collegian/change" id="myinfo">내정보</a>
                    <a href="/tuition" id="tuition">등록금 납부</a>
                </c:if>
                
                <%-- 교수 전용 --%>
                <c:if test="${fn:substring(memberNo, 0, 2) == '02'}" >
                    <a href="/professor/professorPageStudentSearch" id="studentBtn">학생</a>
                    <a href="/professor/taskList" id="taskBtn">과제</a>
                    <a href="/rate" id="professorBtn">교수</a>
                </c:if>

                <%-- 교직원 전용 --%>
                <c:if test="${fn:substring(memberNo, 0, 2) == '03'}" >
                    <a href="/admin/UniqueNo" id="selectBtn">조회</a>
                    <a href="/staff/subjectList" id="objectBtn">교과목</a>
                    <a href="/admin/UniqueNo" id="memberBtn">교번/학번 발급</a>
                </c:if>
            </div>
        </nav>
    
        <!-- 세번째줄 네비게이션바 -->
        <nav class="navigation3">

            <%-- 소식은 고정 노출 --%>
            <div class="navigation3-home" id="newsList">
                <a href="/board/1">공지사항</a>
                <a href="/board/2">학과공지</a>
                <a href="/board/3">자유게시판</a>
                <a href="/board/4">1:1문의</a>
            </div>

            <%-- 학생 전용 세부 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '01'}" >
                <!-- 필요한 메뉴 구성 입력 1을 올렸을 경우 -->
                <div class="navigation3-student" id="lectureList">
                    <a href="/collegian/classList">교과목 조회</a>
                    <a href="/collegian/myClass">수강신청</a>
                    <a href="/collegian/schedule">시간표</a>
                    <a href="/collegian/task">과제물 제출</a>
                </div>

                <!-- 필요한 메뉴 구성 입력 2을 올렸을 경우 -->
                <div class="navigation3-student" id="certificateList">
                    <a href="/collegian/certificate/1">학적 증명서</a>
                    <a href="/collegian/certificate/2">성적 증명서</a>
                    <a href="/collegian/certificate/2">미지정</a>
                    <a href="/collegian/certificate/4">학생증</a>
                </div>

                <!-- 필요한 메뉴 구성 입력 2을 올렸을 경우 -->
                <div class="navigation3-student" id="myinfoList">
                    <a href="#">개인 정보 수정</a>
                    <a href="/collegian/change">학적 변동 신청</a>
                    <a href="#">학점 조회</a>
                </div>
            </c:if>


            <%-- 교수 전용 세부 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '02'}" >

                <!-- 학생을 올렸을 경우 -->
                <div class="navigation3-professor" id="studentList">
                    <a href="/professor/professorPageStudentSearch">학생 조회</a>
                    <a href="/professor/professorPageStudentGrade">성적 관리</a>
                </div>

                <!-- 과제를 올렸을 경우 -->
                <div class="navigation3-professor" id="taskList">
                    <a href="/professor/taskWrite">과제 등록</a>
                    <a href="#">과제 수정</a>
                    <a href="/professor/taskList">과제 목록 조회</a>
                </div>

                <!-- 교수에 올렸을 경우 -->
                <div class="navigation3-professor" id="professorList">
                    <a href="/rate">교수 평가 조회</a>
                    <a href="/professor/professorPageCertificate">교원증 발급</a>
                </div>
            </c:if>


            <%-- 교직원 전용 세부 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '03'}" >

                <!-- 조회 올렸을 경우 -->
                <div class="navigation3-admin" id="selectList">
                    
                    <a href="/admin/selectStudentList">학생 조회</a>
                    <a href="#">학생(성적) 조회</a>
                    <a href="#">교수 조회</a>
                    <a href="#">교직원 조회</a>
                    <a href="/rate">교수 평가 조회</a>
                </div>

                <!-- 교과목을 올렸을 경우 -->
                <div class="navigation3-admin" id="objectList">
                    <a href="/staff/subjectList">교과목 조회</a>
                    <a href="/staff/insert">교과목 등록</a>
                </div>

            </c:if>

        </nav>

    </div>

</header>