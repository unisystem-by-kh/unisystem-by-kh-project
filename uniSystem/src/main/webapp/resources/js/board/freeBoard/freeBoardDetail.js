function selectCommentList(){

    // 기본적으로 form태그는 GET/POST만 지원
    fetch("/comment?boardNo=" + boardNo)
    .then(response => response.json())
    .then(rList => {

        const replyList = document.getElementsByClassName('row8')[0];
        replyList.innerHTML = '';

        for(let reply of rList){

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

        }

    })
    .catch(err => console.log(err));

}


