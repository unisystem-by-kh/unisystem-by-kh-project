<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>시간표 조회</title>

	<link rel="stylesheet" href="/resources/css/style-main.css">
	<link rel="stylesheet"
		href="/resources/css/collegian/collegian-style.css">

	<script src="https://kit.fontawesome.com/9cd918496e.js"
		crossorigin="anonymous"></script>

</head>

<c:set var="myClassList" value="${map.myClassList}"/>

<body>

	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="main">
			<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />

			<div class="stu-container">
            <div class="stu-header">
                <h2>학적 변동 신청</h2>
            </div>

            <div class="change-area">
                <form action="insertState" method="post" onsubmit="return stateValidate()">
                    <div class="first-line">
                        <span>신청자</span>

                        <span>학과</span>
                        <input type="text" value="${loginMember.departmentName}" readonly>
                        
                        <span>학번</span>
                        <input type="text" value="${loginMember.memberNo}" readonly>
                        
                        <span>성명</span>
                        <input type="text" value="${loginMember.memberName}" readonly>
                    </div>

                    <div class="second-line">
                        <span>학적 신청 선택</span>
                            <label>
                                <span>휴학</span>
                                <input type="radio" value="Y" name="st" >
                            </label>    

                            <label>
                                <span>복학</span>
                                <input type="radio"  value="N" name="st">
                            </label>  

                            <label>
                                <span>자퇴</span>
                                <input type="radio"  value="D" name="st">
                            </label>  
                    </div>

                    <div class="third-line">
                        <span>요청 사유</span>
                        <textarea name="content" id="" cols="95" rows="8" placeholder="내용을 입력해주세요."></textarea>
                        <button id="state-btn">신청하기</button>
                    </div>

                </form>
            </div>
            <div class="state-list-area">
                <div class="list-header">
                    <h2>학적 변동 신청 내역</h2>
                </div>
                <div class="state-table">
                    <table>
                        <tr>
                            <th>NO.</th>
                            <th>신청 항목</th>
                            <th>신청 사유</th>
                            <th>신청 상태</th>
                            <th>결재권자</th>
                        </tr>

                        <c:choose>
                           <c:when test="${empty reqList}">
                                <tr>
                                    <td colspan="5">
                                        요청내역이 존재하지 않습니다.
                                    </td>
                                </tr>
                           </c:when>
                           <c:otherwise>
                                <c:forEach items="${reqList}" var="req">
                                    <tr>
                                        <td>${req.reqNo}</td>
                                        <td>${req.reqType}</td>
                                        <td>${req.reqReason}</td>
                                        <td>${req.reqState}</td>
                                        <td>${req.confirmNo}</td>
                                    </tr>
                                </c:forEach>
                           </c:otherwise>
                        </c:choose>
                    </table>
                </div>
            </div>
        </div>
	</main>
    <script src="/resources/js/collegian/nav.js"></script>
    <script src="/resources/js/collegian/change.js"></script>




</body>


</html>