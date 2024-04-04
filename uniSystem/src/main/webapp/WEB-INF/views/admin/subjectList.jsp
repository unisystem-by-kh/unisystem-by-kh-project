<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="subjectList" value="${map.subjectList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교과목 조회</title>
    
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/admin/subjectList.css">

</head>
<body>
    
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <c:if test="${!empty param.key}" >
            <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
        </c:if>

        <form action="subjectList" id="searchFrm">
            <select name="key" id="subjectKey">
                <option value="t">과목명</option>
                <option value="d">학과명</option>
                <option value="p">전담 교수</option>
            </select>
            <input type="search" name="query" id="subjectQuery" placeholder="검색어를 입력해주세요.">
            <button id="searchBtn">검색</button>

            <c:if test="${!empty param.key}" >
                <h3 style="margin:30px">"${param.query}" 검색 결과</h3>
            </c:if>

        </form>

        <table class="list-table">
            <thead>
                <tr>
                    <th>과목 번호</th>
                    <th>학과명</th>
                    <th>과목명</th>
                    <th>전담 교수</th>
                    <th>강의 시간</th>
                    <th>과목 수정</th>
                    <th>삭제</th>
                </tr>
            </thead>

            <tbody>
                <c:choose>
                   <c:when test="${empty subjectList}">
                    <tr>
                        <th colspan="7">교과목이 존재하지 않습니다.</th>
                    </tr>
                   </c:when>
                
                   <c:otherwise>

                        <c:forEach var="c" items="${subjectList}" >
                            <tr>
                                <td>${c.classNo}</td>
                                <td>${c.departmentName}</td>
                                <td>${c.className}</td>
                                <td>${c.memberName}</td>
                                <td>${c.classDay}(${c.classStart}교시~${c.classEnd}교시)</td>
                                <td><button>과목수정</button></td>
                                <td><button>삭제</button></td>
                            </tr>
                            
                        </c:forEach>

                   </c:otherwise>

                </c:choose>
            </tbody>

        </table>

        <!-- 페이지네이션 영역 -->
        <div class="pagination-area">

                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/staff/subjectList?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/staff/subjectList?cp=${pagination.prevPage}${sp}">&lt;</a></li>

                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <li><a href="/staff/subjectList?cp=${i}${sp}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/staff/subjectList?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/staff/subjectList?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>
                </ul>
            </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>


    <%-- 과목 수정 영역 --%>
    <div class="modal-area">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>과목 수정</h2><hr>
            <form action="/staff/update" id="insertFrm" method="post">
                <div class="form-group">
                    <label for="departmentName">학과</label>
                    <select name="departmentNo" id="departmentNo">
                        <option value="0">전체</option>
                        <c:forEach items="${deptCodeList}" var="deptCode">
                            <option value="${deptCode.DEPARTMENT_NO}">${deptCode.DEPARTMENT_NAME}</option>
                        </c:forEach>
                    </select>
                </div>
        
                <div class="form-group">
                    <label for="professor">담당 교수</label>
                    <input type="text" id="teacher" name="memberName" placeholder="담당 교수님을 입력해주세요." autocomplete="off">
                    <div class="resultSet-area">
                        <p id="x-btn">&times;</p>
                        <ul id="resultSet" class="resultSet"></ul>
                    </div>
                </div>

                <div class="form-group">
                    <label for="className">과목명</label>
                    <input type="text" id="className" name="className" placeholder="과목명을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="classPoint">강의 학점</label>
                    <input type="text" id="classPoint" name="classPoint" placeholder="전공:3 교양:2" maxlength="1">
                </div>
        
                <div class="form-group">
                    <label for="classMax">수강 정원</label>
                    <input type="text" id="classMax" name="classMax" maxlength="3" placeholder="최대 수강 인원을 입력해주세요.">
                </div>
        
        
                <div class="form-group">
                    <label>강의 학기</label>
                    <select name="classGrade" id="grade">
                        <option value="0">학년</option>
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                    </select>
                    <select name="classTrem" id="semester">
                        <option value="0">학기</option>
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                    </select>
                    <!-- <input type="text" id="semester" name="semester" > -->
                </div>
        
                <div class="form-group">
                    <label for="calssDay">강의 요일</label>
                    <select name="classDay" id="classDay">
                        <option value="0">요일</option>
                        <option value="월">월</option>
                        <option value="화">화</option>
                        <option value="수">수</option>
                        <option value="목">목</option>
                        <option value="금">금</option>
                    </select>
                    <!-- <input type="text" id="lectureDay" name="lectureDay" > -->
                </div>
        
                <div class="form-group" id="classTime-area">
                    <label for="classTime">강의 시간</label>
                    <input type="text" id="classStart" name="classStart" placeholder="시작" maxlength="1">교시
                    <input type="text" id="classEnd" name="classEnd" placeholder="마치는" maxlength="1">교시
                    <button type="button" id="checkTime">시간 체크</button>
                </div>

                <input type="hidden" id="classNo" name="classNo" value="0">

                <button class="btn">수정하기</button>
            </form>
        </div>
    </div>
    
    

    <script src="/resources/js/admin/insertSubject.js"></script>
    <script src="/resources/js/admin/subjectList.js"></script>
    <script src="/resources/js/header.js"></script>
    
</body>
</html>