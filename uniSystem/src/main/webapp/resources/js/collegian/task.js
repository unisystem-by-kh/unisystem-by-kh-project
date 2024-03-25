const submitTask = th =>{

    const modalContainer = document.getElementById("modal");

    const nameBox = document.getElementById('name_box');

    const inputTask = document.getElementById("task_no");

    nameBox.value = th.parentNode.parentNode.cells[4].innerText; // 과제 제출 과목 담기

    inputTask.value = th.parentNode.parentNode.cells[10].innerText; // 과제 번호 담기

    modalContainer.classList.add('show');
}

// 모달 창 닫기
const notShow = th =>{
    document.getElementById('modal').classList.remove('show');
}

function taskSubmitValidation() {
    console.log(document.getElementById("des_box").value);

    if(document.getElementById("des_box").value == ''){
        alert("파일을 선택해주세요");
        return false;
    }else{
        
    }
};


