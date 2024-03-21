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

    <c:set var="lecture" value="${map.lecture}"/>
	<c:set var="pagination" value="${map.pagination}"/>
	<c:set var="department" value="${map.departmentList}"/>
	<c:set var="myClassList" value="${map.myClassList}"/>
	

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

                    <c:choose>
                        <c:when test="${empty lecture}">
                            <tr>
                                <td id="noneLecture" colspan ="8" style="text-align: center;">과목이 존재하지 않습니다.</td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                                <c:forEach items="${lecture}" var="lec">
                                    <tr>
                                        <td>${lec.classNo}</td>
                                        <td>${lec.departmentName}</td>
                                        <td>${lec.classGrade}학년</td>
                                        <td>${lec.classTrem}학기</td>
                                        <td>${lec.className}</td>
                                        <c:if test="${lec.classPoint == 2}" >
                                            <td>교양</td>
                                        </c:if>
                                        <c:if test="${lec.classPoint == 3}" >
                                            <td>전공</td>
                                        </c:if>
                                        <td>${lec.classPoint}</td>
                                        <c:if test="${lec.lectureFL > 0}" >
                                            <td>신청 완료</td>
                                        </c:if>

                                        <c:if test="${lec.lectureFL == 0}" >
                                            <td><button id="create-lecture" onclick=addToCart(this)>강의담기<button></td>
                                        </c:if>
                                        <td>${lec.classDay} (${lec.classStart}교시 ~ ${lec.classEnd}교시)</td>
                                        <td>${lec.lectureCount}</td>
                                        <td>${lec.classMax}
                                    </tr>
                                </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    
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
                     <c:choose>
                        <c:when test="${empty myClassList}">
                            <tr>
                                <td id="noneLecture" colspan ="8" style="text-align: center;">수강 신청 과목이 존재하지 않습니다.</td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                                <c:forEach items="${myClassList}" var="cl">
                                    <tr>
                                        <td>${cl.classNo}</td>
                                        <td>${cl.departmentName}</td>
                                        <td>${cl.classGrade}학년</td>
                                        <td>${cl.classTrem}학기</td>
                                        <td>${cl.className}</td>
                                        <c:if test="${cl.classPoint == 2}" >
                                            <td>교양</td>
                                        </c:if>
                                        <c:if test="${cl.classPoint == 3}" >
                                            <td>전공</td>
                                        </c:if>
                                        <td>${cl.classPoint}</td>
                                        <td><button id="delete-class" onclick=deleteMyClass(this)>신청 취소<button></td>
                                        <td>${cl.classDay} (${cl.classStart}교시 ~ ${cl.classEnd}교시)</td>
                                        <td>${cl.lectureCount}</td>
                                        <td>${cl.classMax}
                                    </tr>
                                </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    
                </table>
             
                <button id="class-btn" type="button">전체 신청 하기</button>

            </div>
        </div>
	 	
	 	</div>
	 	
	 	

        
    </main>

    <script>
        const loginMember = '${loginMember}';
    </script>


    <script src="/resources/js/collegian/myClass.js"></script>

</body>


</html>