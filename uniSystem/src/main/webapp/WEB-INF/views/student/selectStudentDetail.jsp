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
    <link rel="stylesheet" href="/resources/css/student/selectStudentDetail-style.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

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
                    <th>진급</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>01-2412345</td>
                    <td>홍길동</td>
                    <td>2001-01-01</td>
                    <td>1</td>
                    <td>1</td>
                    <td>
                        <select>
                            <option value="재학중">재학중</option>
                            <option value="휴학중">휴학중</option>
                            <option value="졸업">졸업</option>
                        </select>
                    </td>
                    <td>10/30</td>
                    <td>납부 완료</td>
                    <td><button>승인</button></td>
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