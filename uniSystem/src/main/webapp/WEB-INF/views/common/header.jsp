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
                <a href="/board/1">공지사항</a>
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
                    <div>UNI-SYSTEM</div>
                    <div>KH INFORMATION EDUCATION CENTER</div>
                    <div>UNIVERSITY</div>
                </a>
            </div>

            <div class="navigation2-row2">
                <%-- 소식은 고정 --%>
                <a href="#" id="home">소식</a>

                <!-- 로그인(조건:학생,교수,교직원) 전 과 후로 메뉴 표시 다르게 -->

                <%-- 학생 전용 --%>
                <c:if test="${fn:substring(memberNo, 0, 2) == '01'}" >
                    <a href="/board/4">1:1문의</a>
                    <a href="/tuition">등록금</a>
                    <a href="#">필요한 메뉴 구성 입력 1</a>
                </c:if>
                
                <%-- 교수 전용 --%>
                <c:if test="${fn:substring(memberNo, 0, 2) == '02'}" >
                    <a href="#">학생</a>
                    <a href="#">과제</a>
                    <a href="#">교수</a>
                </c:if>

                <%-- 교직원 전용 --%>
                <c:if test="${fn:substring(memberNo, 0, 2) == '03'}" >
                    <a href="/admin/UniqueNo">조회</a>
                    <a href="/staff/subjectList">교과목</a>
                    <a href="/admin/UniqueNo">교번/학번 발급</a>
                </c:if>
            </div>
        </nav>
    
        <!-- 세번째줄 네비게이션바 -->
        <nav class="navigation3">

            <%-- 소식은 고정 노출 --%>
            <div class="navigation3-home">
                <a href="#">학사일정</a>
                <a href="/board/2">학과공지</a>
                <a href="/board/3">자유게시판</a>
                <a href="/board/4">1:1문의</a>
            </div>

            <%-- 학생 전용 세부 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '01'}" >
                <!-- 필요한 메뉴 구성 입력 1을 올렸을 경우 -->
                <div class="navigation3-student">
                    <a href="#">세부메뉴1</a>
                    <a href="#">세부메뉴2</a>
                    <a href="#">세부메뉴3</a>
                </div>

                <!-- 필요한 메뉴 구성 입력 2을 올렸을 경우 -->
                <div class="navigation3-student">
                    <a href="#">세부메뉴1</a>
                    <a href="#">세부메뉴2</a>
                    <a href="#">세부메뉴3</a>
                </div>

                <!-- 필요한 메뉴 구성 입력 2을 올렸을 경우 -->
                <div class="navigation3-student">
                    <a href="#">세부메뉴1</a>
                    <a href="#">세부메뉴2</a>
                    <a href="#">세부메뉴3</a>
                </div>
            </c:if>


            <%-- 교수 전용 세부 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '02'}" >

                <!-- 학생을 올렸을 경우 -->
                <div class="navigation3-professor">
                    <a href="/professor/professorPageStudentSearch">학생 조회</a>
                    <a href="/professor/professorPageStudentGrade">성적 관리</a>
                </div>

                <!-- 과제를 올렸을 경우 -->
                <div class="navigation3-professor">
                    <a href="/professor/taskWrite">과제 등록</a>
                    <a href="#">과제 수정</a>
                    <a href="/professor/taskList">과제 목록 조회</a>
                </div>

                <!-- 교수에 올렸을 경우 -->
                <div class="navigation3-professor">
                    <a href="/late">교수 평가 조회</a>
                    <a href="#">교원증 발급(준비중...)</a>
                </div>
            </c:if>


            <%-- 교직원 전용 세부 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '03'}" >

                <!-- 조회 올렸을 경우 -->
                <div class="navigation3-admin">
                    <a href="professor/professorPageStudentSearch">학생 조회</a>
                    <a href="professor/professorPageStudentGrade">학생(성적) 조회</a>
                    <a href="professor/professorPageStudentGradeInsert">교수 조회</a>
                    <a href="professor/professorPageStudentGradeUpdate">교직원 조회</a>
                    <a href="/late">교수 평가 조회</a>
                </div>

                <!-- 교과목을 올렸을 경우 -->
                <div class="navigation3-admin">
                    <a href="/staff/subjectList">교과목 조회</a>
                    <a href="/staff/insert">교과목 등록</a>
                </div>

                <!-- 교번/학번 발급 올렸을 경우 -->
                <div class="navigation3-admin">
                    <a href="#">필요한메뉴1</a>
                    <a href="#">필요한메뉴2</a>
                </div>

            </c:if>

        </nav>

    </div>

</header>