function selectReplyList(){

    // 기본적으로 form태그는 GET/POST만 지원
    fetch("/reply?boardNo=" + boardNo)
    .then(response => response.json())
    .then(rList => {

        const rowArea = document.getElementsByClassName('row8-area')[0];
        rowArea.innerHTML = '';
        
        for(let reply of rList){

            const replyList = document.createElement('div');
            replyList.classList.add('row8');

            const btnProfileArea = document.createElement('div');
            btnProfileArea.classList.add('btn-profile-area');

            const btnArea = document.createElement('div');
            btnArea.classList.add('btnArea');

            if(loginMemberNo == reply.memberNo){
                const updateBtn = document.createElement('button');
                updateBtn.setAttribute('id' , 'updateBtn');
                updateBtn.innerText = '수정';
                updateBtn.setAttribute('onclick', "showUpdateReply("+reply.replyNo+")")
                const deleteBtn = document.createElement('button');
                deleteBtn.setAttribute('id' , 'deleteBtn');
                deleteBtn.innerText = '삭제';
                deleteBtn.setAttribute('onclick', "deleteReply("+reply.replyNo+")")

                btnArea.append(updateBtn, deleteBtn);
            }

            const profileImgReply = document.createElement('profileImg-reply');
            profileImgReply.classList.add('profileImg-reply');

            const imgProfile = document.createElement('img');
            imgProfile.classList.add('imgProfile');
            // imgProfile.setAttribute('src', reply.memberProfile); // 이미지 값으로 변경 예정
            imgProfile.setAttribute('src', '/resources/images/memberImage.jpg'); // 이미지 기본값 넣어두기

            const replyMemberName = document.createElement('replyMemberName');
            replyMemberName.classList.add('replyMemberName');
            replyMemberName.innerHTML = reply.memberName;

            const replyDate = document.createElement('replyDate');
            replyDate.classList.add('replyDate');
            const formattedDate = reply.replyDate.substring(0, 15);
            replyDate.innerHTML = formattedDate;

            const replyContnet = document.createElement('replyContnet');
            replyContnet.classList.add('replyContnet');
            replyContnet.innerHTML = reply.replyContent;

            const replyNo = document.createElement('replyNo');
            replyNo.classList.add('replyNo');
            replyNo.innerHTML = reply.replyNo;

            btnProfileArea.append(btnArea, profileImgReply);
            
            profileImgReply.append(imgProfile);
            
            replyList.append(btnProfileArea, replyMemberName, replyDate, replyContnet, replyNo); // 최종추가

            rowArea.append(replyList);

        }
        

    })
    .catch(err => console.log(err));

}

// 댓글 등록
const replyAdd = document.getElementById("replyAdd");
const replyContentInsert = document.getElementById("replyContentInsert");

replyAdd.addEventListener("click", (e) => { // 댓글 등록 버튼이 클릭이 되었을 때

    

    if(loginMemberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    if(replyContentInsert.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");
        
        replyContentInsert.value = "";
        replyContentInsert.focus();
        return;
    }
    
    const data = {
        "boardNo" : boardNo,
        "memberNo" : loginMemberNo,
        "replyContent" : replyContentInsert.value
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

            replyContentInsert.value = ""; // 작성했던 댓글 삭제

            selectReplyList(); // 비동기 댓글 목록 조회 함수 호출

            location.reload();

        } else { // 실패
            alert("댓글 등록에 실패했습니다...");
        }
    })
    .catch(err => console.log(err));
});

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
                selectReplyList(); // 목록을 다시 조회해서 삭제된 글을 제거

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

function showUpdateReply(replyNo, btn) {
    const temp = document.getElementsByClassName('updateBtn');

    if (temp.length > 0 && temp[0].parentElement) { // 수정 버튼이 이미 화면에 있을 때
        if (confirm('댓글 수정 중입니다.\n현재 댓글을 수정하시겠습니까?')) {
            temp[0].parentElement.innerHTML = beforeReplyRow;
        } else {
            return;
        }
    }

    const replyRow = btn.parentElement.parentElement.parentElement;
    beforeReplyRow = replyRow.innerHTML;

    const beforeContent = replyRow.querySelector('.replyContnet').innerText;

    const textarea = document.createElement("textarea");
    textarea.classList.add("updateBtn"); // 클래스 추가
    textarea.value = beforeContent;

    const repltBtnArea = document.createElement("div");
    repltBtnArea.classList.add("btnArea");

    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정";
    updateBtn.setAttribute("onclick", `updateReply(${replyNo}, this)`);

    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", `updateCancel(this)`);

    replyRow.innerHTML = '';
    replyRow.append(textarea, repltBtnArea);
    repltBtnArea.append(updateBtn, cancelBtn);
}


function updateCancel(){
    if(confirm("댓글 수정을 취소하시겠습니까?")){
        beforeReplyRow = null;
        selectReplyList();

        location.reload();
    }
}


function updateReply(replyNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const replyContent = btn.parentElement.previousElementSibling.value;

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
            selectReplyList();

            location.reload();
        }else{
            alert("댓글 수정 실패");
        }
    })
    .catch(err => console.log(err));

}




// 게시글 수정 관련 --------------------------------------------------------
// 게시글 수정 버튼 클릭 시
const updateBtn = document.getElementById('updateBtn');
if(updateBtn != null){
    
    updateBtn.addEventListener('click' , ()=>{
        location.href = location.pathname
                        + '/update' + location.search;
    })

}

if(document.getElementById("deleteBtn") != null){
    document.getElementById("deleteBtn").addEventListener("click",() => {
        if(confirm("정말 삭제하시겠습니까?")){
            location.href = "/board/" + categoryNo +"/" + boardNo +  "/delete";
            alert("삭제 되었습니다.")
            console.log(loginMemberNo.substring(1, 2))
        }
    })
}

// 게시글 목록으로 가기
const goToListBtn = document.getElementById('goToListBtn');
if(goToListBtn != null){
    goToListBtn.addEventListener('click' , ()=>{
        location.href = "/board/" + categoryNo + location.search;
    })
}