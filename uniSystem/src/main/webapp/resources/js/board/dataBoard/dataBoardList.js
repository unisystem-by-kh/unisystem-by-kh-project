const tableTr = document.getElementsByClassName("tableTr");

for(let i of tableTr){
    i.addEventListener("click", e=>{
        const boardNo = i.firstElementChild.innerText;
        console.log(boardNo);

        location.href = "/board/5/"+boardNo;
    })
}