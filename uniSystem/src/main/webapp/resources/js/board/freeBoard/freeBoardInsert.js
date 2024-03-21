// 미리보기 관련 요소 모두 얻어오기
const preview = document.getElementsByClassName('preview');
const inputImage = document.getElementsByClassName('inputImage');

const deleteSet = new Set();

for(let i = 0; i < inputImage.length; i++){
    
    inputImage[i].addEventListener('change' , (e)=>{

        const file = e.target.files[0];
        
        if(file != undefined){

            const reader = new FileReader();

            reader.readAsDataURL(file);

            reader.onload = e => {
                preview[i].setAttribute('src' , e.target.result);

                deleteSet.delete(i);
            }

        }else{
            preview[i].removeAttribute('src');
            console.log(preview);
        }

    })

}


// // 게시글 등록 시 제목, 내용 작성 여부 검사
// const boardWriteFrm = document.getElementById("boardWriteFrm");
// const boardTitle = document.getElementsByName("boardTitle")[0];
// const boardContent = document.getElementsByName("boardContent")[0];

// boardWriteFrm.addEventListener("submit", e => {

//     if(boardTitle.value.trim().length == 0){
//         alert("제목을 입력해주세요.");
//         boardTitle.value = "";
//         boardTitle.focus();
//         e.preventDefault();
//         return ;
//     }

//     if(boardContent.value.trim().length == 0){
//         alert("내용을 입력해주세요.")
//         boardContent.value = "";
//         boardContent.focus();
//         e.preventDefault();
//         return ;
//     }

// })