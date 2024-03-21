
// 게시글 삭제
if(document.getElementById("deleteBtn") != null){
    
    document.getElementById("deleteBtn").addEventListener("click",() => {
        if(confirm("정말 삭제하시겠습니까?")){
            
            
            location.href = "/board/" + categoryNo +"/" + boardNo +  "/delete";
    
            
            alert("삭제 되었습니다.")
            
        }
    })

}
// 목록으로
const goToListBtn = document.getElementById("goToListBtn")


goToListBtn.addEventListener("click",()=>{

    // location.href = "/board/" + boardCode + location.search;
    
    
    const pathname = location.pathname;
    const params = new URL(location.href).searchParams;

    let url = pathname.substring(0, pathname.indexOf("/",7));
    
    let cp;

    if(params.get("cp") != null){ 
        cp = "cp=" + params.get("cp"); 
    }else{
        cp = "cp=1" 
    }

    url += "?" + cp;


    let key;
    let query;

    if(params.get("key") != null){
        key = "&key=" + params.get("key");
        query = "&query=" + params.get("query");

        url += key + query;
    }
    
    location.href = url;


})


// 게시글 수정 
const updateBtn = document.getElementById("updateBtn");
if(updateBtn != null){


    updateBtn.addEventListener("click", () => {
        location.href = "/board/" + categoryNo +"/" + boardNo +  "/update" + location.search;
        
    })
}


// 댓글 목록
(

    function replyList(){

        fetch("/reply?boardNo=" + boardNo)
        .then(resp => resp.json())
        .then(rList => {
    
            const replyNick = document.querySelector(".reply-nick");
            replyNick.innerHTML = "";

            const replyTitle = document.querySelector(".reply-title");
            replyTitle.innerHTML = "";

            const replyContent = document.querySelector(".reply-content");
            replyContent.innerHTML = ""; 
    
            const replyArea = document.querySelector(".reply-area")
    
            for(let reply of rList){
    
                const nickCon = document.createElement("div");
                nickCon.classList.add("reply-nick")
    
                const titleCon = document.createElement("div");
                titleCon.classList.add("reply-title")
    
                const contentCon = document.createElement("div");
                contentCon.classList.add("reply-content")
    
                if(loginMemberNo == reply.memberNo){
                    const btnArea = document.createElement("div");
                    btnArea.innerHTML = '';
                    btnArea.classList.add("button-container");
                    
    
                    const upBtn = document.createElement("button");
                    upBtn.setAttribute('id','replyUpBtn')
                    upBtn.innerText = '수정';
    
                    const deBtn = document.createElement("button");
                    deBtn.setAttribute('id','replyDeBtn')
                    deBtn.innerText = '삭제';
    
                    btnArea.append(upBtn,deBtn);
                }
    
    
                const div1 = document.createElement("div");
                div1.innerHTML = "답변자 : " + reply.memberName;
    
                const div2 = document.createElement("div");
                const formattedDate = reply.replyDate.substring(0, 15);
                div2.innerHTML = "답변일 : " + formattedDate;
    
                replyNick.append(div1,div2);
    
                const div3 = document.createElement("div");
                div3.innerHTML = "제목 : [RE]" + boardTitle;
    
                replyTitle.append(div3);
    
                const div4 = document.createElement("div")
                div4.innerHTML = reply.replyContent;
    
                replyContent.append(div4);
    
                replyArea.after(replyNick,replyTitle,replyContent)
            }
            
        })
    }

)();


// 댓글 등록
const addReply = document.getElementById("addReply");
const replyWriteCon = document.getElementById("replyWriteCon");

addReply.addEventListener("click", e => { // 댓글 등록 버튼이 클릭이 되었을 때

    console.log(loginMemberNo);

    if(loginMemberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    if(replyWriteCon.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        replyWriteCon.value = "";
        replyWriteCon.focus();
        return;
    }
    
    const data = {
        "boardNo" : boardNo,
        "memberNo" : loginMemberNo,
        "replyContent" : replyWriteCon.value
    };

    fetch("/reply" , {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data) // JS 객체 -> JSON 파싱
    }) // 보낼때
    .then(resp => resp.text()) // 받을때
    .then(result => {
        if(result > 0){ // 등록 성공
            alert("댓글이 등록되었습니다.");

            replyWriteCon.value = ""; // 작성했던 댓글 삭제

            replyList(); // 비동기 댓글 목록 조회 함수 호출
            // -> 새로운 댓글이 추가되어짐

        } else { // 실패
            alert("댓글 등록에 실패했습니다...");
        }
    })
    .catch(err => console.log(err));
});