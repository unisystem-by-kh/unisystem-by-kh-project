<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

        <!-- 슬라이더 인클루드 -->
        <jsp:include page="/WEB-INF/views/common/slider.jsp" />

        <%-- 여기부터 작성 --%>
        <div class="mainContainer">

            <!-- 로그인 정보 영역 -->
            <!-- *로그인 되었을 때 노출 -->
            <div class="loginMember-Info-Area">
                <div><img src="https://play-lh.googleusercontent.com/38AGKCqmbjZ9OuWx4YjssAz3Y0DTWbiM5HB0ove1pNBq_o9mtWfGszjZNxZdwt_vgHo" id="profileImg"></div>
                <div class="info-area">
                    <div>ㅇㅇㅇ 교수</div>
                    <div>비즈니스경영과</div>
                    <div></div>
                </div>
                <div class="logoutBtn"><button><a href="login">로그아웃</a></button></div>
                <div class="recode-area">학적상태 : 재학중</div>
            </div>



            <div class="border-area">

                <!-- 버튼 영역 -->
                <div class="button-area">
                    <button><a href="#">학사 일정</a></button>
                    <button><a href="#">학과 공지</a></button>
                    <button><a href="board/freeBoardList">자유 게시판</a></button>
                    <button><a href="#">1:1 문의</a></button>
                </div>
    
                <!-- 게시글 뷰 영역 (6개만 노출해야함으로 for문 사용 금지해서 각각 데이터 순서대로 넣기) -->
                <div class="border-view">
                    <div class="border-view-select">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXaHbhHUcGd8wk0mBu9mLO3eEJ2f0Vt7SsolH_UYSwuQ&s">
                        <a href="#">
                            <div class="border-title">게시글 제목 입니다. (1)</div>
                            <div class="border-content">게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)</div>
                        </a>
                    </div>
                    <div class="border-view-select">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODA5MDRfNTYg/MDAxNTM2MDU1MTc3NDgx.ika2gOEJPQfDnVP8Au6e-at-i-NnIeiZ6I9dLcY8sqIg.SjbDUHAkDbWk1NQv_2sLeyZtqzFWxPwZrEL3chEQF5og.JPEG.jinmichu/IMG_8630.jpg?type=w800">
                        <a href="#">
                            <div class="border-title">게시글 제목 입니다. (1)</div>
                            <div class="border-content">게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)</div>
                        </a>
                    </div>
                    <div class="border-view-select">
                        <img src="https://i.pinimg.com/originals/74/41/1c/74411c5ec7cbd35a7c4fc55224ccbaae.jpg">
                        <a href="#">
                            <div class="border-title">게시글 제목 입니다. (1)</div>
                            <div class="border-content">게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)</div>
                        </a>
                    </div>
                    <div class="border-view-select">
                        <img src="https://image.musinsa.com/mfile_s01/2019/04/08/fe5df232cafa4c4e0f1a0294418e5660171620.jpg">
                        <a href="#">
                            <div class="border-title">게시글 제목 입니다. (1)</div>
                            <div class="border-content">게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)</div>
                        </a>
                    </div>
                    <div class="border-view-select">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-57PUfFXY9h0b71zBAcI-YDxXRSmMX4BhHA&usqp=CAU">
                        <a href="#">
                            <div class="border-title">게시글 제목 입니다. (1)</div>
                            <div class="border-content">게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)게시글 내용 입니다. (1)내용내용내용내용내용</div>
                        </a>
                    </div>
                    
                    <!-- 더보기 모양 영역 -->
                    <div class="moreBoard-area">
                        <button><a href="#">+</a></button>
                    </div>
                </div>

            </div>

        </div>



        <!-- 푸터 인클루드 -->
    	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
	</main>

    <script src="/resources/js/header.js"></script>
    
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