const subBtn = document.getElementById("subBtn");

const boardTitle = document.getElementById("boardTitle");
const boardContent = document.getElementById("boardContent");


const alr = {};

alr.alert = function(title, icon, focus){
    swal({
        title : title,
        icon  : icon,
        button : "확인",
        closeOnClickOutside : false
    }).then(function(){
        focus.focus();
    });
}


    

subBtn.addEventListener("click", ()=>{

    let writeFlag = {
        title : false,
        content : false
    }

    if(boardTitle.value.trim() != ''){
        writeFlag.title = true;
    }

    if(boardContent.value.trim() != ''){
        writeFlag.content = true;
    }

    for(let i in writeFlag){
        console.log(writeFlag[i]);

        if(!writeFlag[i]){
            console.log(i + "미작성");
            switch(i){
                case "title" : alr.alert("제목이 작성되지 않았습니다.", "error", boardTitle); break;
                case "content" : alr.alert('내용이 작성되지 않았습니다.', "error", boardContent); break;
            }
            return
        }
    }
    subBtn.setAttribute("type", "submit");
});


// 파일 등록시 input 안에 내용 변경
const file = document.getElementById("inputFile");

const fileName = document.getElementById("fileName");

file.addEventListener("change", ()=>{
    console.log(file.value);
    console.log(fileName.value);
    fileName.value = file.value;
})