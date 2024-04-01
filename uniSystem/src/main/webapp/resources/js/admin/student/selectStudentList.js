const allSelect = document.getElementById("allSelect");
const tbody = document.querySelector('tbody'); // 처음 학생 조회 페이지 들어왔을때의 tbody 내부 저장
const tbodyFirstTr = document.querySelector('tbody').firstElementChild; // 처음 학생 조회 페이지 들어왔을때의 tbody의 첫 번째 행 저장

// 학생 학번 클릭 시 배경색 변경
allSelect.addEventListener("click", ()=>{
    let rows = document.querySelectorAll('.select-row');
    rows.forEach(row => {
        if(!row.checked){
            row.checked = true;
            row.parentElement.parentElement.parentElement.classList.add('highlight');
        }
        
    });
});

function colorChange(){
    let rows = document.querySelectorAll('.select-row');
    rows.forEach(row => {
        if(!row.checked){
            row.parentElement.parentElement.parentElement.classList.remove('highlight');
        }
        
    });
}

function noChange(){
    let rows = document.querySelectorAll('.select-row');
    rows.forEach(row => {
        row.addEventListener("change", ()=>{
            if(row.checked){
                row.parentElement.parentElement.parentElement.classList.add('highlight');
            }else{
                row.parentElement.parentElement.parentElement.classList.remove('highlight');
            }
        });
    });
}


