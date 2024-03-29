

const submitTask = th =>{ // 모달 창 함수

    const modalContainer = document.getElementById("modal");

    const nameBox = document.querySelector('#name_box > h2' ); // 제출 과제 명 input

    const inputTask = document.getElementById("task_no"); // 숨겨진 task no

    nameBox.innerText = "📖 "+th.parentNode.parentNode.cells[4].innerText; // 과제 제출 과목 담기

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

