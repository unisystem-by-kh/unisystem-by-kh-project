<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memberList" value="${map.memberListInfo}" />

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

    ${memberList[0]}

    <form action="/signUp" method="POST" name="signUpFrm" id="signUpFrm">
        
        <section class="number">
            <p>학번, 교번, 관리자코드</p>
            <span id="noMessage">* 번호를 확인해주세요</span>
        </section>

        <div id="inputNo">
            <input type="text" placeholder="2020204401" name="memberNo" id="memberNo">
        </div>

        <section class="pw">
            <p>비밀번호</p>
            <span id="pwMessage"> * 영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>
        </section>

        <div id="inputPw">
            <input type="password" placeholder="비밀번호를 입력하세요" name="memberPw" id="memberPw">
        </div>
    
        <section class="pw2">
            <p>비밀번호 확인</p>
            <span id="pwMessageConfirm"> * 비밀번호가 일치하지 않습니다.</span>
        </section>

        <div id="inputPw2">
            <input type="password" placeholder="비밀번호를 한번 더 입력하세요" name="memberPwConfirm" id="memberPwConfirm">
        </div>
    
        <section class="name">
            <p>이름</p>
            <span id="nameMessage"> * 이름을 입력해주세요.</span>
        </section>

        <div id="inputName">
            <input type="text" placeholder="홍길동" name="memberName" id="memberName">
        </div>
    
    
        <section class="addr">
            <p>주소</p>
        </section>

        <div id="inputAddr">
            <input type="text" name="memberAddr" placeholder="우편번호" maxlength="6" id="sample6_postcode">
            
            <button type="button" onclick="sample6_execDaumPostcode()" id="addrBtn">검색</button>
        </div>

        <div id="inputAddr2">
            <input type="text" name="memberAddr" placeholder="도로명/지번 주소" id="sample6_address">
        </div>

        <div id="inputAddr2">
            <input type="text" name="memberAddr" placeholder="상세주소" id="sample6_detailAddress">
        </div>
    
    
        <section class="email">
            <p>이메일</p>
            <span id="emailMessage">* 이메일 형식이 맞지 않습니다.</span>
        </section>

        <div id="inputEmail">
            <input type="text" placeholder="user01@kh.or.kr" name="memberEmail" id="memberEmail" placeholder="아이디(이메일)" maxlength="30" autocomplete="off">
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
            <span id="phoneMessage"> * 전화번호 형식에 맞지않습니다.</span>
        </section>
        <div id="inputTel">
            <input type="text" placeholder="01012345678" name="memberPhone" id="memberPhone">
        </div>
    
        <section class="fm">
            <p>성별</p>
            <input type="radio" name="memberGen" value="M" id="memberGenM"> 남
            <input type="radio" name="memberGen" value="F" id="memberGenF"> 여
            <span id="genMessage">성별을 선택해주세요.</span>
        </section>

        <div class="frmBtn">
            <button>정보등록</button>
        </div>

    </form>

    <%-- 지도 API --%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    <script>
        const memberList = "${memberList}";
        const memberListArray = memberList.split('Member');
    </script>

    <script src="/resources/js/signUp.js"></script>


    <c:if test="${!empty message}">
        <script>
            swal("${message}", "", "success");
        </script>
    </c:if>
    
</body>


</html>