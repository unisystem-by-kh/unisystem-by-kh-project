const boardTitle = document.getElementById("boardTitle-con")
const modal1 = document.getElementsByClassName("modal-back")[0]
const modalPw = document.getElementById("modal-pw")
const modalBtn = document.getElementById("modalBtn");
const closeBtn = document.getElementById("closeBtn")

function modal(e){
    modal1.style.display = "block";

    const boardNo = e.getAttribute("data")
    modalBtn.addEventListener("click",()=>{
        
        const data = {"modalPw" : modalPw.value,
        "boardNo" : boardNo}
        
        
        fetch("/board/check",{
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body :  JSON.stringify(data)
        })
        .then(resp => resp.text())
        .then(result=>{
            if(result > 0){
                location.href = "/board/4/" + boardNo + location.search ;
            }else{
                alert("비밀번호가 일치하지 않습니다")
                modalPw.value = "";
                modalPw.focus();
            }
        })
    })

    closeBtn.addEventListener("click",()=>{
        modal1.style.display = "none";
    })

}