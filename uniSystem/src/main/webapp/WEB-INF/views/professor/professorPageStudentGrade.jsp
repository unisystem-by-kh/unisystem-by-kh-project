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
    <link rel="stylesheet" href="/resources/css/professor/style-professorPage-StudentGrade.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <div class="row-area">
                <div class="search-area">
                    <form action="#" id="searchFrm">
                        <select name="search" id="search">
                            <option value="#">전체</option>
                            <option value="#">이름</option>
                            <option value="#">학번</option>
                        </select>
                        
                        <div>
                            <i class="fa-solid fa-magnifying-glass-arrow-right"></i>
                        </div>
                        <div>
                            <input type="text" name="search">
                        </div>
                        <div>
                            <button>검색</button>
                        </div>
                    </form>
                </div>
    
                <%-- <div class="object-area">경영학과</div> --%>

                <div class="object-select-area">
                    <select name="objectList" id="objectList">
                        <option value="1학년">1학년</option>
                        <option value="2학년">2학년</option>
                        <option value="3학년">3학년</option>
                        <option value="4학년">4학년</option>
                    </select>
                </div>


                <div class="object-select-area">
                    <select name="objectList" id="objectList">
                        <option value="1학기">1학기</option>
                        <option value="2학기">2학기</option>
                    </select>
                </div>


                <div class="object-select-area">
                    <select name="objectList" id="objectList">
                        <option value="경영학과">경영학과</option>
                        <option value="통계학과">통계학과</option>
                        <option value="심리학과">심리학과</option>
                    </select>
                </div>

                <div class="object-select-area">
                    <button id="searchBtn">조회하기</button>
                </div>
            </div>

            

            <!-- 정보영역 -->
            <div class="grade-area" title="스크롤해서 더보기">
                <div class="grade-title">
                    <div>학번</div>
                    <div>이름</div>
                    <div>학년</div>
                    <div>학기</div>
                    <div>학과</div>
                    <div>성적</div>
                </div>

                <div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>

                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>성적</div>
                    </div>
                </div>
            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

    <script src="/resources/js/professor/professorPage-StudentGrade.js"></script>

</body>
</html>