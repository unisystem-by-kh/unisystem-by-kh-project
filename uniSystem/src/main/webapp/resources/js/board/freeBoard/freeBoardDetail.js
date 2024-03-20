function selectCommentList(){

    // 기본적으로 form태그는 GET/POST만 지원
    fetch("/comment?boardNo=" + boardNo)
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

                btnArea.append(updateBtn, deleteBtn);
            }

            const profileImgReply = document.createElement('profileImg-reply');
            profileImgReply.classList.add('profileImg-reply');

            const imgProfile = document.createElement('img');
            imgProfile.classList.add('imgProfile');
            // imgProfile.setAttribute('src', reply.memberProfile); // 이미지 값으로 변경 예정
            imgProfile.setAttribute('src', 'https://i.pinimg.com/736x/23/f8/99/23f899935c4ae47b8d99afbbf18ff75e.jpg'); // 이미지 기본값 넣어두기

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
const addComment = document.getElementById("addComment");
const commentContent = document.getElementById("commentContent");

addComment.addEventListener("click", e => { // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 memberNo 이용
    if(loginMemberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(commentContent.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        commentContent.value = ""; // 띄어쓰기, 개행문자 제거
        commentContent.focus();
        return;
    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)

    const data = {
        "boardNo" : boardNo,
        "memberNo" : loginMemberNo,
        "commentContent" : commentContent.value
    };

    fetch("/comment" , {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data) // JS 객체 -> JSON 파싱
    }) // 보낼때
    .then(resp => resp.text()) // 받을때
    .then(result => {
        if(result > 0){ // 등록 성공
            alert("댓글이 등록되었습니다.");

            commentContent.value = ""; // 작성했던 댓글 삭제

            selectCommentList(); // 비동기 댓글 목록 조회 함수 호출
            // -> 새로운 댓글이 추가되어짐

        } else { // 실패
            alert("댓글 등록에 실패했습니다...");
        }
    })
    .catch(err => console.log(err));
});

