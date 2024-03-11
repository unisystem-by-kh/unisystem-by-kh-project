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
    

    <script src="/resources/js/admin/subjectList.js"></script>
    <script src="/resources/js/header.js"></script>
    
</body>
</html>