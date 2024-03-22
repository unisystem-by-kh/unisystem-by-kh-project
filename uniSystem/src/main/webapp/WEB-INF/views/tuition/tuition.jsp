<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/tuition/tuition.css">
</head>
<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="main-title">
            <h1>등록금 고지서</h1>
        </div>
        <div class="pay-main">
            <div class="pay-one">
                <div>성명 : </div>
                <div>${loginMember.memberName}</div>
                <div>학년 : </div>
                <div>${loginMember.memberGrade}</div>
            </div>
            <div class="pay-two">
                <div>학번 : </div>
                <div>${loginMember.memberNo}</div>
                <div>등록구분 : </div>
                <div>일반</div>
            </div>
            <div class="pay-three">
                <div>등록금 납부 영수증</div>
            </div>
            <div class="pay-four">
                <div>수업료</div>
                <div>${loginMember.departmentPrice}</div>
            </div>
            <div class="pay-five">
                <div>총 납부금액</div>
                <div>${loginMember.departmentPrice}</div>
            </div>
        </div>

        <div class="pay-button">
            <button>출력</button>
            <button onclick="kakaoPay()">납부하기</button>
        </div>

        <br>

        <div class="pay-clear">
            <div><img src="/resources/images/board/check.png" id="checkImage" /></div>
            <div>납부할 금액이 없습니다.</div>
        </div>

        <div class="pay-clear-button">
            <a href="/main">메인 페이지로</a>
            <a href="#">이전 페이지로</a>
        </div>



        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>

    
    <script>
        const loginMemberNo = '${loginMember.memberNo}'

        const departmentPrice = '${loginMember.departmentPrice}'
    </script>
    <script src="/resources/js/tuition/tuition.js"></script>
</body>
</html>