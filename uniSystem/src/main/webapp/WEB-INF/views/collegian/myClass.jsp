<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/collegian/collegian-style.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
    
</head>
<body>
	

	 <main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	 
	 	<div class="main">
	 		<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />
	        
	        <div class="stu-container">
            <div class="stu-header">
                <h2>수강 신청/변경</h2>
            </div>

            <div class="search-area">
                <form action="">
                    <div class="select">
                        <select name="major" id="">
                            <option value="">컴퓨터과학과</option>
                            <option value="">전체</option>
                        </select>
                    </div>
                     <div class="select">
                    <select name="grade" id="">
                        <option value="">1학년</option>
                        <option value="">2학년</option>
                        <option value="">전체</option>
                    </select>
                    </div>
                    <div class="select">
                    <select name="step" id="">
                        <option value="">1학기</option>
                        <option value="">2학기</option>
                        <option value="">전체</option>
                    </select>
                    </div>
                     <div class="select">
                    <select name="type" id="">
                        <option value="">전체</option>
                        <option value="">전공</option>
                        <option value="">교양</option>
                    </select>
                    </div>
                    <label for="" class="query-label">
                        <input type="text" name="query" placeholder="검색할 과목명을 입력해주세요.">
                        <button type="submit"><img src="/resources/images/collegian/search.png" alt=""></button>
                    </label>
                </form>
            </div>

            <div class="stu-board">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>학과명</th>
                        <th>학년</th>
                        <th>학기</th>
                        <th>과목명</th>
                        <th>분류</th>
                        <th>학점</th>
                        <th>신청 여부</th>
                        <th>강의 시간</th>
                        <th>신청인원</th>
                        <th>수강정원</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>컴퓨터과학과</td>
                        <td>1학년</td>
                        <td>1학기</td>
                        <td>JAVA</td>
                        <td>전공</td>
                        <td>3</td>
                        <td><button>신청하기</button></td>
                        <td>남궁성</td>
                        <td>남궁성</td>
                        <td>남궁성</td>
                    </tr> <tr>
                        <td>1</td>
                        <td>컴퓨터과학과</td>
                        <td>1학년</td>
                        <td>1학기</td>
                        <td>JAVA</td>
                        <td>전공</td>
                        <td>3</td>
                        <td><button>신청하기</button></td>
                        <td>남궁성</td>
                        <td>남궁성</td>
                        <td>남궁성</td>
                    </tr>
                    
                </table>

                <div class="pagination-area">
                    <div class="pagination">
                        <a href="#">&laquo;</a>
                        <a href="#">1</a>
                        <a href="#" class="active">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">&raquo;</a>
                    </div>
                </div>

            </div>

            <h2>수강 신청 내역</h2>
            <div class="stu-board select-class">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>학과명</th>
                        <th>학년</th>
                        <th>학기</th>
                        <th>과목명</th>
                        <th>분류</th>
                        <th>학점</th>
                        <th>취소</th>
                        <th>강의 시간</th>
                        <th>신청인원</th>
                        <th>수강정원</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>컴퓨터과학과</td>
                        <td>1학년</td>
                        <td>1학기</td>
                        <td>JAVA</td>
                        <td>전공</td>
                        <td>3</td>
                        <td><button>취소</button></td>
                        <td>월(1~3교시)</td>
                        <td>3</td>
                        <td>50</td>
                    </tr>
                    
                </table>

                <form action="" style="display: hiiden;">
                    <input type="hidden">
                    <button id="class-btn" type="submit">신청하기</button>
                </form>

            </div>
        </div>
	 	
	 	</div>
	 	
	 	

        
    </main>



</body>


</html>