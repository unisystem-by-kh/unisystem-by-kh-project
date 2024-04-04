<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="lectureList" value="${map.lectureList}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/professor/style-professorPage-StudentGrade.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <div class="row-area-admin">
                <div></div>
                <%-- <div class="search-area-admin">
                    <form id="searchFrm">
                        <select name="key" id="search">
                            <option value="">전체</option>
                            <option value="no">학번</option>
                            <option value="name">이름</option>
                        </select>
                        <div>
                            <i class="fa-solid fa-magnifying-glass-arrow-right"></i>
                        </div>
                        <div>
                            <input type="text" name="query" id="query">
                        </div>
                        <div>
                            <button>검색</button>
                        </div>
                    </form>
                </div> --%>

                <button id="searchBtnZ">전체 목록</button>
                <button id="searchBtnA">수강<br>1학년-1학기</button>
                <button id="searchBtnB">수강<br>1학년-2학기</button>
                <button id="searchBtnC">수강<br>2학년-1학기</button>
                <button id="searchBtnD">수강<br>2학년-2학기</button>
                <button id="searchBtnE">수강<br>3학년-1학기</button>
                <button id="searchBtnF">수강<br>3학년-2학기</button>
                <button id="searchBtnG">수강<br>4학년-1학기</button>
                <button id="searchBtnH">수강<br>4학년-2학기</button>
                <button id="searchBtnI">성적<br>미부여</button>
                <button id="searchBtnJ">학생<br>휴학중</button>
            </div>
            <%-- ${lectureList} --%>

            <!-- 정보영역 -->
            <div class="grade-area">
                <div class="grade-titleList">
                    <div>학번</div>
                    <div>학생 이름</div>
                    <div>학생 학년</div>
                    <div>학생 학기</div>
                    <div>학과</div>
                    <div>수강 과목</div>
                    <div>수강 학년</div>
                    <div>수강 학기</div>
                    <div>수강 성적</div>
                    <div>재적 상태</div>
                </div>

                <div class="contentList">
                    <c:forEach items="${lectureList}" var="lectureList">
                        <div class="grade-content">
                            <div>${lectureList.memberNo}</div>
                            <div>${lectureList.memberName}</div>
                            <div>${lectureList.memberGrade}</div>
                            <div>${lectureList.memberTerm}</div>
                            <div>${lectureList.departmentName}</div>
                            <div>${lectureList.classNm}</div>
                            <div>${lectureList.lectureGrade}</div>
                            <div>${lectureList.lectureTerm}</div>

                            <c:choose>
                                <c:when test="${lectureList.lecturePoint == '-1'}">
                                    <div>미부여</div>
                                </c:when>
                                <c:otherwise>
                                    <div>${lectureList.lecturePoint}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:set var="stN" value="" />
                            <c:set var="stY" value="" />
                            <c:set var="stP" value="" />
                            <c:set var="stD" value="" />
                            <c:choose>
                                <c:when test="${lectureList.memberStatus == 'N'}">
                                    <c:set var="stN" value="재학중" />
                                </c:when>
                                <c:when test="${lectureList.memberStatus == 'Y'}">
                                    <c:set var="stY" value="휴학중" />
                                </c:when>
                                <c:when test="${lectureList.memberStatus == 'P'}">
                                    <c:set var="stP" value="졸업" />
                                </c:when>
                                <c:when test="${lectureList.memberStatus == 'D'}">
                                    <c:set var="stD" value="중퇴" />
                                </c:when>
                            </c:choose>
                            <div>${stN}${stY}${stP}${stD}</div>

                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script>
        const memberDepartmentNo = ${loginMember.departmentNo};
    </script>

    <script src="/resources/js/header.js"></script>

    <script src="/resources/js/admin/student/searchStudentGrade.js"></script>


</body>
</html>