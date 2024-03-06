<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/login.css">

    <title>로그인</title>
</head>
<body>
    
    <main>

        <!-- 로고 부분 -->
        <section class="logo-area">
            <h1>UNI-SYSTEM</h1>
        </section>

        <!-- 로그인 부분 -->
        <form action="login" method="post" id="loginFrm">
            <fieldset class="id-pw-area">
                <section>
                    <input type="text" name="userId" id="userId" placeholder="아이디" autocomplete="off">
                    <input type="password" name="userPw" id="userPw" placeholder="비밀번호">                  
                </section>
                <section>
                    <button>로그인</button>
                </section>
            </fieldset>

            <!-- 아이디 저장 부분 -->
            <div class="saveId-area">
                <input type="checkbox" name="saveId" id="saveId">
                <label for="saveId"><i class="fas fa-check"></i>아이디 저장</label>
            </div>

            <!-- 찾기/회원가입 부분 -->
            <p class="text-area">
                <a class="btn-open-modal-id">아이디 찾기</a>
                |
                <a class="btn-open-modal-pw">비밀번호 찾기</a>
                |
                <a href="#">회원가입</a>
            </p>
        </form>
    </main>

    <div class="modal id">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>아이디 찾기</h2>
            <input type="text" name="userName" id="idUserName" placeholder="이름을 입력해주세요.">
            <input type="email" name="userEmail" id="idUserEmail" placeholder="이메일을 입력해주세요.">
            <br>
            <button class="btn" id="btn1">아이디 찾기</button>
        </div>
    </div>

    <div class="modal pw">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>비밀번호 찾기</h2>
            <input type="text" name="userName" id="pwUserName" placeholder="이름을 입력해주세요.">
            <input type="email" name="userEmail" id="pwUserEmail" placeholder="이메일을 입력해주세요.">
            <input type="text" name="userId" id="pwUserId" placeholder="아이디를 입력해주세요.">
            <br>
            <button class="btn" id="btn2">비밀번호 찾기</button>
        </div>
    </div>

    <script src="/resources/js/login.js"></script>
</body>
</html>