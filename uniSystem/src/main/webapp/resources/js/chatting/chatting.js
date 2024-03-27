function toggleModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = modal.style.display === "block" ? "none" : "block";
}

const chatBtn = document.querySelector(".chatBtn"); // 채팅방 버튼
let chattingNo; // 채팅방 번호
let targetName; // 상대 이름

// 채팅방 입장
if(chatBtn != null){
    chatBtn.addEventListener("click", ()=>{
        
        fetch("/chatting/enter")
        .then(resp=>resp.text())
        .then(result => {
            if(result > 0){
                chattingNo = result;
                selectChattingFn(); // 채팅방 입장 시 비동기로 메세지 목록 조회하는 함수 호출
            }
        })
        .catch(e=>console.log(e))
    })
}


// 채팅 메세지 영역
const display = document.getElementsByClassName("display-chatting")[0];

// 비동기로 메세지 목록 조회하는 함수
function selectChattingFn() {

    fetch("/chatting/selectMessage?"+`chattingNo=${chattingNo}&memberNo=${loginMemberNo}`)
    .then(resp=>resp.json())
    .then(messageList => {
        console.log(messageList);

        const ul = document.querySelector(".display-chatting");

        ul.innerHTML = ""; // 이전 내용 지우기

        const li = document.createElement("li");
        const h31 = document.createElement("h3");
        const h32 = document.createElement("h3");

        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        
        li.classList.add("chat-header");
        h31.innerText = "채팅방에 입장하였습니다.";
        h32.innerText = `${year}년 ${month}월 ${day}일`

        li.append(h31, h32);
        ul.append(li);

        
        // 메세지 만들어서 출력하기
        for(let msg of messageList){
            const li = document.createElement("li");
            
            // 보낸 시간
            const span = document.createElement("span");
            span.classList.add("chatDate");
            span.innerText = msg.sendTime;

            // 메세지 내용
            const p = document.createElement("p");
            p.classList.add("chat");
            p.innerHTML = msg.messageContent; 

            // 내가 작성한 메세지인 경우
            if(loginMemberNo == msg.senderNo){ 
                li.classList.add("my-chat");
                
                li.append(span, p);

            }else{ // 상대가 작성한 메세지인 경우

                li.classList.add("target-chat");

                const div = document.createElement("div");

                // 상대 이름
                const b = document.createElement("b");
                b.innerText = msg.memberName; 
                targetName = msg.memberName;

                const br = document.createElement("br");

                div.append(b, br, p, span);
                li.append(div);
            }

            ul.append(li);
            display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
        }

    })
    .catch(e=>console.log(e))
}

// ----------------------------------------------------------------------------------------------------------------

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let chattingSock;

if(loginMemberNo != "" ){
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
            "chattingNo" : chattingNo,
            "messageContent": inputChatting.value,
            "memberName" : targetName
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

// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
chattingSock.onmessage = function(e) {
    // 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
    const msg = JSON.parse(e.data);
    console.log(msg);
 
    // 현재 채팅방을 보고있는 경우
    if(chattingNo == msg.chattingNo){
 
       const ul = document.querySelector(".display-chatting");
    
       // 메세지 만들어서 출력하기
       //<li>,  <li class="my-chat">
       const li = document.createElement("li");
    
       // 보낸 시간
       const span = document.createElement("span");
       span.classList.add("chatDate");
       span.innerText = msg.sendTime;
    
       // 메세지 내용
       const p = document.createElement("p");
       p.classList.add("chat");
       p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML
    
       // 내가 작성한 메세지인 경우
       if(loginMemberNo == msg.senderNo) { 
            li.classList.add("my-chat");
            li.append(span, p);
            
        } else { // 상대가 작성한 메세지인 경우
            li.classList.add("target-chat");
            
            const div = document.createElement("div");
        
            // 상대 이름
            const b = document.createElement("b");
            b.innerText = msg.memberName; // 전역변수
            console.log("입력했을떄:"+b.innerText);
            const br = document.createElement("br");
        
            div.append(b, br, p, span);
            li.append(div);
    
        }
    
       ul.append(li)
       display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
    }

    //selectChattingFn();

}

 // 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", ()=>{
 
    // 보내기 버튼에 이벤트 추가
    send.addEventListener("click", sendMessage);

    //setInterval(selectChattingFn,200);
});
