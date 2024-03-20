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
                        <tr>
                            <td>
                                <label>
                                    학번1
                                    <input type="checkbox" class="select-row">
                                </label>
                            </td>
                            <td><a href="/student/selectStudentDetail">이름1</a></td>
                            <td>학년1</td>
                            <td>학과1</td>
                            <td class="std-status">재학중<input type="checkbox" hidden></td>
                            <td>이수 여부1</td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    학번2
                                    <input type="checkbox" class="select-row">
                                </label>
                            </td>
                            <td><a href="/student/selectStudentDetail">이름2</a></td>
                            <td>학년2</td>
                            <td>학과2</td>
                            <td class="std-status">복학신청<input type="checkbox" hidden></td>
                            <td>이수 여부2</td>
                        </tr>
                        


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