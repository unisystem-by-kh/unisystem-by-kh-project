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