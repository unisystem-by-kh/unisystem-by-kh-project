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
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>

</head>
<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />



        <div class="main-title">
            <h1>등록금 고지서</h1>
        </div>

        <c:choose>
            <c:when test="${result != 0}">
                <div class="pay-clear">
                    <div><img src="/resources/images/board/check.png" id="checkImage" /></div>
                    <div>'${loginMember.memberName}님' 납부할 금액이 없습니다.</div>
                </div>

                <div class="pay-clear-button">
                    <a href="/main" id="mainPagi">메인 페이지로</a>
                    <a id="backPagi">이전 페이지로</a>
                </div>
            </c:when>
            <c:otherwise>
                       <div class="pay-main">
        <div class="bill-details">
            <h2>학생 정보</h2>
            <table>
                <tr>
                    <th>이름</th>
                    <td>${loginMember.memberName}</td>
                </tr>
                <tr>
                    <th>학번</th>
                    <td>${loginMember.memberNo}</td>
                </tr>
                <tr>
                    <th>학과</th>
                    <td>${loginMember.departmentName}</td>
                </tr>
                 <tr>
                    <th>학년</th>
                    <td>${loginMember.memberGrade}</td>
                </tr>
            </table>
        </div>
    
        <div class="bill-details">
            <h2>등록금 납부 영수증</h2>
            <table>
                
                <tr>
                    <td>수업료</td>
                    <td>${loginMember.departmentPrice}</td>
                </tr>
                <tr>
                    <td>총 납부금액</td>
                    <td>${loginMember.departmentPrice}</td>
                </tr>
            </table>
        </div>
    
        <div class="total">
            <p>총 금액: ${loginMember.departmentPrice}</p>
        </div>

    </div>

                <div class="pay-button">
                    <button id="print">출력</button>
                    <button onclick="kakaoPay()">납부하기</button>
                </div>
            </c:otherwise>
        </c:choose>    

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>

    
    <script>
        const loginMemberNo1 = '${loginMember.memberNo}'

        const departmentPrice = '${loginMember.departmentPrice}'

    </script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/jspdf.min.js"></script>
    <script src="/resources/js/html2canvas.js"></script>
    <script src="/resources/js/tuition/tuition.js"></script>
   

   
</body>
</html>