<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/signUp.css">
</head>
<body>

   
    <section class="top">
        <h1>학사 정보 등록</h1>
    </section>
    <section class="logo">
        <div id="main-logo">
            <a href="/" class="logoText">
                <div>UNI-SYSTEM</div>
                <div>KH INFORMATION EDUCATION CENTER</div>
                <div>UNIVERSITY</div>
            </a>
        </div>
    </section>

    <form>
        
        <section class="number">
            <p>학번, 교번, 관리자코드</p>
            <span>* 번호를 확인해주세요</span>
        </section>
        <div id="inputNo">
            <input type="text" placeholder="2020204401">
        </div>
        <section class="pw">
            <p>비밀번호</p>
            <span> * 영문 및 숫자 , 특수문자 조합으로~</span>
        </section>
        <div id="inputPw">
            <input type="password" placeholder="비밀번호를 입력하세요">
        </div>
    
        <section class="pw2">
            <p>비밀번호 확인</p>
            <span> * 비밀번호가 일치하지 않습니다.</span>
        </section>
        <div id="inputPw2">
            <input type="password" placeholder="비밀번호를 한번 더 입력하세요">
        </div>
    
        <section class="name">
            <p>이름</p>
            <span> * 이름을 입력해주세요.</span>
        </section>
        <div id="inputName">
            <input type="text" placeholder="홍길동">
        </div>
    
    
        <section class="addr">
            <p>주소</p>
        </section>
        <div id="inputAddr">
            <input type="text" placeholder="서울시 강남구 테헤란로">
            <button id="addrBtn">주소검색</button>
        </div>
        <div id="inputAddr2">
            <input type="text" placeholder="KH정보 교육원 3층">
        </div>
    
    
        <section class="email">
            <p>이메일</p>
            <span>* 이메일 형식이 맞지 않습니다.</span>
        </section>
        <div id="inputEmail">
            <input type="text" placeholder="user01@kh.or.kr">
            <button id="emailBtn">인증번호 발송</button>
        </div>
    
        <div class="check">
            <section class="emailcheck">
                <p>인증번호 확인</p>
            </section>
            <div id="inputEmail2">
                <input type="text" placeholder="user01@kh.or.kr">
                <button id="emailBtn2">인증번호 확인</button>
            </div>
        </div>
    
        
        <section class="tel">
            <p>연락처</p>
            <span> * 전화번호 형식에 맞지않습니다.</span>
        </section>
        <div id="inputTel">
            <input type="text" placeholder="01012345678">
        </div>
    
    
        <section class="birth">
            <p>생년월일</p>
        </section>
        <div id="inputBirth">
            <input type="text" placeholder="20001201">
        </div>
    
        <section class="fm">
            <p>성별(선택)</p>
            <input type="radio" name="fml" value="남"> 남
            <input type="radio" name="fml" value="여"> 여
        </section>

        <section class="type">
            <div>
                <p>구 분</p>
                <span>* 필수선택사항</span>
                <input type="radio" name="memberType" value="교수"> 교수 
                <input type="radio" name="memberType" value="교직원"> 교직원
                <input type="radio" name="memberType" value="학생"> 학생
            </div>
        </section>


        <div class="frmBtn">
            <button>정보등록</button>
        </div>
    </form>


    
</body>
</html>