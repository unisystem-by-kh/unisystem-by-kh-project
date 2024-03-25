<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<jsp:include page="/WEB-INF/views/common/chatting.jsp" />   

<footer>
    <p>제1캠퍼스 - [11644] 경기도 의정부시 호암로 95 (호원동) / TEL : 031-1234-1234</P>
    <p>제2캠퍼스 - [11340] 경기도 동두천시 벌마들로 40번길 30 (상패동) / TEL : 031-1234-1234</P>
    <p>UNI-SYSTEM KH  INFORMATION EDUCATION CENTER UNIVERSITY.</P>

    <article>
        <a href="#">프로젝트 소개</a>    
        <span>|</span>
        <a href="#">이용약관</a>    
        <span>|</span>
        <a href="#">개인정보처리방침</a>    
        <span>|</span>
        <a href="#">고객센터</a>    
    </article>
</footer>

<c:if test="${!empty message}">

    <script>
        // EL/JSTL 구문이 먼저 해석되는데
        // 문자열의 경우 따옴표가 없는 상태이니 붙여줘야한다!!!
        swal("${message}", "", "success");
    </script>

    <%-- 
        session에 message를 추가하면
        브라우저 종료 또는 만료 전까지 계속 메시지가 출력된다
        -> 1회 출력 후 session에서 message 삭제
    --%>
    <c:remove var="message" scope="session"/>

</c:if>