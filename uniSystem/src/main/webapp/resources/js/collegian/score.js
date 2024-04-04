

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

//console.log(scoreList);


const selectBoxes = document.querySelectorAll(".search-area select")

const area = document.querySelector(".stu-board tbody");

for (let i of selectBoxes) {
    
    i.addEventListener("change" , e=>{

        const grade = document.getElementsByName("grade")[0];
        const step = document.getElementsByName("step")[0];

        const gradeIndex = grade.selectedIndex;
        const gradeValue = grade.options[gradeIndex].value;

        const stepIndex = step.selectedIndex;
        const stepValue = step.options[stepIndex].value;

        area.innerHTML = "";

        if(scoreList.length == 0) {
            const nullTr = document.createElement("tr");

            const nullTd = document.createElement("td");

            nullTd.innerText = "과목이 존재하지 않습니다.";

            nullTd.style.textAlign ="center";
            nullTd.style.fontSize = "17px";

            nullTd.setAttribute("colspan", '8');

            nullTr.append(nullTd);

            area.append(nullTr);
        }
        for (const i of scoreList) {
            if(gradeValue == 0 && stepValue==0 ){
                createScore(i);
            }
            else if(gradeValue == 0){

                if(i.lectureTerm == stepValue && stepValue != 0){
                    createScore(i);
                }
            }else if(stepValue == 0){
                if(i.lectureGrade == gradeValue && gradeValue != 0){
                    createScore(i);
                }
            }
            else if(i.lectureGrade == gradeValue  && i.lectureTerm == stepValue ){
                createScore(i);
            }
        }

        countS();
    } )
}



function createScore(i){

    const tr = document.createElement("tr");

    const lectureGrade = document.createElement("td");
    lectureGrade.innerText = i.lectureGrade+"학년";

    const classNo = document.createElement("td");
    classNo.innerText = i.classNo;
    classNo.style.display = "none";

    const lectureTerm = document.createElement("td");
    lectureTerm.innerText = i.lectureTerm+"학기";

    const classNm = document.createElement("td");
    classNm.innerText = i.classNm;

    const classType = document.createElement("td");
    classType.innerText = i.classType;

    const classPoint = document.createElement("td");
    classPoint.innerText = i.classPoint;

    const memberName = document.createElement("td");
    memberName.innerText = i.memberName; 

    const realPoint = document.createElement("td");
    realPoint.innerText = i.realPoint;

    const btnTd = document.createElement("td");
    
    let flBtn = document.createElement("button");

    if(i.rateFlag == 'Y'){ // 수강한 과목
        flBtn.innerText="평가완료";
    }else{
        flBtn.innerText="제출 하기";
        flBtn.setAttribute("onclick","submitTask(this)");
    }

    btnTd.append(flBtn);

    tr.append(lectureGrade,classNo,lectureTerm, classNm, classType, classPoint,memberName,realPoint,btnTd);
    
    area.append(tr);
}



function countS(){
    let count = 0;

    let selectClass = document.querySelector(".stu-board table"); // 수강 신청 화면
    
    for(let ro = 0; ro < selectClass.rows.length ; ro++){ // 수강 신청 내역의 테이블의 tr 요소들

        if(ro != 0){ // 1번째 행은 제외
            count += parseInt(selectClass.rows[ro].cells[5].innerText);
        }
    }

    const countArea = document.querySelector("#count");

    countArea.innerText = count+"점";

    let avr = 0;

    let sum = 0;

    for(let ro = 0; ro < selectClass.rows.length ; ro++){ // 수강 신청 내역의 테이블의 tr 요소들

        if(ro != 0){ // 1번째 행은 제외

            if(selectClass.rows[ro].cells[7].innerText!='미부여'){
                switch (selectClass.rows[ro].cells[7].innerText) {
                    case 'A':
                        sum += 4.0
                        break;
                    case 'B':
                        sum += 3.0
                        break;
                    case 'C':
                        sum += 2.0
                        break;
                    case 'D':
                        sum += 1.0
                        break;
                    case 'F':
                        sum += 0.0
                        break;
                }
            }
        }
    }
    
    if(sum != 0){
        avr = sum/(selectClass.rows.length-1);
    }

    document.querySelector("#avr").innerText = avr+"점";

}


window.onload = countS();
