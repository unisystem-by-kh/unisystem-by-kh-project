<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<jsp:include page="/WEB-INF/views/common/chatting.jsp" />   

<footer>
    <p>Best english sayings</P>
    <p>"The future belongs to those who believe in the beauty of their dreams." - Eleanor Roosevelt</P>
    <p>"In the midst of winter, I found there was, within me, an invincible summer." - Albert Camus</P>
    <p>"Life is not measured by the number of breaths we take, but by the moments that take our breath away." - Maya Angelou</P>
    <p>UNI-SYSTEM KH  INFORMATION EDUCATION CENTER UNIVERSITY.</P>

    <article>
        <a href="#">Project Introduction</a>    
        <span>|</span>
        <a href="#">Terms of Service</a>    
        <span>|</span>
        <a href="#">Privacy Policy</a>    
        <span>|</span>
        <a href="#">Customer Service</a>
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