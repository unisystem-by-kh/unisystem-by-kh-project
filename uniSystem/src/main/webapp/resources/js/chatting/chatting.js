function toggleModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = modal.style.display === "block" ? "none" : "block";
}

const chatBtn = document.querySelector(".chatBtn"); // 채팅방 버튼

// 채팅방 입장
chatBtn.addEventListener("click", ()=>{

})



// ----------------------------------------------------------------------------------------------------------------

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let chattingSock;

if(loginMemberNo != ""){
    chattingSock = new SockJS("/chattingSock");
}

// 채팅 입력
const send = document.getElementById("send");

const sendMessage = ()=>{
    const inputChatting = document.getElementById("inputChatting");

    if(inputChatting.value.trim().length == 0){
        alert("채팅을 입력해주세요.");
        inputChatting.value = "";

    } else {
        var obj = {
            "senderNo" : loginMemberNo,
            /* "chattingNo" : selectChattingNo, */
            "messageContent": inputChatting.value,
        };

        console.log(obj);

        chattingSock.send(JSON.stringify(obj));

        inputChatting.value = "";

    }
}

// 엔터 == 제출
// 쉬프트 + 엔터 == 줄바꿈
inputChatting.addEventListener("keyup", e => {
    if(e.key == "Enter"){ 
       if (!e.shiftKey) {
          sendMessage();
       }
    }
})

 // 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", ()=>{
   
    // 채팅방 목록에 클릭 이벤트 추가
    //roomListAddEvent(); 
 
    // 보내기 버튼에 이벤트 추가
    send.addEventListener("click", sendMessage);
});