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
                    <th>학적</th>
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
                        <select>
                            <option value="재학중">재학중</option>
                            <option value="휴학중">휴학중</option>
                            <option value="졸업">졸업</option>
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
                    <td><button>저장</button></td>
                </tr>
            </tbody>
        </table>
        <table>
            <thead>
                <tr>
                    <th>과목명</th>
                    <th>강의 학점</th>
                    <th>담당 교수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${stuLecture}" var="item">
                    <tr>
                        <td>${item.className}</td>
                        <td>${item.classPoint}</td>
                        <td>${item.memberName}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>JAVA</td>
                    <td>3</td>
                    <td>고길동</td>
                </tr>
                <tr>
                    <td>HTML</td>
                    <td>3</td>
                    <td>신원하</td>
                </tr>
                <tr>
                    <td>보건통계학</td>
                    <td>2</td>
                    <td>조경숙</td>
                </tr>
            </tbody>
        </table>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

</body>
</html>