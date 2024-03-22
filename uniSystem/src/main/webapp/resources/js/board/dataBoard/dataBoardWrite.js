const subBtn = document.getElementById("subBtn");

const boardTitle = document.getElementById("boardTitle");
const boardContent = document.getElementById("boardContent");


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

    







});