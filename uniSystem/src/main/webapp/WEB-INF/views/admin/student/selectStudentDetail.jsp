<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="student" value="${map.student}"/>
<c:set var="stuLecture" value="${map.stuLecture}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/student/selectStudentDetail-style.css">
    <%-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> --%>
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <div>
            ${map.student}
            <%-- ${stuLecture} --%>
        </div>

        <table>
            <thead>
                <tr>
                    <th>학번</th>
                    <th>이름</th>
                    <th>생년월일</th>
                    <th>학년</th>
                    <th>학기</th>
                    <th>재적 변경</th>
                    <th>이수한 학점</th>
                    <th>등록금 납부 여부</th>
                    <th>저장</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${student.memberNo}</td>
                    <td>${student.memberName}</td>
                    <td>${student.memberDate}</td>
                    <td>${student.memberGrade}</td>
                    <td>${student.memberTerm}</td>
                    <td>
                        <select class="form-control" id="student-select">
                            <c:if test="${!empty student.requestType}" >
                                <option value="${student.requestType}" selected>
                                    <c:choose>
                                       <c:when test="${student.requestType == 'Y'}">
                                            휴학신청중
                                       </c:when>
                                       <c:when test="${student.requestType == 'N'}">
                                            복학신청중
                                       </c:when>
                                       <c:when test="${student.requestType == 'D'}">
                                            자퇴신청중
                                       </c:when>
                                    </c:choose>
                                </option>
                            </c:if>
                            <option value="N">재학중으로 변경</option>
                            <option value="Y">휴학중으로 변경</option>
                            <option value="D">중퇴로 변경</option>
                            <option value="P">졸업으로 변경</option>
                        </select>
                    </td>
                    <td>${student.classPoint}
                        <c:if test="${student.memberTerm == 1}" >
                            <c:choose>
                                <c:when test="${student.memberGrade == 1}">
                                    / 15
                                </c:when>
                                <c:when test="${student.memberGrade == 2}" >
                                    / 45
                                </c:when>
                                <c:when test="${student.memberGrade == 3}" >
                                    / 75
                                </c:when>
                                <c:when test="${student.memberGrade == 4}" >
                                    / 105
                                </c:when>
                            </c:choose>
                        </c:if>
                        <c:if test="${student.memberTerm == 2}" >
                            <c:choose>
                                <c:when test="${student.memberGrade == 1}">
                                    / 30
                                </c:when>
                                <c:when test="${student.memberGrade == 2}" >
                                    / 60
                                </c:when>
                                <c:when test="${student.memberGrade == 3}" >
                                    / 90
                                </c:when>
                                <c:when test="${student.memberGrade == 4}" >
                                    / 120
                                </c:when>
                            </c:choose>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${student.pay == 1}" >
                            완료
                        </c:if>
                        <c:if test="${student.pay == 0}" >
                            미완
                        </c:if>
                    </td>
                    <td><button class="custom-btn btn-5" onClick="changeStatus('${student.memberNo}', '${student.requestType}')">저장</button></td>
                </tr>
            </tbody>
        </table>

        <c:if test="${!empty student.requestReason}" >
            <div class="request-reason">
                요청 사유 : ${student.requestReason}
            </div>
        </c:if>

        <table>
            <thead>
                <tr>
                    <th>과목명</th>
                    <th>강의 학점</th>
                    <th>담당 교수</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty stuLecture}" >
                    <tr>
                        <td colspan="3">수강 강의가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach items="${stuLecture}" var="item">
                    <tr>
                        <td>${item.className}</td>
                        <td>${item.classPoint}</td>
                        <td>${item.memberName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/admin/student/selectStudentDetail.js"></script>

</body>
</html>