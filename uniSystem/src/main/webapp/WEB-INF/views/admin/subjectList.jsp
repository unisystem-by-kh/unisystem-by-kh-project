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
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/admin/subjectList.css">

</head>
<body>
    
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <form action="/subjectList" id="searchFrm">
            <select name="key" id="subjectKey">
                <option value="a">과목번호</option>
                <option value="b">학과명</option>
                <option value="c">과목명</option>
                <option value="d">전담 교수</option>
            </select>
            <input type="search" name="query" id="subjectQuery" placeholder="검색어를 입력해주세요.">
            <button id="searchBtn">검색</button>
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
                        <td colspan="7">교과목이 존재하지 않습니다.</td>
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
    <div class="modal">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>과목 수정</h2><hr>
            <form>
                <div class="form-group">
                    <label for="className">과목명</label>
                    <input type="text" id="className" name="className" placeholder="과목명을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="classPoint">강의 학점</label>
                    <input type="text" id="classPoint" name="classPoint" placeholder="전공:3 교양:2">
                </div>
        
                <div class="form-group">
                    <label for="classMax">수강 정원</label>
                    <input type="text" id="classMax" name="classMax" placeholder="최대 수강 인원을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="departmentName">학과</label>
                    <input type="text" id="departmentName" name="departmentName" placeholder="학과를 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="professor">담당 교수</label>
                    <input type="text" id="professor" name="professor" placeholder="담당 교수님을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label>강의 학기</label>
                    <select name="grade" id="grade">
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                    </select>
                    <select name="semester" id="semester">
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                    </select>
                    <!-- <input type="text" id="semester" name="semester" > -->
                </div>
        
                <div class="form-group">
                    <label for="calssDay">강의 요일</label>
                    <select name="calssDay" id="calssDay">
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
                    <input type="text" id="classStart" name="classTime" placeholder="시작">교시
                    <input type="text" id="classEnd" name="classTime" placeholder="마치는">교시
                    <button id="checkTime">시간 체크</button>
                </div>

                <button class="btn">수정하기</button>
            </form>
        </div>
    </div>
    
    

    <script src="/resources/js/admin/subjectList.js"></script>
    <script src="/resources/js/header.js"></script>
    
</body>
</html>