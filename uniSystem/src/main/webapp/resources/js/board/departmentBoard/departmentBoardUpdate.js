const imgArea = document.getElementsByClassName("imgArea")
const inputImage = document.getElementsByClassName("inputImage")
const deleteImage = document.getElementsByClassName("deleteImage")
const writeForm = document.getElementById("writeForm")
const boardTitle = document.getElementsByName("boardTitle")[0];
const boardContent = document.getElementsByName("boardContent")[0];
const shoot = document.getElementsByName("shoot");

$(document).ready(function(){
    //화면 준비되면 로딩이미지 숨기기
    $('.wrap-loading').hide();	
});

inputImage[0].addEventListener("change", e => {

    const file = e.target.files[0];
    if(file != undefined){ // 파일이 선택 되었을 때
        const reader = new FileReader(); // 파일을 읽는 객체

        reader.readAsDataURL(file);
        // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장

        reader.onload = e => { // 파일을 다 읽은 후 수행
            imgArea[0].setAttribute("src", e.target.result)
        }
    }else{ // 선택 후 취소 되었을 때
            // -> 선택 된 파일 없음 -> 미리보기 삭제
            imgArea[0].removeAttribute("src")
    }

})

// 미리보기 삭제 버튼(x버튼)
deleteImage[0].addEventListener("click", () => {
    
    // 미리보기 이미지가 있을 경우
    if(imgArea[0].getAttribute("src") != ""){
        // 미리보기 삭제
        imgArea[0].removeAttribute("src")

        // input type="file"태그의 value를 삭제
        // ** input type="file"의 value ""(빈칸)만 대입 가능 **
        inputImage[0].value = "";
    }
})



writeForm.addEventListener("submit", e => {

   
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

    if(shoot[0].checked == false && shoot[1].checked == false){
        alert("이메일 발송여부를 선택해주세요")
        e.preventDefault();
        return ;
    }
    $(".wrap-loading").show();
    
})

const goToList = document.getElementById("goToList")

goToList.addEventListener("click",e=>{
    if(confirm("게시물 작성을 취소하시겠습니까?")){
        e.preventDefault();
        history.back()
        return ;
    }
})





