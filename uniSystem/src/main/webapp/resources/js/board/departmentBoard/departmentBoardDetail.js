
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

    if(params.get("query") != null){
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
    
            
            const replyContainer = document.getElementById("reply-area")
            replyContainer.innerHTML = "";
            
            
            for(let reply of rList){
                
                const replyContent = document.createElement("div");
                replyContent.classList.add("dat-con")
    
                const replyInfo = document.createElement("div");
                replyInfo.classList.add("dat-info")
                
                const div1 = document.createElement("div");
                div1.innerHTML = "🙍‍♂️" + reply.memberName;
                
                const div2 = document.createElement("div");
                const formattedDate = reply.replyDate.substring(0, 15);
                div2.innerHTML = "🕕 " + formattedDate;
                
                replyInfo.append(div1,div2);
                
                
                const div4 = document.createElement("div")
                div4.innerHTML = reply.replyContent;
                
                replyContent.append(div4);

                const btn = document.createElement("div")
                btn.classList.add(".button-container")
                btn.innerHTML="";

                replyContainer.append(replyContent, replyInfo)

                if(loginMemberNo == reply.memberNo){

                    const btnArea = document.createElement("div");
                    btnArea.classList.add("button-container");
                    
                    
                    
                    const upBtn = document.createElement("button");
                    upBtn.setAttribute('id','replyUpBtn')
                    upBtn.innerText = '수정';
                    upBtn.setAttribute('onclick', "updateReply(" + reply.replyNo + ",this)")
                    
                    const deBtn = document.createElement("button");
                    deBtn.setAttribute('id','replyDeBtn')
                    deBtn.innerText = '삭제';
                    deBtn.setAttribute('onclick', "deleteReply("+reply.replyNo+")")
                    
                    btnArea.append(upBtn,deBtn);
                    replyContainer.append(btnArea)
                }
            }
            
        })
    }

)();


// 댓글 등록
const addReply = document.getElementById("addReply");
const replyWriteCon = document.getElementById("replyWriteCon");
if(addReply != null){
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
                location.reload();
                replyList(); // 비동기 댓글 목록 조회 함수 호출
                // -> 새로운 댓글이 추가되어짐
                
            } else { // 실패
                alert("댓글 등록에 실패했습니다...");
            }
        })
        .catch(err => console.log(err));
    });

    

}

// 댓글 삭제
function deleteReply(replyNo){

    if( confirm("정말로 삭제 하시겠습니까?") ){

        fetch("/reply",{
            method : "DELETE",
            headers : {"Content-Type" : "application/json"},
            body : replyNo // 값 하나만 전달 시에는 JSON 필요 없음
        })
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                alert("삭제되었습니다");
                location.reload();
            }else{
                alert("삭제 실패");
            }
        })
        .catch(err => console.log(err));

    }
}

// 댓글 수정
let beforeReplyRow; // 수정 전 댓글 상태를 저장하기 위한 변수

function updateReply(replyNo, btn) {


    const temp = document.getElementsByClassName("replyUpdateCon");  

    if(temp.length > 0){ // 수정이 한 개 이상 열려 있는 경우

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정 하시겠습니까?")){ // 확인

            temp[0].parentElement.innerHTML = beforeReplyRow;
            // comment-row                       // 백업한 댓글
            // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
       
        }else{ // 취소
            return;
        }
    }
  
    const replyRow = btn.parentElement.previousSibling.previousSibling.firstChild;
    console.log(replyRow)
    beforeReplyRow = replyRow.innerHTML;

    const textarea = document.createElement("textarea");
    textarea.classList.add("replyUpdateCon"); // 클래스 추가
    textarea.value = beforeReplyRow;

    const replyBtnArea = document.createElement("div");
    replyBtnArea.classList.add("btnArea");

    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정";
    updateBtn.setAttribute("onclick", `updateReply1(${replyNo}, this)`);
    updateBtn.classList.add("replyUp")
    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", `updateCancel(this)`);
    cancelBtn.classList.add("replyDe")
    replyRow.innerHTML = '';
    replyRow.append(textarea, replyBtnArea);
    replyBtnArea.append(updateBtn, cancelBtn);
}


function updateCancel(){
    if(confirm("댓글 수정을 취소하시겠습니까?")){
        beforeReplyRow = null;
        location.reload();
        replyList();


    }
}


function updateReply1(replyNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const replyContent = btn.parentElement.previousElementSibling.value;
    console.log(replyContent);

    const data = {
        "replyNo" : replyNo,
        "replyContent" : replyContent
    };

    fetch("/reply",{
        method : "PUT",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.json())
    .then(result => {
        if(result > 0){
            alert("댓글이 수정되었습니다.");
            location.reload();
            replyList();

        }else{
            alert("댓글 수정 실패");
        }
    })
    .catch(err => console.log(err));

}




