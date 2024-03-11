<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="pay.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="main-title">
        <h1>등록금 고지서</h1>
    </div>
    <div class="pay-main">
        <div class="pay-one">
            <div>성명 : </div>
            <div>유저일</div>
            <div>대학 : </div>
            <div>공과대학</div>
            <div>학년 : </div>
            <div>2학년</div>
        </div>
        <div class="pay-two">
            <div>학번 : </div>
            <div>12345678</div>
            <div>학과 : </div>
            <div>기계공학과</div>
            <div>등록구분 : </div>
            <div>일반</div>
        </div>
        <div class="pay-three">
            <div>등록금 납부 영수증</div>
        </div>
        <div class="pay-four">
            <div>수업료</div>
            <div>1,000,000 원</div>
        </div>
        <div class="pay-five">
            <div>총 납부금액</div>
            <div>1,000,000 원</div>
        </div>
    </div>

    <div class="pay-button">
        <button>출력</button>
        <button>납부하기</button>
    </div>

    <br>

    <div class="pay-clear">
        <div><img src="/resources/images/board/check.png" id="checkImage" /></div>
        <div>납부할 금액이 없습니다.</div>
    </div>

    <div class="pay-clear-button">
        <button>메인 페이지로</button>
        <button>이전 페이지로</button>
    </div>



    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>