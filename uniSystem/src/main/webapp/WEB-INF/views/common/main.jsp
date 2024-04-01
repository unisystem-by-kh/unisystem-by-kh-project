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
    <script src="https://code.jquery.com/jquery-3.6.1.slim.min.js" integrity="sha256-w8CvhFs7iHNVUtnSP0YKEg00p9Ih13rlL9zGqvLdePA=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/slick-1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/slick-1.8.1/slick/slick-theme.css"/>
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

        <div class="btmArea">
            <%-- 게시판 영역 --%>
            <div class="slide_div_wrap">
                <div>
                    <h1>자유게시판</h1>
                </div>
                <div class="slide_div">
                    <div class="img-title">
                        <div>
                            <a href="/board/3/${board[0].boardNo}">${board[0].boardTitle}</a>
                        </div>
                        <div>
                            <c:if test="${empty board[0].fileList}">
                                <img src="/resources/images/noimage.gif">
                            </c:if>
                            <c:if test="${!empty board[0].fileList}">
                                <img src="${board[0].fileList[0].boardFilePath}${board[0].fileList[0].boardFileRename}">
                            </c:if>
                        </div>
                    </div>
                    <div class="img-title">
                        <div>
                            <a href="/board/3/${board[1].boardNo}">${board[1].boardTitle}</a>
                        </div>
                        <div>
                            <c:if test="${empty board[1].fileList}">
                                <img src="/resources/images/noimage.gif">
                            </c:if>
                            <c:if test="${!empty board[1].fileList}">
                                <img src="${board[1].fileList[0].boardFilePath}${board[1].fileList[0].boardFileRename}">
                            </c:if>
                        </div>
                    </div>
                    <div class="img-title">
                        <div>
                            <a href="/board/3/${board[2].boardNo}">${board[2].boardTitle}</a>
                        </div>
                        <div>
                            <c:if test="${empty board[2].fileList}">
                                <img src="/resources/images/noimage.gif">
                            </c:if>
                            <c:if test="${!empty board[2].fileList}">
                                <img src="${board[2].fileList[0].boardFilePath}${board[2].fileList[0].boardFileRename}">
                            </c:if>
                        </div>
                    </div>
                    <div class="img-title">
                        <div>
                            <a href="/board/3/${board[3].boardNo}">${board[3].boardTitle}</a>
                        </div>
                        <div>
                            <c:if test="${empty board[3].fileList}">
                                <img src="/resources/images/noimage.gif">
                            </c:if>
                            <c:if test="${!empty board[3].fileList}">
                                <img src="${board[3].fileList[0].boardFilePath}${board[3].fileList[0].boardFileRename}">
                            </c:if>
                        </div>
                    </div>
                    <div class="img-title">
                        <div>
                            <a href="/board/3/${board[4].boardNo}">${board[4].boardTitle}</a>
                        </div>
                        <div>
                            <c:if test="${empty board[4].fileList}">
                                <img src="/resources/images/noimage.gif">
                            </c:if>
                            <c:if test="${!empty board[4].fileList}">
                                <img src="${board[4].fileList[0].boardFilePath}${board[4].fileList[0].boardFileRename}">
                            </c:if>
                        </div>
                    </div>
                </div>
                
            </div>


            <%-- 시간표 영역 --%>
            <div class="timeArea">
                시간표 넣어주세욥
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

        $(document).ready(function(){

            $(".slide_div").slick(
             {   dots: true,
                autoplay : true,
                autoplaySpeed: 5000
             }
            );
        })
    </script>

</body>
</html>