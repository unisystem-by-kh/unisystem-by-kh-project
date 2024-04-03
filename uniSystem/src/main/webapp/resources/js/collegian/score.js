

const submitTask = th =>{ // 모달 창 함수

    if(th.parentNode.parentNode.cells[6].innerText=='미부여'){
        alert("점수를 배정 받은 후 강의 평가가 가능합니다.")
        return
    }

    const modalContainer = document.getElementById("modal");

    const nameBox = document.querySelector('#name_box > h2' ); // 제출 과제 명 input

    const inputTask = document.getElementById("task_no"); // 숨겨진 task no

    nameBox.innerText = "📖 "+th.parentNode.parentNode.cells[2].innerText; // 과제 제출 과목 담기

    modalContainer.classList.add('show');
}



// 모달 창 닫기
const notShow = th =>{
    document.getElementById('modal').classList.remove('show');
}

function taskSubmitValidation() {

        

        alert("점수를 선택해주세요");
        return false;
}

