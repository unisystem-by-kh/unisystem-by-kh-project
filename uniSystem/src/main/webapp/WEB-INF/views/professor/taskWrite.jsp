<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/style-main.css">

    <link rel="stylesheet" href="/resources/css/professor/taskWrite.css">
</head>
<body>

    <main>
        <%-- <div>
            ${map.classList}
        </div> --%>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <div class="mainContainer">

            <h1 class="title">
                <span>과제등록</span>
                <span id="writePlus"><i class="fa-solid fa-plus"></i></span>
            </h1>

            <form action="#" >
                <table class="tesk-table">
                    <thead>
                        <tr>
                            <th>학년</th>
                            <th>학기</th>
                            <th>과목명</th>
                            <th>분류</th>
                            <th>과제등록</th>
                            <th>제출기한 설정</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td class='term'>1</td>
                            <td>
                                <select name="dept">
                                    <option value="-1" disabled selected>과목을 선택하세요.</option>
                                    <c:forEach items="${map.classList}" var="item">
                                        <option value="${item.classNo}" >${item.className}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="deptList">과목을 선택하세요</td>
                            <td class="up-x">
                                <label>
                                    <i class="fa-solid fa-upload"></i>
                                    <input type="file" name="file">
                                </label>
                                <i class="fa-solid fa-xmark" name="X-btn"></i>
                            </td>
                            <td class="date-input-container">
                                    <input type="date" class="currentDate">
                            </td>
                            <td><button type="button" class="del-btn">삭제</button></td>
                        </tr>

                        
                        <tr>
                            <td>2</td>
                            <td class='term'>2</td>
                            <td>
                                <select name="dept">
                                    <option value="-1" disabled selected>과목을 선택하세요.</option>
                                    <c:forEach items="${map.classList}" var="item">
                                        <option value="${item.classNo}" >${item.className}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="deptList">과목을 선택하세요</td>
                            <td class="up-x">
                                <label>
                                    <i class="fa-solid fa-upload"></i>
                                    <input type="file" name="file">
                                </label>
                                <i class="fa-solid fa-xmark" name="X-btn"></i>
                            </td>
                            <td class="date-input-container">
                                    <input type="date" class="currentDate">
                            </td>
                            <td><button type="button" class="del-btn">삭제</button></td>
                        </tr>
                    </tbody>
                </table>

                <span class="save" id="save">
                    현 상태 저장 <i class="fa-regular fa-floppy-disk"></i>
                </span>
            </form>

            <h1>등록된 과제 목록</h1>

            <table class="tesk-table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>학기</th>
                        <th>과목명</th>
                        <th>분류</th>
                        <th>등록된 과제</th>
                        <th>제출기한</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>등록된 번호</td>
                        <td>등록된 학기</td>
                        <td>등록된 과목명</td>
                        <td>등록된 분류</td>
                        <td>등록된 과제 파일 명</td>
                        <td>등록된 제출 기한 (YYYY-MM-DD)</td>
                        <td>삭제 버튼</td>
                    </tr>
                </tbody>

            </table>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <c:set var="classList" value="${map.classList}"/>
    <script>
        const classList = new Array();

        <c:forEach items="${map.classList}" var="item">
            classList.push("${item.classPoint}");
        </c:forEach>

        const classTerm = new Array();

        <c:forEach items="${map.classList}" var="item">
            classTerm.push("${item.classTrem}");
        </c:forEach>

    </script>

    <script src="/resources/js/professor/taskWrite.js"></script>
    
    
</body>
</html>