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
                <div class="refresh-area"><button onclick="refresh()"><img src="/resources/images/collegian/Animation.gif"></button></div>
            </div>
            <div class="search-area">
                <form action="">
                    <div class="select">
                        <select name="major" id="">
                            <c:forEach items="${department}" var="d">
                                
                                <c:if test="${d.departmentNo == loginMember.departmentNo}" >
                                    <option value="${d.departmentNo}" selected>${d.departmentName}</option>
                                </c:if>

                                <c:if test="${d.departmentNo != loginMember.departmentNo}" >
                                    <option value="${d.departmentNo}">${d.departmentName}</option>
                                </c:if>
                            </c:forEach>
                            <option value=0>전체</option>
                        </select>
                    </div>
                     <div class="select">
                    <select name="grade" id="">
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                        <option value="0">전체</option>
                    </select>
                    </div>
                    <div class="select">
                    <select name="step" id="">
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                        <option value="0">전체</option>
                    </select>
                    </div>
                     <div class="select">
                    <select name="type" id="">
                        <option value="0">전체</option>
                        <option value="3">전공</option>
                        <option value="2">교양</option>
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
                    <thead>
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
                            <th>수강 정원</th>
                            <th>신청 인원</th>
                        </tr>
                    <thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty lecture}">
                            <tr>
                                <td id="noneLecture" colspan ="11" style="text-align: center;">과목이 존재하지 않습니다.</td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                                <c:forEach items="${lecture}" var="lec">
                                    <tr>
                                        <td>${lec.classNo}</td>
                                        <td>${lec.departmentName}</td>
                                        <td>${lec.classGrade}학년</td>
                                        <td>${lec.classTerm}학기</td>
                                        <td>${lec.className}</td>
                                        <c:if test="${lec.classPoint == 2}" >
                                            <td>교양</td>
                                        </c:if>
                                        <c:if test="${lec.classPoint == 3}" >
                                            <td>전공</td>
                                        </c:if>
                                        <td>${lec.classPoint}</td>
                                        <c:if test="${lec.lectureFL > 0}" >
                                            <td><button>신청 완료</button></td>
                                        </c:if>

                                        <c:if test="${lec.lectureFL == 0}" >
                                            <td><button id="create-lecture" onclick=addToCart(this)>강의 담기</button></td>
                                        </c:if>
                                        <td>${lec.classDay} (${lec.classStart}교시 ~ ${lec.classEnd}교시)</td>
                                        <td>${lec.classMax}
                                        <td>${lec.lectureCount}</td>
                                    </tr>
                                </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                    
                </table>


            </div>
            <div class="stu-header ex1">
                <h2>수강 신청 내역</h2>
            </div>
            
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
                        <th>수강 정원</th>
                        <th>신청 인원</th>
                    </tr>
                     <c:choose>
                        <c:when test="${empty myClassList}">
                            <tr>
                                <td id="noneLecture" colspan ="11" style="text-align: center;">수강 신청 과목이 존재하지 않습니다.</td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                                <c:forEach items="${myClassList}" var="cl">
                                    <tr>
                                        <td>${cl.classNo}</td>
                                        <td>${cl.departmentName}</td>
                                        <td>${cl.classGrade}학년</td>
                                        <td>${cl.classTerm}학기</td>
                                        <td>${cl.className}</td>
                                        <c:if test="${cl.classPoint == 2}" >
                                            <td>교양</td>
                                        </c:if>
                                        <c:if test="${cl.classPoint == 3}" >
                                            <td>전공</td>
                                        </c:if>
                                        <td>${cl.classPoint}</td>
                                        <td><button id="delete-class" onclick=deleteMyClass(this)>신청 취소</button></td>
                                        <td>${cl.classDay} (${cl.classStart}교시 ~ ${cl.classEnd}교시)</td>
                                        <td>${cl.classMax}
                                        <td>${cl.lectureCount}</td>
                                    </tr>
                                </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    
                </table>
                <div id="count-area">총 이수학점 : <span><span></div>
             
                <button id="class-btn" type="button">전체 신청 하기</button>

            </div>
        </div>
	 	
	 	</div>
	 	
	 	

        
    </main>

    <script>
        const memberNo = '${loginMember.memberNo}';
    </script>


    <script src="/resources/js/collegian/myClass.js"></script>
    <script src="/resources/js/collegian/nav.js"></script>

</body>


</html>