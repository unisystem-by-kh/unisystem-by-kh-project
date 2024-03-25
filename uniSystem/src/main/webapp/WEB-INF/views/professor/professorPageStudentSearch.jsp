<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="studentList" value="${map.studentList}" />
<c:set var="lectureList" value="${map.lectureList}" />

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

                    <c:if test="${!empty param.key}">
                        <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
                    </c:if>
                    
                    <div class="search-area">
                        <form action="/professor/professorPageStudentSearch" method="get" id="studentSearch">
                            <input type="hidden" name="type" value="${param.type}">
                            <select name="key" id="search-key">
                                <option value="#">검색 조건 선택</option>
                                <option value="no">학번</option>
                                <option value="nm">이름</option>
                                <option value="gr">학년</option>
                                <option value="tr">학기</option>
                                <option value="dp">학과</option>
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
                            <div>과목</div>
                            <div>성적</div>
                        </div>
                        

                        <c:forEach items="${studentList}" var="student">
                            <div class="student-info-value">
                                <div class="studentMemberNo" title="클릭 시, 해당 학생이 수강중인 강의 목록 조회">${student.memberNo}</div>
                                <div class="studentMemberName">${student.memberName}</a></div>
                                <div>${student.memberGrade}</div>
                                <div>${student.memberTerm}</div>
                                <div>${student.memberAge}</div>
                                <div>${student.departmentName}</div>
                                <div class="className">${student.classNm}</div>
                                <div class="lecturePoint">${student.lecturePoint}</div>
                            </div>
                        </c:forEach>    

                        <!-- 모달 내용 -->
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <!-- 모달 닫기 버튼 -->
                                <div class="close"></div>
                                <!-- 강의 정보를 표시할 영역 (lectureInfo) -->
                                <div id="lectureInfo"></div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/professor/professorPage-StudentSearch.js"></script>
    
</body>
</html>
