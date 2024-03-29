<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <c:set var="sp" value="key=${param.key}&query=${param.query}"/>
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
                                <option value="dp">전화번호</option>
                            </select>
            
                            <input type="text" name="query" placeholder="검색어를 입력해주세요." id="search-query">
            
                            <button>검색</button>
                        </form>
                    </div>

                </div>

                <div class="infoCheck">
                    <div id="infoV">
                        <p>본인이 속한 학과 학생 조회</p>
                        <p>클릭하면 복사 가능</p>
                    </div>
                    <form action="/professor/excel/download?${sp}" method="get">
                        <c:forEach var="entry" items="${param}">
                            <input type="hidden" name="${entry.key}" value="${entry.value}" />
                        </c:forEach>
                        <button id="excelBtn">해당 목록을 엑셀로 저장<br>(Excel Download)</button>
                    </form>
                </div>

                <div class="student-info">
                    <div class="student-info-area">
                        <div class="student-info-value-name">
                            <div>학번</div>
                            <div>학과</div>
                            <div>이름</div>
                            <div>나이</div>
                            <div>학년</div>
                            <div>학기</div>
                            <div>입학년도</div>
                            <div>생년월일</div>
                            <div>이메일</div>
                            <div>전화번호</div>
                            <div>학적상태</div>
                        </div>
                        
                        <c:forEach items="${studentList}" var="student">
                            <c:if test="${loginMember.departmentNo == student.departmentNo}">
                                <div class="student-info-value">
                                    <div class="studentMemberNo">${student.memberNo}</div>
                                    <div>${student.departmentName}</div>
                                    <div class="studentMemberName">${student.memberName}</a></div>
                                    <div>만 ${student.memberAge}살</div>
                                    <div>${student.memberGrade}</div>
                                    <div>${student.memberTerm}</div>
                                    <div>${student.memberDate.substring(0, 4)}년</div>
                                    <c:if test="${student.memberSsn.substring(7, 8) == 1 || student.memberSsn.substring(7, 8) == 3}">
                                        <c:set var="genM" value="남" />
                                    </c:if>
                                    <c:if test="${student.memberSsn.substring(7, 8) == 2 || student.memberSsn.substring(7, 8) == 4}">
                                        <c:set var="genF" value="여" />
                                    </c:if>
                                    <div>${student.memberSsn.substring(0, 2)}년${student.memberSsn.substring(2, 4)}월${student.memberSsn.substring(4, 6)}일(${genM}${genF})</div>
                                    <div>${student.memberEmail}</div>
                                    <div>${student.memberPhone.substring(0, 3)}&ndash;${student.memberPhone.substring(3, 7)}&ndash;${student.memberPhone.substring(7, 11)}</div>
                                    <c:set var="stN" value="" />
                                    <c:set var="stY" value="" />
                                    <c:set var="stP" value="" />
                                    <c:set var="stD" value="" />
                                    <c:choose>
                                        <c:when test="${student.memberStatus == 'N'}">
                                            <c:set var="stN" value="재학중" />
                                        </c:when>
                                        <c:when test="${student.memberStatus == 'Y'}">
                                            <c:set var="stY" value="휴학중" />
                                        </c:when>
                                        <c:when test="${student.memberStatus == 'P'}">
                                            <c:set var="stP" value="졸업" />
                                        </c:when>
                                        <c:when test="${student.memberStatus == 'D'}">
                                            <c:set var="stD" value="중퇴" />
                                        </c:when>
                                    </c:choose>
                                    <div>${stN}${stY}${stP}${stD}</div>
                                </div>
                            </c:if>
                        </c:forEach>
    
                        <%-- <!-- 모달 내용 -->
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <!-- 모달 닫기 버튼 -->
                                <div class="close"></div>
                                <!-- 강의 정보를 표시할 영역 (lectureInfo) -->
                                <div id="lectureInfo"></div>
                            </div>
                        </div> --%>


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
