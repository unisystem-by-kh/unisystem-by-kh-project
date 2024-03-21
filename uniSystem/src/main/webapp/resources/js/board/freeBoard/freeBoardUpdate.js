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
        }

    })

    // // 미리보기 삭제 버튼(x버튼)
    // deleteImage[i].addEventListener('click' , ()=>{

    //     // 미리보기 이미지가 있을 경우
    //     if(preview[i].getAttribute('src') != ''){

    //         // 미리보기 삭제
    //         preview[i].removeAttribute('src');

    //         // input type="file" 태그의 value를 삭제
    //         // ** input type="file"의 value ""(빈칸)만 대입 가능 **
    //         inputImage[i].value = '';

    //         // deleteSet에 삭제된 이미지 순서(i) 추가
    //         deleteSet.add(i);

    //     }

    // })

}


/* // 이미지 미리보기 및 파일 삭제 기능 추가
document.getElementById('file').addEventListener('change', function() {
    var file = this.files[0];
    var reader = new FileReader();
    var previewArea = document.querySelector('.row3-imgArea');

    reader.onload = function(e) {
        var previewImage = document.createElement('img');
        previewImage.classList.add('preview-image');
        previewImage.src = e.target.result;
        
        // 이미지 추가
        previewArea.innerHTML = ''; // 이미지를 덮어쓰지 않도록 이전 이미지 삭제
        previewArea.appendChild(previewImage);

        // 삭제 아이콘 추가
        var deleteIcon = document.createElement('span');
        deleteIcon.classList.add('delete-image');
        deleteIcon.innerHTML = '&times;';
        deleteIcon.addEventListener('click', function() {
            previewArea.innerHTML = ''; // 이미지 제거
            document.getElementById('file').value = null; // 파일 입력값 제거
        });
        previewArea.appendChild(deleteIcon);
    };

    if (file) {
        reader.readAsDataURL(file);
    }
}); */


/* document.getElementById('file').addEventListener('change', function() {
    var file = this.files[0];
    var reader = new FileReader();
    var previewArea = document.querySelector('.row3-imgArea');

    reader.onload = function(e) {
        var previewImage = document.createElement('img');
        previewImage.classList.add('preview-image');
        previewImage.src = e.target.result;

        // 이미지 클릭 시 파일 입력란 활성화
        previewImage.addEventListener('click', function() {
            document.getElementById('file').click(); // 파일 입력란 클릭
        });

        // 이미지 추가
        previewArea.innerHTML = ''; // 이미지를 덮어쓰지 않도록 이전 이미지 삭제
        previewArea.appendChild(previewImage);

        // 삭제 아이콘 추가
        var deleteIcon = document.createElement('span');
        deleteIcon.classList.add('delete-image');
        deleteIcon.innerHTML = '&times;';
        deleteIcon.addEventListener('click', function() {
            previewArea.innerHTML = ''; // 이미지 제거
            document.getElementById('file').value = null; // 파일 입력값 제거
        });
        previewArea.appendChild(deleteIcon);
    };

    if (file) {
        reader.readAsDataURL(file);
    }
});
 */