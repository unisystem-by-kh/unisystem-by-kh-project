// 게시글 등록 시 제목, 내용 작성 여부 검사
const boardWriteFrm = document.getElementById("boardWriteFrm");
const boardTitle = document.getElementsByName("boardTitle")[0];
const boardContent = document.getElementsByName("boardContent")[0];
const boardSt = document.getElementsByName("boardSt")[0,1];

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

  
    if(boardSt[0].checked == false && boardSt[1].checked == false){
        alert("공개여부를 선택해주세요")
        e.preventDefault();
        return ;
    }else{
        alert("등록되었습니다.")
    }
    

   

})

// 목록으로
const goToListBtn = document.getElementById("goToListBtn")


goToListBtn.addEventListener("click",()=>{

    /* // location.href = "/board/" + boardCode + location.search;
    
    
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
    
    location.href = url; */
    if(confirm("수정을 취소하시겠습니까?")){
        history.back();

    }

})