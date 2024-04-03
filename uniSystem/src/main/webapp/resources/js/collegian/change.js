function stateValidate(){
    const radio = document.querySelectorAll(".second-line input");

    let flag = false;

    for (const ra of radio) {
        if(ra.checked){
            flag = true;
        }
    }

    if(!flag){
        alert("요청 내역을 선택하세요");
        return flag
    }


    const reason = document.querySelector("textarea");

    if(reason.value.trim() == ''){
        flag = false;
        alert("요청 사유를 입력하세요");
        return flag
    }


    return flag;
}