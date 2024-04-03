<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>개인 정보 수정</title>
	<link rel="stylesheet" href="/resources/css/style-main.css">
	<link rel="stylesheet" href="/resources/css/collegian/collegian-style.css">
	<script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
    
</head>

<body>

	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="main">
			<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />
			
			 <div class="stu-container">
            <div class="stu-header">
                <h2>개인 정보 수정</h2>
            </div>

            <c:choose>
                <c:when test="${empty loginMember.memberProfile}">
                    <c:set var="imgSrc" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzvIOVR3wCWA_xolR9Z8AvEs0D9KAofBSsCr29hr--XA&s"/>
                </c:when>
                <c:otherwise>
                    <c:set var="imgSrc" value="${loginMember.memberProfile}"/>
                </c:otherwise>
            </c:choose>

            <div class="info-container">

               <div class="profile-area">
                    <div class="profile-img">
                        <img  id="preview"  src="${imgSrc}">
                    </div>

                    <div class="profile-btn-area">
                        <form action="/collegian/changeProfile" method="post" enctype="multipart/form-data" onsubmit="return profileValidation()">
                            <label for="profile-input" class="upload-area">
                                <input id="route" style="padding-left: 10px" placeholder="프로필 사진을 등록해주세요" disabled>
                                <span><img src="/resources/images/collegian/upload.png"></span>
                            </label>
                            <input id="profile-input" type="file" value="${loginMember.memberProfile}" name="profileImg" accept=".gif, .jpg, .png" >
                            <button type="submit">변경하기</button>
                            <button type="button" onclick="deleteProfile()">삭제하기</button>
                        </form>
                    </div>
               </div>

               <div class="input-area">
                    <form action="/collegian/updateInfo" method="post">
                        <div class="input-row">
                            성명
                            <input type="text" value="학생일" disabled>
                            학번
                            <input type="text" value="17-73037996" disabled>
                            학과
                            <input type="text" value="컴퓨터과학과" disabled>
                        </div>
                        <div class="input-row double">
                            번호
                            <input type="text" value="${loginMember.memberPhone}" name="memberPhone" id="memberPhone">
                            EMAIL
                            <input type="text" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail}" maxlength="30" autocomplete="off">
                        </div>
                        <div class="input-row">

                        <c:set var="addr" value="${loginMember.memberAddr}"/>

                        <c:set var="text" value="${fn:split(addr,',')}"/>

                            우편번호
                            <input type="text" name="memberAddr" placeholder="우편번호" value="${text[0]}" maxlength="6" id="sample6_postcode">
                            <button type="button" onclick="sample6_execDaumPostcode()" id="addrBtn">주소 검색</button>
                        </div>
                        <div class="adress-row double">
                            <div>주소</div>
                            <div>
                                <input type="text" name="memberAddr" value="${text[1]}" placeholder="도로명/지번 주소" id="sample6_address">
                                <input type="text" name="memberAddr" value="${text[2]}" placeholder="상세주소" id="sample6_detailAddress">
                            </div>
                        </div>

                        <c:if test="${loginMember.memberStatus == 'Y'}" > 
                            <c:set var="st" value="휴학중"/>
                        </c:if>
                        <c:if test="${loginMember.memberStatus == 'N'}" > 
                            <c:set var="st" value="재학중"/>
                        </c:if>
                        <c:if test="${loginMember.memberStatus == 'P'}" > 
                            <c:set var="st" value="졸업생"/>
                        </c:if>
                        <c:if test="${loginMember.memberStatus == 'D'}" > 
                            <c:set var="st" value="중퇴"/>
                        </c:if>

                        <div class="input-row">
                            학적상태
                            <input type="text" value="${st}" disabled>
                            <button type="button" id="ToChange">학적 변동 신청</button>
                        </div>
                        <div class="input-row">
                            입학일자
                            <input type="text" value="${loginMember.memberDate}" disabled>
                            졸업일자
                            <input type="text" disabled>
                        </div>

                        <div class="subBtn">
                            <button type="submit">수정하기</button>
                        </div>
                        
                    </form>
                
               </div>
                  
               
            </div>


        </div>
			
		</div>
			
	</main>
	<script src="/resources/js/collegian/nav.js"></script>
	<script src="/resources/js/collegian/info.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; // 주소 변수

                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>


</body>


</html>