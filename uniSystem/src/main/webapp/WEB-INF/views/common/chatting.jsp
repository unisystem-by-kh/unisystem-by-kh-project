<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${fn:substring(loginMember.memberNo, 0, 2) == '01'}" >
    <button onclick="toggleModal()" class="chatBtn"><img src="/resources/images/etc/window.png" alt="채팅방"></button>
</c:if>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="toggleModal()">&times;</span>
        <h2>UNI-TALK</h2>
        <div class="chatting-content">
            <ul class="display-chatting" onclick="changeBackground()">
               <%--  <li class="chat-header"><h3>채팅방에 입장하였습니다.</h3></li>
                <li class="chat-header"><h3>2024년 03월 25일</h3></li>
                <li class="my-chat">
                <span class="chatDate">14:01</span>
                <p class="chat">가나다라마바사</p>
                </li>

                <li class="target-chat">
                <div>
                    <b>이번유저</b>   <br>
                    <p class="chat">
                        안녕하세요?? 반갑습니다.<br>
                        ㅎㅎ
                    </p>
                    <span class="chatDate">14:05</span>
                </div>
                </li> --%>
                
            </ul>

            <input type="file" accept="image/*" id="bgImageInput" style="display: none;" onchange="handleImageUpload(event)">
            <label for="bgImageInput" class="change-bg-btn"></label>
        
            <div class="input-area">
                <textarea id="inputChatting" rows="3"></textarea>
                <button id="send">보내기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
    // 로그인한 회원 번호
    const loginMemberNo = "${loginMember.memberNo}";
</script>
<script src="/resources/js/chatting/chatting.js"></script>

