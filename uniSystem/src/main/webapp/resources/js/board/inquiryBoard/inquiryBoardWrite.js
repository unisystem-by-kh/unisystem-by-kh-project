// 게시글 등록 시 제목, 내용 작성 여부 검사
const boardWriteFrm = document.getElementById("boardWriteFrm");
const boardTitle = document.getElementsByName("boardTitle")[0];
const boardContent = document.getElementsByName("boardContent")[0];
const boardSt = document.getElementsByName("boardSt")[0];

boardWriteFrm.addEventListener("submit", e => {

    if(boardTitle.value.trim().length == 0){
        alert("제목을 입력해주세요.");
        boardTitle.value = "";
        boardTitle.focus();
        e.preventDefault();
        return ;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 입력해주세요.")
        boardContent.value = "";
        boardContent.focus();
        e.preventDefault();
        return ;
    }

    if(!boardSt.checked){
        alert("공개여부를 선택해주세요")
        e.preventDefault();
        return ;
    }
})