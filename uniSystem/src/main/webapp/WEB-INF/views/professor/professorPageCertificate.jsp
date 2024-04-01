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

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/professor/style-professorPageCertificate.css">
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container">
            <div id="professorCertificate" class="certificate">
                <div class="header">
                    <img src="/resources/images/main-logo2.png" alt="University Logo" id="logoImg">
                </div>
                <div class="content">
                    <c:if test="${!empty loginMember.memberProfile}" >
                        <img src="${loginMember.memberProfile}" id="profileImage">
                    </c:if>
                    <c:if test="${empty loginMember.memberProfile}" >
                        <img src="/resources/images/background/user.png" id="profileImage">
                    </c:if>
                    <div class="info">
                        <p><strong>학번 :</strong> <span id="studentID">${loginMember.memberNo}</span></p>
                        <p><strong>이름 :</strong> <span id="name">${loginMember.memberName}</span></p>
                        <p><strong>학과 :</strong> <span id="department">${loginMember.departmentName}</span></p>
                        <p><strong>주소 </strong></p>
                        <p><span id="address" style="word-wrap: break-word;">${loginMember.memberAddr}</span></p>
                        <p><strong>주민등록번호 :</strong> <span id="residentID">${loginMember.memberSsn}</span></p>
                    </div>
                </div>
            </div>
            <button id="generateCertificateBtn" class="btn">교원증 저장</button>
            <button id="generateCertificateBtnC" class="btn">교원증 캡처</button>
        </div>



        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <!-- QR 코드 생성을 위한 라이브러리 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/qrcode@latest"></script>

    <%-- 사진 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/professor/professorPageCertificate.js"></script>
    
</body>
</html>
