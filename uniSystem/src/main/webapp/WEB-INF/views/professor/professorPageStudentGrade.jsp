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
                    <form id="searchFrm">
                        <select name="key" id="search">
                            <option value="">선택</option>
                            <option value="no">학번</option>
                            <option value="name">이름</option>
                        </select>
                        
                        <div>
                            <i class="fa-solid fa-magnifying-glass-arrow-right"></i>
                        </div>
                        <div>
                            <input type="text" name="query" id="query">
                        </div>
                        <div>
                            <button>검색</button>
                        </div>
                    </form>
                </div>
                <%-- <div class="object-area">조건선택 →</div> --%>
                <%-- ${loginMember} --%>
                <div class="object-select-area">
                    <select name="grade" id="objectList">
                        <%-- <option value="" name="queryG">학년선택</option> --%>
                        <option value="1" name="queryG">1학년</option>
                        <option value="2" name="queryG">2학년</option>
                        <option value="3" name="queryG">3학년</option>
                        <option value="4" name="queryG">4학년</option>
                    </select>
                </div>


                <div class="object-select-area">
                    <select name="term" id="objectList">
                        <%-- <option value="" name="queryT">학기선택</option> --%>
                        <option value="1" name="queryT">1학기</option>
                        <option value="2" name="queryT">2학기</option>
                    </select>
                </div>


                <div class="object-select-area-depart">
                    <select name="depart" id="departmentList">
                        <option value="" name="queryD">학과선택</option>
                        <option value="경제학과" name="queryD">경제학과</option>
                        <option value="통계학과" name="queryD">통계학과</option>
                        <option value="심리학과" name="queryD">심리학과</option>
                    </select>
                </div>

                <div class="object-select-area-class">
                    <select name="classes" id="classList">
                        <option value="" name="queryC">과목선택</option>
                        <option value="JAVA" name="queryC">JAVA</option>
                        <option value="HTML" name="queryC">HTML</option>
                        <option value="Spring" name="queryC">Spring</option>
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
                    <div>과목</div>
                    <div>성적</div>
                </div>

                <div class="content">
                    <div class="grade-content">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>1</div>
                        <div>1</div>
                        <div>경영학과</div>
                        <div>JAVA</div>
                        <div><input type="text"></div>
                    </div>
                </div>
            </div>

            <div class="object-select-area">
                <button id="insertBtn">성적등록</button>
            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script>
        const memberDepartmentNo = ${loginMember.departmentNo};
    </script>

    <script src="/resources/js/header.js"></script>

    <script src="/resources/js/professor/professorPage-StudentGrade.js"></script>


</body>
</html>