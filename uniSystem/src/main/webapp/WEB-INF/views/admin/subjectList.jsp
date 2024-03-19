<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교과목 조회</title>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/admin/subjectList.css">

</head>
<body>
    
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <form action="search" id="searchFrm">
            <select name="key" id="subjectKey">
                <option value="a">과목번호</option>
                <option value="b">학과명</option>
                <option value="c">과목명</option>
                <option value="d">전담 교수</option>
            </select>
            <input type="search" name="query" id="subjectQuery" placeholder="검색어를 입력해주세요.">
            <button id="searchBtn">검색</button>
        </form>

        <table class="list-table">
            <thead>
                <tr>
                    <th>과목 번호</th>
                    <th>학과명</th>
                    <th>과목명</th>
                    <th>전담 교수</th>
                    <th>강의 시간</th>
                    <th>과목 수정</th>
                    <th>삭제</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월(1교시~4교시)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>바로이맛아닙니과</td>
                    <td>java</td>
                    <td>전혜선</td>
                    <td>금(5교시~6교시)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>국어국문학과</td>
                    <td>고전시가론특강</td>
                    <td>홍길동</td>
                    <td>월,화(11:00~12:00)</td>
                    <td><button>과목수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
            </tbody>

        </table>

        <!-- 페이지네이션 영역 -->
        <div class="paginations-area">
            <div>&lt;</div>
            <div id="paginations">
                <div class="active">1</div>
                <div>2</div>
                <div>3</div>
                <div>4</div>
                <div>5</div>
            </div>
            <div>&gt;</div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>

    <div class="modal">
        <div class="modal_body">
            <div class="close-area">&times;</div>
            <h2>과목 수정</h2><hr>
            <form>
                <div class="form-group">
                    <label for="className">과목명</label>
                    <input type="text" id="className" name="className" placeholder="과목명을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="classPoint">강의 학점</label>
                    <input type="text" id="classPoint" name="classPoint" placeholder="전공:3 교양:2">
                </div>
        
                <div class="form-group">
                    <label for="classMax">수강 정원</label>
                    <input type="text" id="classMax" name="classMax" placeholder="최대 수강 인원을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="departmentName">학과</label>
                    <input type="text" id="departmentName" name="departmentName" placeholder="학과를 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label for="professor">담당 교수</label>
                    <input type="text" id="professor" name="professor" placeholder="담당 교수님을 입력해주세요.">
                </div>
        
                <div class="form-group">
                    <label>강의 학기</label>
                    <select name="grade" id="grade">
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                    </select>
                    <select name="semester" id="semester">
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                    </select>
                    <!-- <input type="text" id="semester" name="semester" > -->
                </div>
        
                <div class="form-group">
                    <label for="calssDay">강의 요일</label>
                    <select name="calssDay" id="calssDay">
                        <option value="월">월</option>
                        <option value="화">화</option>
                        <option value="수">수</option>
                        <option value="목">목</option>
                        <option value="금">금</option>
                    </select>
                    <!-- <input type="text" id="lectureDay" name="lectureDay" > -->
                </div>
        
                <div class="form-group" id="classTime-area">
                    <label for="classTime">강의 시간</label>
                    <input type="text" id="classStart" name="classTime" placeholder="시작">교시
                    <input type="text" id="classEnd" name="classTime" placeholder="마치는">교시
                    <button id="checkTime">시간 체크</button>
                </div>

                <button class="btn">수정하기</button>
            </form>
        </div>
    </div>
    
    

    <script src="/resources/js/admin/subjectList.js"></script>
    <script src="/resources/js/header.js"></script>
    
</body>
</html>