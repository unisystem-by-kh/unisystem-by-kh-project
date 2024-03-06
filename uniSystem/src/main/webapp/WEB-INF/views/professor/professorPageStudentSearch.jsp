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
    <link rel="stylesheet" href="/resources/css/professor/style-professorPage-StudentSearch.css">
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <!-- 학생 정보 영역 -->
            <div class="student-area">
                <!-- 재적 상태 값 불러오기 -->
                <div class="student-status">
                    <div>홍길동학생 상태 : 재학중</div>
                    <div>
                        <select name="#" id="#">
                            <!-- 옵션값도 호출해야함 -->
                            <option value="#">통계학계론</option>
                            <option value="#">경영학계론</option>
                            <option value="#">품질경영 A</option>
                            <option value="#">전산회계 B</option>
                        </select>
                    </div>
                </div>
                <div class="student-info">
                    <div class="student-info-area">
                        <div class="student-info-value-name">
                            <div>학번</div>
                            <div>이름</div>
                            <div>학년</div>
                            <div>학기</div>
                            <div>나이</div>
                            <div>과목</div>
                            <div>성적</div>
                        </div>
                        <%-- (영역)테스트용 값 --%>
                        <div class="student-info-value">
                            <div>123456</div>
                            <!-- 이걸로 사용해야함 <a>태그 -->
                            <div><a href="#">홍길동</a></div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                        <div class="student-info-value">
                            <div>123456</div>
                            <div>홍길동</div>
                            <div>1</div>
                            <div>1</div>
                            <div>20</div>
                            <div>통계학계론</div>
                            <div>2.8</div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 시간표 영역 -> 학생 정보 값이 많아지면 시간표 삭제 (예정) -> 학생 클릭하면 나오게? -->
            <div class="student-clock-area">
                <div class="student-clock-info">
                    <div class="student-clock-info-value">
                        <div>시간</div>
                        <div>교과목</div>
                    </div>

                    <%-- (영역)테스트용 값 --%>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                    <div class="student-object-info-value">
                        <div>09:00 ~ 10:00</div>
                        <div>통계학계론</div>
                    </div>
                </div>
            </div>


        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    
</body>
</html>