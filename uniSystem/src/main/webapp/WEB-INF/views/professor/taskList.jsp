<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/professor/taskList.css">
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <div class="mainContainer">
            <div class="taskList">
                <h2>과제 목록</h2>
                <table>
                    <thead>
                        <tr>
                            <th>과제번호</th>
                            <th>학년</th>
                            <th>학기</th>
                            <th>과목명</th>
                            <th>분류</th>
                            <th>파일</th>
                            <th>마감일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>1</td>
                            <td>자료구조</td>
                            <td>전공</td>
                            <td><a href="/taskDetails.jsp?id=1">파일1</a></td>
                            <td>2024-03-15</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>프로그래밍 기초</td>
                            <td>전공</td>
                            <td><a href="/taskDetails.jsp?id=2">파일2</a></td>
                            <td>2024-03-18</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>4</td>
                            <td>1</td>
                            <td>영어 회화</td>
                            <td>교양</td>
                            <td><a href="/taskDetails.jsp?id=3">파일3</a></td>
                            <td>2024-03-20</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>데이터베이스</td>
                            <td>전공</td>
                            <td><a href="/taskDetails.jsp?id=4">파일4</a></td>
                            <td>2024-03-22</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>1</td>
                            <td>1</td>
                            <td>국어문학</td>
                            <td>교양</td>
                            <td><a href="/taskDetails.jsp?id=5">파일5</a></td>
                            <td>2024-03-25</td>
                        </tr>
                    </tbody>
                </table>
                <div class="pagination">
                    <a href="#" class="prev">&lt;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#" class="next">&gt;</a>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>
    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/professor/taskList.js"></script>
</body>
</html>
