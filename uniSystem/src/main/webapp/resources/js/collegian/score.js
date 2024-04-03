

const submitTask = th =>{ // 모달 창 함수

    if(th.parentNode.parentNode.cells[7].innerText=='미부여'){
        alert("점수를 배정 받은 후 강의 평가가 가능합니다.")
        return
    }

    const modalContainer = document.getElementById("modal");

    const nameBox = document.querySelector('#name_box > h2' ); // 제출 과제 명 input

    const classNo = document.getElementById("classNo"); // 숨겨진 task no

    classNo.value = th.parentNode.parentNode.cells[1].innerText;

    nameBox.innerText = "📖 "+th.parentNode.parentNode.cells[3].innerText; // 과제 제출 과목 담기

    modalContainer.classList.add('show');
}



// 모달 창 닫기
const notShow = th =>{
    document.getElementById('modal').classList.remove('show');
}

function taskSubmitValidation() {

    const radio = document.querySelectorAll(".like-area input");

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