// 일괄 진급 클릭 시 호출되는 함수
function openModal() {

    const checkedNo = document.querySelectorAll('.select-row');
    const memberNoArr = [];
    checkedNo.forEach(no => {
        if(no.checked){ // 체크 된 학생들만
            const memberNo = no.parentElement.firstElementChild.innerText;
            const memberGrade = Number(no.parentElement.parentElement.nextElementSibling.nextElementSibling.innerText);
            const memberTerm = Number(no.parentElement.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
            const classPoint = Number(no.parentElement.parentElement.parentElement.lastElementChild.innerText.substr(0, 3));

            const memberObj = {
                memberNo : memberNo,
                memberGrade : memberGrade,
                memberTerm : memberTerm,
                classPoint : classPoint
            }
            memberNoArr.push(memberObj);
                

        }
    });

    // 진급 승인 시 열리는 confirm
    swal({
        title : memberNoArr.length+"명의 진급을 승인하시겠습니까?",
        text : "진급을 승인하려면 확인 버튼",
        icon : "warning", // 아이콘 모양 
        buttons : ["취소", "승인"],
        dangerMode : true,
    })
    .then((willDelete) => {
        if(willDelete){ // 예 버튼 클릭시
            
            // 이수학점 충족 검사
            for (const member of memberNoArr) {
                let gradeFlag = false; // 이수 학점 충족 여부
                console.log(member);
                console.log(member.memberTerm);
                console.log(member.memberGrade);
                console.log(member.classPoint);

                if(member.memberTerm == 1){
                    switch(member.memberGrade){
                        case 1 : if(member.classPoint >= 15) gradeFlag = true; break;
                        case 2 : if(member.classPoint >= 45) gradeFlag = true; break;
                        case 3 : if(member.classPoint >= 75) gradeFlag = true; break;
                        case 4 : if(member.classPoint >= 105) gradeFlag = true; break;
                    }
                }else{
                    switch(member.memberGrade){
                        case 1 : if(member.classPoint >= 30) gradeFlag = true; break;
                        case 2 : if(member.classPoint >= 60) gradeFlag = true; break;
                        case 3 : if(member.classPoint >= 90) gradeFlag = true; break;
                        case 4 : if(member.classPoint >= 120) gradeFlag = true; break;
                    }
                }

                if(!gradeFlag){
                    swal({
                        title : "진급 불가",
                        text : "이수학점을 충족하지 못한 학생이 있습니다.",
                        icon  : "error",
                        closeOnClickOutside : false
                    }).then(function(){
                        history.go(0);
                    });
                    return;
                }

            }





            /* 진급 할려는 회원 번호를 가지고 비동기 통신 */
            fetch("/admin/demotion",{
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(memberNoArr)
            })
            .then(resp => resp.text())
            .then(result => {
                if(result > 0){
                    swal({
                        title : "진급 승인이 완료되었습니다.",
                        icon  : "success",
                        closeOnClickOutside : false
                    }).then(function(){
                        history.go(0);
                    });
                }else{
                    swal({
                        title : "진급 실패",
                        text : "등록급을 납부하지 못한 학생이 있습니다.",
                        icon  : "error",
                        closeOnClickOutside : false
                    }).then(function(){
                        history.go(0);
                    });
                }
            })
            .catch(e => console.log(e))


        }
    });

}


// 재적 상태 '신청'일 때 재적 요청 사유 조회
function statusChange(requestReason, e){

    const checkStatus = e.target.childNodes[1]; // input type='checkbox' 요소
    const status = e.target; // 클릭된 td

    if(!checkStatus.checked){ // hidden인 input이 체크되지 않은 상태일때
        const tr = document.createElement("tr");
        const td = document.createElement("td");

        td.innerText = requestReason; // 매개변수로 받아온 재적 요청 사유를 대입

        td.setAttribute("colspan", "7"); // td를 한줄 크키로 지정
        tr.append(td);
        status.parentElement.after(tr); // 클릭된 td 바로 다음 요소에 추가

        checkStatus.checked = true; // input 체크
    }else{ // input이 체크 해제 되었을 때
        status.parentElement.nextSibling.remove(); // 추가했던 td요소 제거
        checkStatus.checked = false; // 체크 해제
    }
}

// 검색 시 작동
const search = document.getElementById("search");
search.addEventListener("change", (e)=>{

    const backupTr = tbodyFirstTr.cloneNode(true);

    tbody.innerHTML = '';

    studentArr.forEach(stu =>{

        
        if(stu.memberNo.indexOf(e.target.value) != -1 || stu.memberName.indexOf(e.target.value) != -1){

            // insertTr(backupTr, stu);

            tbody.append(insertTr(backupTr, stu));

        }

    });
    
    if(tbody.innerHTML == ''){ // 검색어에 해당하는 결과가 없을 경우

        const newTr = document.createElement("tr");
    
        const newTd = document.createElement("td");
        newTd.setAttribute("colspan", '7');
    
        newTd.innerText = '검색 결과가 없습니다.';

        newTr.append(newTd);
        tbody.append(newTr);
    }
    colorChange();
    noChange();
});







/* 재적상태 옵션 */
const firstSelect = document.getElementById("first_select");
firstSelect.addEventListener("change", ()=>{

    const backupTr = tbodyFirstTr.cloneNode(true);

    tbody.innerHTML = '';

    switch(firstSelect.value){
        case 'Y' : console.log('휴학');
            selectTagFn('Y', backupTr);
            break;
        case 'N' : console.log('재학');
            selectTagFn('N', backupTr);
            break;
        case 'P' : console.log('졸업');
            selectTagFn('P', backupTr);
            break;
        case 'D' : console.log('중퇴'); 
            selectTagFn('D', backupTr);
            break;
        case 'YY' : console.log('휴학신청'); 
            selectTagFn('YY', backupTr);
            break;
        case 'NN' : console.log('복학신청'); 
            selectTagFn('NN', backupTr);
            break;
        case 'DD' : console.log('자퇴신청');
            selectTagFn('DD', backupTr);
            break;
    }
    colorChange();
    noChange();
});

/* 재적상태 옵션 변경 시 실행되는 함수 */
function selectTagFn(status, backupTr){
    studentArr.forEach(stu=>{
        if(stu.requestType != ''){
            if(stu.requestType+status.substr(0,1) == status){
                tbody.append(insertTr(backupTr, stu));
            }    
        }else{
            if(stu.memberStatus == status){
                tbody.append(insertTr(backupTr, stu));
            }
        }
    });
    if(tbody.innerHTML == '') tbody.append(emptyTbody());
}

/* 학년 select 선택시 실행 */
const secondSelect = document.getElementById("secondSelect");
secondSelect.addEventListener("change", ()=>{

    const backupTr = tbodyFirstTr.cloneNode(true);

    tbody.innerHTML = '';

    switch(secondSelect.value){
        case '1' : console.log("1학년"); 
            secondSelectTag('1', backupTr);
            break;
        case '2' : console.log("2학년"); 
            secondSelectTag('2', backupTr);
            break;
        case '3' : console.log("3학년"); 
            secondSelectTag('3', backupTr);
            break;
        case '4' : console.log("4학년"); 
            secondSelectTag('4', backupTr);
            break;
    }
    colorChange();
    noChange();
});

/* 학년 select 선택시 실행되는 이벤트 안에서 실행되는 함수 */
function secondSelectTag(grade, backupTr){
    studentArr.forEach(stu=>{
        if(stu.memberGrade == grade){
            tbody.append(insertTr(backupTr, stu));
        }
    });
    if(tbody.innerHTML == '') tbody.append(emptyTbody());
}


/* 한 행 새로만드는 함수 */
function insertTr(backupTr, stu){
    
    const newTr = backupTr.cloneNode(true); // 깊은 복사
    // 첫 td 안쪽 span 태그에 memberNo 삽입
    newTr.firstElementChild.firstElementChild.innerHTML = stu.memberNo + "<input type='checkbox' class='select-row'>"; 
    // 두 번째 td 안에 a태그 안에 href 변경 및 내용 변경
    newTr.firstElementChild.nextElementSibling.firstElementChild.setAttribute("href", '/admin/'+stu.memberNo+'/selectStudentDetail');
    newTr.firstElementChild.nextElementSibling.firstElementChild.innerText = stu.memberName;
    // 세 번째 td 안에 학년 삽입            
    newTr.firstElementChild.nextElementSibling.nextElementSibling.innerText = stu.memberGrade;

    // 네 번째 td 안에 학기 삽입
    newTr.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.innerText = stu.memberTerm;

    // 다섯 번째 td 학과 삽입
    newTr.lastElementChild.previousElementSibling.previousElementSibling.innerText = stu.deptName;

    // 여섯 번째 td 내용
    if(stu.requestType != ''){ // 재적 변경 요청이 있을 경우

        newTr.lastElementChild.previousElementSibling.classList.remove("std-status"); // 만약 class 가 있다면 아래에서 추가해주기 위해 제거
        newTr.lastElementChild.previousElementSibling.classList.add("std-status"); // 클래스 추가
        newTr.lastElementChild.previousElementSibling.setAttribute('onClick', "statusChange(" +"\""+ stu.requestReason + "\"" + ", event)"); // 재적 변경 요청 사유가 나오는 함수 추가

        switch(stu.requestType){
            case 'Y' : newTr.lastElementChild.previousElementSibling.innerHTML = "휴학신청<input type='checkbox' hidden>"; break;
            case 'N' : newTr.lastElementChild.previousElementSibling.innerHTML = "복학신청<input type='checkbox' hidden>"; break;
            case 'D' : newTr.lastElementChild.previousElementSibling.innerHTML = "자퇴신청<input type='checkbox' hidden>"; break;
        }

    }else{ // 재적 변경 요청이 없을 경우

        newTr.lastElementChild.previousElementSibling.classList.remove("std-status"); // 클래스 제거
        newTr.lastElementChild.previousElementSibling.removeAttribute("onClick"); // 클릭했을시 재적 변경 요청 사유가 나오는 함수 제거

        switch(stu.memberStatus){
            case 'Y' : newTr.lastElementChild.previousElementSibling.innerText = "휴학중"; break;
            case 'N' : newTr.lastElementChild.previousElementSibling.innerText = "재학중"; break;
            case 'P' : newTr.lastElementChild.previousElementSibling.innerText = "졸업"; break;
            case 'D' : newTr.lastElementChild.previousElementSibling.innerText = "중퇴"; break;
        }


    } // 여섯 번째 td 내용 변경 끝
    
    // 마지막 td 안에 이수 학점 대입
    let str = '\u00a0\u00a0/\u00a0\u00a0';
    if(stu.memberTerm == 1){
        switch(stu.memberGrade){
            case '1' : str += '15'; break;
            case '2' : str += '45'; break;
            case '3' : str += '75'; break;
            case '4' : str += '105'; break;
        }
    }else{
        switch(stu.memberGrade){
            case '1' : str += '30'; break;
            case '2' : str += '60'; break;
            case '3' : str += '90'; break;
            case '4' : str += '120'; break;
        }
    }
    newTr.lastElementChild.innerText = stu.classPoint+str; // 한 학생이 채워야 하는 이수 학점
    // console.log(newTr.lastElementChild.innerText);
    return newTr;
}

/* 검색, select태그로 조회했을 때 조회 결과가 없다면 실행되는 함수 */
function emptyTbody(){

    const newTr = document.createElement("tr");
            
    const newTd = document.createElement("td");
    newTd.setAttribute("colspan", '7');

    newTd.innerText = '검색 결과가 없습니다.';

    newTr.append(newTd);

    return newTr;
}
noChange();