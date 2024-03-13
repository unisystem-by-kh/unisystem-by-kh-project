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
    <link rel="stylesheet" href="/resources/css/professor/style-professorPage-StudentGradeInsert.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">
            
            <div class="row1">
                <div class="row1-area">
                    <div class="class-info-area">
                        <div>강의정보</div>
                        <!-- 관련 데이터 삽입 -->
                        <div class="class-info">
                            <div>
                                <div>강의번호 : </div>
                                <div>과목명 : </div>
                                <div>담당교수 : </div>
                                <div>현재상태 : </div>
                                <div>수강인원 : </div>
                            </div>
                            <div>
                                <div>123456</div>
                                <div>통계학계론</div>
                                <div>홍길동</div>
                                <div>강의중</div>
                                <div>28</div>
                            </div>
                        </div>
                    </div>
        
                    <div class="class-detail-info-area">
                        <div>강의 세부 정보</div>
                        <div class="class-detail-info">
                            <div class="class-detail-title">
                                <div>구분</div>
                                <div>학과</div>
                                <div>총 강의 학점</div>
                                <div>수강생 평균 취득 학점</div>
                                <div>수강인원</div>
                                <div>비고</div>
                            </div>
        
                            <div class="class-detail-content">
                                <div>2023년 1학기</div>
                                <div>경영학과</div>
                                <div>3</div>
                                <div>2.5</div>
                                <div>27</div>
                                <div>...</div>
                            </div>
                            
                            <div class="class-detail-content">
                                <div>2023년 2학기</div>
                                <div>경영학과</div>
                                <div>2</div>
                                <div>2.7</div>
                                <div>29</div>
                                <div>...</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row2">
                <div class="row2-area">
                    <div class="objectClass-area">
                        <select name="objectClass" id="objectClass">
                            <option value="교과목선택">교과목 선택</option>
                            <option value="경영학개론">경영학개론</option>
                            <option value="품질경영관리A">품질경영관리A</option>
                            <option value="통계학개론">통계학개론</option>
                            <option value="문화와이해">문화와이해</option>
                        </select>
                        <div class="objectClass-img">
                            <img src="https://image.slidesharecdn.com/sns-130503032642-phpapp01/85/sns-1-320.jpg?cb=1668837476">
                        </div>
                        <div class="objectClass-view">
                            <p>현재 선택된 교과목</p>
                            <br>
                            <p id="selectedSubject"></p>
                        </div>
                    </div>

                    <div class="student-grade-insert-area">
                        <form action="#" method="post">
                            <div class="student-grade-insert-info">

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

                                <input type="hidden" name="semester" value="1">

                                <div id="semester-text"></div>
                                <div><button>조회</button></div>
                                <div><button>등록</button></div>

                            </div>
    
                            <div class="objectClass-detail">
                                <div class="objectClass-detail-title">
                                    <div>학번</div>
                                    <div>학년</div>
                                    <div>학기</div>
                                    <div>이름</div>
                                    <div>성적</div>
                                </div>

                                <div class="objectClass-detail-content-area">
                                    <!-- for문 돌려서 처리 / 데이터 삽립해야함 -->
                                    <div class="objectClass-detail-content">
                                        <div>123456</div>
                                        <div>N학년</div>
                                        <div>N학기</div>
                                        <div>홍길동</div>
                                        <div><input type="text" placeholder="  학점을 입력해주세요."></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

    <script src="/resources/js/professor/professorPage-StudentGradeInsert.js"></script>

</body>
</html>