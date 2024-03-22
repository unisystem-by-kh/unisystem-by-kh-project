<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="studentList" value="${map.studentList}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/professor/style-professorPage-StudentSearch.css">
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">
            
            <!-- 학생 정보 영역 -->
            <div class="student-area">
                <!-- 재적 상태 값 불러오기 -->
                <div class="student-status">
                    <%-- <c:if test="${loginMember.memberStatus == 'N'}" >
                        <div>${loginMember.memberName}학생 상태 : 재학중</div>
                    </c:if>
                    <c:if test="${loginMember.memberStatus == 'Y'}" >
                        <div>${loginMember.memberName}학생 상태 : 휴학중</div>
                    </c:if>
                    <c:if test="${loginMember.memberStatus == 'P'}" >
                        <div>${loginMember.memberName}학생 상태 : 졸업</div>
                    </c:if>
                    <c:if test="${loginMember.memberStatus == 'D'}" >
                        <div>${loginMember.memberName}학생 상태 : 중퇴</div>
                    </c:if> --%>
                    
                    <div class="search-area">
                        <form action="${categoryNo}" method="get" id="studentSearch" onsubmit="">
                            <%-- <input type="hidden" name="type" value="${param.type}"> --%>
                            <select name="key" id="search-key">
                                <option value="#">검색 조건 선택</option>
                                <option value="no">학번</option>
                                <option value="nm">이름</option>
                                <option value="gr">학년</option>
                                <option value="tr">학과</option>
                                <option value="po">성적</option>
                            </select>
            
                            <input type="text" name="query" placeholder="검색어를 입력해주세요." id="search-query">
            
                            <button>검색</button>
                        </form>
                    </div>

                </div>
                <div class="student-info">
                    <div class="student-info-area">
                        <div class="student-info-value-name">
                            <div>학번</div>
                            <div>이름</div>
                            <div>학년</div>
                            <div>학기</div>
                            <div>나이</div>
                            <div>학과</div>
                            <div>성적</div>
                        </div>

                        <c:forEach items="${studentList}" var="student">
                            <div class="student-info-value">
                                <div>${student.memberNo}</div>
                                <!-- 이걸로 사용해야함 <a>태그 -->
                                <div><a href="#">${student.memberName}</a></div>
                                <div>${student.memberGrade}</div>
                                <div>${student.memberTerm}</div>
                                <div>${student.memberAge}</div>
                                <div>${student.departmentName}</div>
                                <div>${student.lecturePoint}</div>
                            </div>
                        </c:forEach>




                    </div>
                </div>
            </div>


            <!-- 시간표 영역 -> 학생 정보 값이 많아지면 시간표 삭제 (예정) -> 학생 클릭하면 나오게? -->
            <div class="student-clock-area">
                <div class="student-clock-info">
                    <div class="student-clock-info-value">
                        <div>시간</div>
                        <div>교과목</div>
                    </div>

                    <%-- (영역)테스트용 값 --%>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                </div>
            </div>


        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    
</body>
</html>