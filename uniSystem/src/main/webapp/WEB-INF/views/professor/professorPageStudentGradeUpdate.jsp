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
    <link rel="stylesheet" href="/resources/css/professor/style-professorPage-StudentGradeUpdate.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">
            
            <!-- 학생 정보 노출 및 수정 영역 -->
            
            <!-- 학기 버튼 및 제목 -->
            <div class="title-area">
                <div><button>1학기</button></div>
                <div><button>2학기</button></div>
                <div>성적 등록 <span>(1학기)</span></div>
            </div>

            <!-- 학생 정보 영역 -->
            <form action="#" class="student-area">
                <div class="student-info-area">
                    <!-- 학과 학번 이름 성적 수정 영역 -->
                    <div class="student-title">
                        <div>학과</div>
                        <div>학번</div>
                        <div>이름</div>
                        <div>성적</div>
                    </div>
    
                    <!-- 정보 영역 한페이지에 최대 13개까지 노출 for문 사용 -->
                    <div class="student-info">
                        <div>123456</div>
                        <div>홍길동</div>
                        <div>경영학과</div>
                        <div><input type="text" placeholder="수정할 성적을 입력해주세요." value="1" id="studentGrade"></div>
                    </div>
                </div>
                
                
                
                <!-- 버튼 및 페이지네이션 영역 -->
                <div class="button-pagination-area">

                    <div class="objectClass-area">
                        <select name="objectClass" id="objectClass">
                            <option value="">과목선택</option>
                            <option value="경영학개론">경영학개론</option>
                            <option value="심리학개론">심리학개론</option>
                            <option value="통계학개론">통계학개론</option>
                        </select>
                    </div>

                    <div class="objectClass-name">
                        <div>선택된 교과목 노출</div>
                    </div>
                    
                    <div class="buttons-area">
                        <div>
                            <button id="update-ok">수정완료</button>
                        </div>
                        
                        <div>
                            <button id="update-no">수정취소</button>
                        </div>

                        <div>
                            <button id="student-select">학생조회</button>
                        </div>

                        <!--  -->
                        <div>
                            <button id="back-btn">이전페이지</button>
                        </div>
                    </div>

                    <div class="paginations-area">
                        <div>&lt;</div>
                        <div id="paginations">
                            <div class="active">1</div>
                            <div>2</div>
                            <div>3</div>
                            <div>4</div>
                        </div>
                        <div>&gt;</div>
                    </div>
                </div>

            </form>
            
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

    <script src="/resources/js/professor/professorPage-StudentGradeUpdate.js"></script>

</body>
</html>