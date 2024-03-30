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
    <link rel="stylesheet" href="/resources/css/student/selectStudentList-style.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <div>
            ${studentList}
        </div>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container">
            <div class="search-area">
                <div>
                    <input type="text" placeholder="검색어 입력">
                </div>
                <div>
                    <select name="first_select">
                        <option value="status">재적 상태</option>
                        <option value="name">이름</option>
                        <option value="department">학과</option>
                    </select>
                    <select name="second_select">
                        <option value="completion">이수여부</option>
                        <option value="completion">이수</option>
                        <option value="incomplete">학점 미달</option>
                    </select>
                    <button id="allSelect">전체 선택</button>
                    <button onclick="openModal()">일괄 진급</button>
                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>학번</th>
                        <th>이름</th>
                        <th>학년</th>
                        <th>학과</th>
                        <th>재적 상태</th>
                        <th>이수 여부</th>
                    </tr>
                </thead>
                <div class="table-body">
                    <tbody>
                        <c:forEach items="${studentList}" var="student">
                            <tr>
                                <td>
                                    <label>
                                        ${student.memberNo}
                                        <input type="checkbox" class="select-row">
                                    </label>
                                </td>
                                <td><a href="/student/${student.memberNo}/selectStudentDetail">${student.memberName}</a></td>
                                <td>${student.memberGrade}</td>
                                <td>${student.deptName}</td>
                                <c:set var="status" value="${student.memberStatus}"/>
                                <c:if test="${!empty student.requestType}" >
                                    <c:choose>
                                        <c:when test="${student.requestType == 'Y'}">
                                                <td class="std-status" onClick="statusChange('${student.requestReason}', event)">휴학신청<input type="checkbox" hidden></td>
                                        </c:when>
                                        <c:when test="${student.requestType == 'N'}">
                                                <td class="std-status" onClick="statusChange('${student.requestReason}', event)">복학신청<input type="checkbox" hidden></td>
                                        </c:when>
                                        <c:when test="${student.requestType == 'D'}">
                                                <td class="std-status" onClick="statusChange('${student.requestReason}', event)">자퇴신청<input type="checkbox" hidden></td>
                                        </c:when>
                                        </c:choose>
                                </c:if>
                                <c:if test="${empty student.requestType}" >
                                    <c:choose>
                                    <c:when test="${status == 'Y'}">
                                            <td>휴학중<input type="checkbox" hidden></td>
                                    </c:when>
                                    <c:when test="${status == 'N'}">
                                            <td>재학중<input type="checkbox" hidden></td>
                                    </c:when>
                                    <c:when test="${status == 'P'}">
                                            <td>졸업<input type="checkbox" hidden></td>
                                    </c:when>
                                    <c:when test="${status == 'D'}">
                                            <td>중퇴<input type="checkbox" hidden></td>
                                    </c:when>
                                    </c:choose>
                                </c:if>
                                <td>${student.classPoint}/30(한 학년 총 학점)</td>
                                </tr>
                        </c:forEach>

                        <tr>
                            <td>
                                <label>
                                    test
                                    <input type="checkbox" class="select-row">
                                </label>
                            </td>
                            <td><a href="/student/selectStudentDetail">test이름</a></td>
                            <td>test학년</td>
                            <td>test학과</td>
                            <td class="std-status">test 학적<input type="checkbox" hidden></td>
                            <td>test 이수 여부</td>
                        </tr>
                    </tbody>
                </div>
            </table>



            <div id="modal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="close" onclick="closeModal()">&times;</span>
                    </div>
                    <div class="modal-body">
                        <img src="https://via.placeholder.com/150" alt="이미지 영역">
                        <div style="font-size: 20px;">진급 N개를 처리하시겠습니까?</div>
                    </div>
                    <div class="modal-footer">
                        <button class="cancel-btn" onclick="closeModal()">취소</button>
                        <button class="approve-btn" onclick="confirmModal()">승인</button>
                        <!-- <button class="confirm-btn" onclick="closeModal()" style="display:none">확인</button> -->
                    </div>
                </div>
            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/admin/student/selectStudentList.js"></script>

</body>
</html>