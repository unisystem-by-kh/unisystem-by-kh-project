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
</head>
<body>

    <main>

        <!-- 헤더 인클루드 -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <%-- 여기부터 작성 --%>
        <div class="mainContainer">


            <c:set var='memberNo' value='${loginMember.memberNo}' />
            <!-- 로그인 정보 영역 -->

            <%-- 학생 일 경우 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '01'}" >
                <div class="loginMember-Info-Area">
                    <c:if test="${empty loginMember.memberProfile}" >
                        <div><img src="resources/images/background/user.png" id="profileImg"></div>
                    </c:if>
                    <c:if test="${!empty loginMember.memberProfile}" >
                        <div><img src="${loginMember.memberProfile}" id="profileImg"></div>
                    </c:if>
                    
                    <div class="info-area">
                        <div class="neon-sign"><a href="#" id="neon">${loginMember.memberName} 학생</a></div>
                        <div>학번 : ${loginMember.memberNo}</div>
                        <div>${loginMember.memberEmail}</div>

                        <c:set var="memberDate" value="${loginMember.memberDate}" />
                        <div class="date">입학일자 : ${fn:substring(memberDate, 0, 13)}</div>

                        <c:if test="${loginMember.memberStatus == 'N'}">
                            <div class="recode-area">상태 : 재학중</div>
                        </c:if>
                        <c:if test="${loginMember.memberStatus == 'Y'}">
                            <div class="recode-area">상태 : 휴학</div>
                        </c:if>
                        <c:if test="${loginMember.memberStatus == 'P'}">
                            <div class="recode-area">상태 : 졸업</div>
                        </c:if>
                        <c:if test="${loginMember.memberStatus == 'D'}">
                            <div class="recode-area">상태 : wndxhl</div>
                        </c:if>
                    </div>
                    <div class="logoutBtn"><a href="/logout">로그아웃</a></div>
                </div>
            </c:if>

            <%-- 교수 일 경우 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '02'}" >
                <div class="loginMember-Info-Area">
                    <c:if test="${empty loginMember.memberProfile}" >
                        <div><img src="resources/images/background/user.png" id="profileImg"></div>
                    </c:if>
                    <c:if test="${!empty loginMember.memberProfile}" >
                        <div><img src="${loginMember.memberProfile}" id="profileImg"></div>
                    </c:if>
                    
                    <div class="info-area">
                        <div class="neon-sign"><a href="#">${loginMember.memberName} 교수님</a></div>
                        <div>교번 : ${loginMember.memberNo}</div>
                        <div>${loginMember.memberEmail}</div>

                        <c:set var="memberDate" value="${loginMember.memberDate}" />
                        <div class="date">가입일 : ${fn:substring(memberDate, 0, 13)}</div>

                        <c:if test="${loginMember.memberStatus == 'N'}">
                            <div class="recode-area">상태 : 재직중</div>
                        </c:if>
                        <c:if test="${loginMember.memberStatus != 'N'}">
                            <div class="recode-area">상태 : 퇴직</div>
                        </c:if>
                    </div>
                    <div class="logoutBtn"><a href="/logout">로그아웃</a></div>
                </div>
            </c:if>

            <%-- 교직원 일 경우 --%>
            <c:if test="${fn:substring(memberNo, 0, 2) == '03'}" >
                <div class="loginMember-Info-Area">
                    <c:if test="${empty loginMember.memberProfile}" >
                        <div><img src="resources/images/background/user.png" id="profileImg"></div>
                    </c:if>
                    <c:if test="${!empty loginMember.memberProfile}" >
                        <div><img src="${loginMember.memberProfile}" id="profileImg"></div>
                    </c:if>
                    
                    <div class="info-area">
                        <div class="neon-sign"><a href="#">${loginMember.memberName} 교직원</a></div>
                        <div>관리자 번호 : ${loginMember.memberNo}</div>
                        <div>${loginMember.memberEmail}</div>

                        <c:set var="memberDate" value="${loginMember.memberDate}" />
                        <div class="date">가입일 : ${fn:substring(memberDate, 0, 13)}</div>

                        <c:if test="${loginMember.memberStatus == 'N'}">
                            <div class="recode-area">상태 : 재직중</div>
                        </c:if>
                        <c:if test="${loginMember.memberStatus != 'N'}">
                            <div class="recode-area">상태 : 퇴직</div>
                        </c:if>
                    </div>
                    <div class="logoutBtn"><a href="/logout">로그아웃</a></div>
                </div>
            </c:if>

            <div class="border-area">
                <!-- 슬라이더 인클루드 -->
                <jsp:include page="/WEB-INF/views/common/slider.jsp" />
            </div>

        </div>

       
        <!-- 푸터 인클루드 -->
    	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
	</main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/main.js"></script>
    
    <!-- 슬라이더 효과 JS -->
    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
        var slides = document.getElementsByClassName("mySlides");
        for (var i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
            slides[slideIndex-1].style.display = "block";
            setTimeout(showSlides, 3000);
        }
    </script>

</body>
</html>