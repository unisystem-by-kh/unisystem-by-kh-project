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

            console.log(replyList);

            rowArea.append(replyList);

        }
        

    })
    .catch(err => console.log(err));

}

// 댓글 등록
const replyAdd = document.getElementById("replyAdd");
const replyContentInsert = document.getElementById("replyContentInsert");

replyAdd.addEventListener("click", (e) => { // 댓글 등록 버튼이 클릭이 되었을 때

    console.log(loginMemberNo);

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
            // -> 새로운 댓글이 추가되어짐

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
            }else{
                alert("삭제 실패");
            }
        })
        .catch(err => console.log(err));

    }
}

// 댓글 수정
document.addEventListener("DOMContentLoaded", function() {
    const updateButtons = document.querySelectorAll('.row8 #updateBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', function() {
            const replyContent = this.closest('.row8').querySelector('.replyContnet').textContent.trim();
            const replyNo = this.closest('.row8').querySelector('.replyNo').textContent.trim();

            // 댓글 내용을 수정할 입력 창 생성
            const editInput = document.createElement('textarea');
            editInput.classList.add('editReplyContent');
            editInput.setAttribute('rows', '3');
            editInput.setAttribute('cols', '50');
            editInput.value = replyContent;

            // 수정한 내용을 서버로 보내는 버튼 생성
            const saveButton = document.createElement('button');
            saveButton.textContent = '저장';
            saveButton.addEventListener('click', function() {
                const editedContent = editInput.value;
                // 여기서 서버로 수정된 내용 전송
                console.log('수정된 내용:', editedContent);
                console.log('댓글 번호:', replyNo);
                // 수정된 내용을 서버로 전송하는 Ajax 요청 등의 코드 작성
            });

            // 기존 내용과 수정 버튼을 숨김
            this.parentElement.style.display = 'none';

            // 수정한 내용과 저장 버튼을 추가
            const parentDiv = this.closest('.row8');
            parentDiv.appendChild(editInput);
            parentDiv.appendChild(saveButton);
        });
    });
});

