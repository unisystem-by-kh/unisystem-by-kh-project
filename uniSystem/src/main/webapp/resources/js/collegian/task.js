

const submitTask = th =>{ // 모달 창 함수

    // 주어진 기한 문자열
    const deadlineString = th.parentNode.parentNode.cells[11].innerText;

    // 현재 날짜 얻기
    const currentDate = new Date();

    // 기한을 Date 객체로 변환
    const deadlineDate = new Date(deadlineString);

    // 현재 날짜가 기한을 지났는지 여부 확인
    if (currentDate > deadlineDate) {
        alert('기한이 이미 지났습니다.');
        return
    } 

    const modalContainer = document.getElementById("modal");

    const nameBox = document.querySelector('#name_box > h2' ); // 제출 과제 명 input

    const inputTask = document.getElementById("task_no"); // 숨겨진 task no

    nameBox.innerText = "📖 "+th.parentNode.parentNode.cells[4].innerText; // 과제 제출 과목 담기

    const infoData = th.parentNode.parentNode.cells[10]; // 데이터 담긴 td

    const filePath = infoData.getAttribute("filePath");

    const fileName = infoData.getAttribute("fileName");

    //document.getElementById("des_box").value = filePath;
    const openFile = document.getElementById("openFile");

    if(filePath == ''){ // 과제 파일이 없을 경우

        openFile.innerText = "제출한 파일이 없습니다."
        openFile.removeAttribute("href");
        openFile.removeAttribute("download");

    }else{

        openFile.setAttribute("href",filePath);
        openFile.setAttribute("download",fileName);
        openFile.innerText = fileName;

    }

    inputTask.value = infoData.innerText; // 과제 번호 담기

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


