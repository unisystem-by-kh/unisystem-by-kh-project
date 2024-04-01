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

        <%-- <div>
            ${studentList[0]}
        </div> --%>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container">
            <div class="search-area">
                <div>
                    <input type="text" placeholder="학번, 이름으로 검색" id="search">
                </div>
                <div>
                    <select name="first_select" id="first_select">
                        <option disabled selected>재적 상태</option>
                        <option value="N">재학중</option>
                        <option value="Y">휴학중</option>
                        <option value="P">졸업</option>
                        <option value="D">중퇴</option>
                        <option value="YY">휴학신청</option>
                        <option value="NN">복학신청</option>
                        <option value="DD">자퇴신청</option>
                    </select>
                    <select name="second_select" id="secondSelect">
                        <option disabled selected>학년</option>
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
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
                        <th>학기</th>
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
                                        <span>${student.memberNo}</span>
                                        <input type="checkbox" class="select-row">
                                    </label>
                                </td>
                                <td><a href="/admin/${student.memberNo}/selectStudentDetail">${student.memberName}</a></td>
                                <td>${student.memberGrade}</td>
                                <td>${student.memberTerm}</td>
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
                                <td>
                                    ${student.classPoint}&nbsp&nbsp/&nbsp
                                    <c:if test="${student.memberTerm == 1}" >
                                        <c:choose>
                                            <c:when test="${student.memberGrade == 1}">
                                                15
                                            </c:when>
                                            <c:when test="${student.memberGrade == 2}" >
                                                45
                                            </c:when>
                                            <c:when test="${student.memberGrade == 3}" >
                                                75
                                            </c:when>
                                            <c:when test="${student.memberGrade == 4}" >
                                                105
                                            </c:when>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${student.memberTerm == 2}" >
                                        <c:choose>
                                            <c:when test="${student.memberGrade == 1}">
                                                30
                                            </c:when>
                                            <c:when test="${student.memberGrade == 2}" >
                                                60
                                            </c:when>
                                            <c:when test="${student.memberGrade == 3}" >
                                                90
                                            </c:when>
                                            <c:when test="${student.memberGrade == 4}" >
                                                120
                                            </c:when>
                                        </c:choose>
                                    </c:if>
                                </td>
                                </tr>
                        </c:forEach>
                        
                    </tbody>
                </div>
            </table>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script>
        const studentArr = [];
        let newStudent = {};
    </script>
    <c:forEach items="${studentList}" var="student">
            <script>
                newStudent = {
                    "memberNo": "${student.memberNo}",
                    "memberName": "${student.memberName}",
                    "memberGrade": "${student.memberGrade}",
                    "memberTerm": "${student.memberTerm}",
                    "deptName": "${student.deptName}",
                    "memberStatus": "${student.memberStatus}",
                    "classPoint": "${student.classPoint}",
                    "requestType": "${student.requestType}",
                    "requestReason": "${student.requestReason}"
                };
                studentArr.push(newStudent);
            </script>
            
            <c:if test="${!loop.last}"></c:if>
    </c:forEach>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/admin/student/selectStudentList.js"></script>

</body>
</html>