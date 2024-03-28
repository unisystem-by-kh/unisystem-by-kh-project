<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/login.css">

    <title>로그인</title>
</head>
<body>
    
    <main>

        <!-- 오시는 길 -->
        <a href="/comeMap" class="come-on-area">
            <i class="fa-solid fa-flag fa-2x"></i>
        </a>

        <!-- 로고 부분 -->
        <section class="logo-area">
            <h1>UNI-SYSTEM</h1>
        </section>

        <!-- 로그인 부분 -->
        <form action="login" method="post" id="loginFrm">
            <fieldset class="id-pw-area">
                <section>
                    <input type="text" name="memberNo" id="userId" placeholder="학번" value="${cookie.saveId.value}" >
                    <input type="password" name="memberPw" id="userPw" placeholder="비밀번호">      
                </section>
                <section>
                    <button>로그인</button>
                </section>
            </fieldset>

            <c:if test="${ !empty cookie.saveId.value}">
                <c:set var="chk" value="checked"/>
            </c:if>

            <!-- 아이디 저장 부분 -->
            <div class="saveId-area">
                <input type="checkbox" name="saveId" ${save}  id="saveId" ${chk}>
                <label for="saveId"><i class="fas fa-check"></i>아이디 저장</label>
            </div>

            <!-- 찾기/회원가입 부분 -->
            <p class="text-area">
                <a class="btn-open-modal-id">아이디 찾기</a>
                |
                <a class="btn-open-modal-pw">비밀번호 찾기</a>
                |
                <a href="/signUp">학사 정보 등록</a>
            </p>
        </form>
    </main>

    <div class="modal id">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>아이디 찾기</h2>
            <input type="text" name="memberName" id="idUserName" placeholder="이름을 입력해주세요.">
            <input type="email" name="memberEmail" id="idUserEmail" placeholder="이메일을 입력해주세요.">
            <br>
            <button class="btn" id="btn1">아이디 찾기</button>
        </div>
    </div>

    <div class="modal pw">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>비밀번호 찾기</h2>
            <input type="text" name="memberName" id="pwUserName" placeholder="이름을 입력해주세요.">
            <input type="email" name="memberEmail" id="pwUserEmail" placeholder="이메일을 입력해주세요.">
            <input type="text" name="memberNo" id="pwUserId" placeholder="학번을 입력해주세요.">
            <br>
            <button class="btn" id="btn2">비밀번호 찾기</button>
        </div>
    </div>

    <div id="loadingSpinner"></div>

    <script src="/resources/js/login.js"></script>

    <c:if test="${!empty message}">
        <script>
            swal("${message}", "", "success");
        </script>
    </c:if>
</body>
</html>