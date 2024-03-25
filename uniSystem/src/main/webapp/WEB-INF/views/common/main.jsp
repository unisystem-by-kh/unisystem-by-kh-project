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
                    <div title="클릭 시, 마이페이지로 이동"><a href="#"><img src="${loginMember.memberProfile}" id="profileImg"></a></div>
                    
                    <div class="info-area">
                        <div>${loginMember.memberName} 학생</div>
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
                    <div title="클릭 시, 마이페이지로 이동"><a href="#"><img src="${loginMember.memberProfile}" id="profileImg" ></a></div>
                    
                    <div class="info-area">
                        <div>${loginMember.memberName} 교수님</div>
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
                    <div title="클릭 시, 마이페이지로 이동"><a href="#"><img src="${loginMember.memberProfile}" id="profileImg"></a></div>
                    
                    <div class="info-area">
                        <div>${loginMember.memberName} 교직원</div>
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

                <div class="boardImg">
                    <img src="https://previews.123rf.com/images/pavelns/pavelns1705/pavelns170500037/79333183-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98%EC%9D%98-%EB%8F%84%EC%8B%9C-%EC%8B%A4%EB%A3%A8%EC%97%A3.jpg">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5XuBTN0II-idByQLS3yQmQCq0A-Srb_DFKKEy6sHNFg&s">
                    <img src="https://media.istockphoto.com/id/912117924/ko/%EB%B2%A1%ED%84%B0/%EC%98%A4%EB%9E%98-%EB%90%9C-%EC%9C%A0%EB%9F%BD-%EB%A7%88-%ED%92%8D%EA%B2%BD%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%99%94%EB%A0%A4%ED%95%9C-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EC%A7%91.jpg?s=170667a&w=0&k=20&c=mKzSgSoXOlC5Qqxt_CdZqXYh0mqmNt-YHx-WZLlI1j0=">
                    <img src="https://thumb.ac-illust.com/64/641a13cdce4c8166234c63ae27f50c69_t.jpeg">
                </div>

                <!-- 버튼 영역 -->
                <div class="button-area">
                    <a href="board/1"><button>학사 일정</button></a>
                    <a href="board/2"><button>학과 공지</button></a>
                    <a href="board/3"><button>자유 게시판</button></a>
                    <a href="board/4"><button>1:1 문의</button></a>
                </div>

                <div class="board5">
                    <a href="board/1"><img src="https://static.blex.me/images/title/mildsalmon/2020/2/18/19bt8C.png"></a>
                </div>

                <!-- 게시글 뷰 영역 (5개만 노출해야함으로 for문 사용 금지해서 각각 데이터 순서대로 넣기) 비동기 처리-->
                <div class="border-view"></div>

            </div>

        </div>

        <!-- 슬라이더 인클루드 -->
        <jsp:include page="/WEB-INF/views/common/slider.jsp" />

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