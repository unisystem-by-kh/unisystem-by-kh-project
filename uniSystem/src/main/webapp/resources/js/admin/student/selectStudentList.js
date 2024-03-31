/* (()=>{
    fetch("/admin/selectList", {
        method : 'get',
        headers : {'Content-Type' : "application/json"},
        body : 1
    })
    .then(resp => resp.text())
    .then(map=>{
        console.log(map);
    })
    .catch(e=>console.log(e))
})() */

let rows = document.querySelectorAll('.select-row'); // :checked

const allSelect = document.getElementById("allSelect");

// 학생 학번 클릭 시 배경색 변경
allSelect.addEventListener("click", ()=>{
    rows.forEach(row => {
        if(!row.checked){
            row.checked = true;
            row.parentElement.parentElement.parentElement.classList.add('highlight');
        }
        
    });
});

rows.forEach(row => {
    row.addEventListener("change", ()=>{
        if(row.checked){
            row.parentElement.parentElement.parentElement.classList.add('highlight');
        }else{
            row.parentElement.parentElement.parentElement.classList.remove('highlight');
        }
    });
});

// 일괄 진급 클릭 시 호출되는 함수
function openModal() {

    const checkedNo = document.querySelectorAll('.select-row');
    const memberNoArr = [];
    checkedNo.forEach(no => {
        if(no.checked){ // 체크 된 학생들만
            console.log(no.parentElement.firstElementChild.innerText); // 체크 되어있는 학생의 번호
            const memberNo = no.parentElement.firstElementChild.innerText;
            const memberObj = {
                memberNo : memberNo
            }
            memberNoArr.push(memberObj);
        }
    });
    console.log(memberNoArr.length);

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
            console.log("진급 승인");

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
                console.log(result);
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
                        text : "진급 조건을 충족하지 못한 대상이 있습니다.",
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

    /* const modal = document.getElementById("modal");
    modal.style.display = "block"; */
}

/*  function closeModal() {
    const modal = document.getElementById("modal");
    modal.style.display = "none";
}

function confirmModal() {
    document.querySelector(".modal-body > div").innerText = "N개의 진급이 승인되었습니다.";
    document.querySelector(".modal-footer > button").style = "display:none;";
    // document.querySelector(".confirm-btn").style = "display:block;";

    const confirm = document.querySelector(".approve-btn");
    confirm.innerText = "확인";
    confirm.removeAttribute("onclick");
    confirm.setAttribute("onclick", "closeModal()");
} */


// 재적 상태 '신청'일 때 재적 요청 사유 조회
function statusChange(requestReason, e){
    /* console.log(requestReason);
    console.log(e.target.childNodes[1]);
    console.log(e.target); */

    const checkStatus = e.target.childNodes[1]; // input type='checkbox' 요소
    const status = e.target; // 클릭된 td

    if(!checkStatus.checked){ // hidden인 input이 체크되지 않은 상태일때
        const tr = document.createElement("tr");
        const td = document.createElement("td");

        td.innerText = requestReason; // 매개변수로 받아온 재적 요청 사유를 대입

        td.setAttribute("colspan", "6"); // td를 한줄 크키로 지정
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
    console.log(e.target.value);
    const tbody = document.querySelector('tbody');

    const backupTr = tbody.firstElementChild;

    // console.log(backupTr);
    // console.log(backupTr.firstElementChild);


    tbody.innerHTML = '';

    console.log(studentArr);

    studentArr.forEach(stu =>{

        
        if(stu.memberNo.indexOf(e.target.value) != -1 || stu.memberName.indexOf(e.target.value) != -1){
            console.log(stu);
            
            /* const tr = document.createElement("tr");
            const noTd = document.createElement("td");
            const label = document.createElement("label"); */


            const newTr = backupTr.cloneNode(true);
            console.log(newTr);
            console.log(stu.memberNo);
            // 첫 td 안쪽 span 태그에 memberNo 삽입
            newTr.firstElementChild.firstElementChild.innerHTML = stu.memberNo + "<input type='checkbox' class='select-row'>"; 
            console.log(newTr.firstElementChild.firstElementChild);
            console.log(newTr);
            // 두 번째 td 안에 a태그 안에 href 변경 및 내용 변경
            newTr.firstElementChild.nextElementSibling.firstElementChild.setAttribute("href", '/student/'+stu.memberNo+'/selectStudentDetail');
            newTr.firstElementChild.nextElementSibling.firstElementChild.innerText = stu.memberName;
            // 세 번째 td 안에 학년 삽입            
            newTr.firstElementChild.nextElementSibling.nextElementSibling.innerText = stu.memberGrade;
            // 네 번째 td 안에 학과 삽입
            newTr.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.innerText = stu.deptName;

            // 다섯 번째 td 내용
            if(stu.requestType != ''){ // 재적 변경 요청이 있을 경우
                console.log("재적 변경 요청 있을 경우");
                // newTr.lastElementChild.previousElementSibling.innerText = stu.requestReason;
                newTr.lastElementChild.previousElementSibling.classList.remove("std-status"); // 만약 class 가 있다면 아래에서 추가해주기 위해 제거
                newTr.lastElementChild.previousElementSibling.classList.add("std-status"); // 클래스 추가
                newTr.lastElementChild.previousElementSibling.setAttribute('onClick', "statusChange(" +"\""+ stu.requestReason + "\"" + ", event)"); // 재적 변경 요청 사유가 나오는 함수 추가
                // console.log(newTr.lastElementChild.previousElementSibling.innerText);
                // console.log(newTr.lastElementChild.previousElementSibling);
                switch(stu.requestType){
                    case 'Y' : newTr.lastElementChild.previousElementSibling.innerHTML = "휴학신청<input type='checkbox' hidden>"; break;
                    case 'N' : newTr.lastElementChild.previousElementSibling.innerHTML = "복학신청<input type='checkbox' hidden>"; break;
                    case 'D' : newTr.lastElementChild.previousElementSibling.innerHTML = "자퇴신청<input type='checkbox' hidden>"; break;
                }

                // <td class="std-status" onClick="statusChange('${student.requestReason}', event)">휴학신청<input type="checkbox" hidden></td>
            }else{ // 재적 변경 요청이 없을 경우
                console.log("재적 변경 요청 X");

                newTr.lastElementChild.previousElementSibling.classList.remove("std-status"); // 클래스 제거
                newTr.lastElementChild.previousElementSibling.removeAttribute("onClick"); // 클릭했을시 재적 변경 요청 사유가 나오는 함수 제거

                switch(stu.memberStatus){
                    case 'Y' : newTr.lastElementChild.previousElementSibling.innerText = "휴학중"; break;
                    case 'N' : newTr.lastElementChild.previousElementSibling.innerText = "재학중"; break;
                    case 'P' : newTr.lastElementChild.previousElementSibling.innerText = "졸업"; break;
                    case 'D' : newTr.lastElementChild.previousElementSibling.innerText = "중퇴"; break;
                }

                // <td>휴학중<input type="checkbox" hidden></td>

            } // 다섯 번째 td 내용 변경 끝
            
            // 여섯 번째 td 안에 이수 학점 대입
            newTr.lastElementChild.innerText = stu.classPoint+'/30(한 학년 총 학점)'; // '/30(한 학년 총 학점)' : 추후 변경 요소
            
            console.log(newTr);
            tbody.append(newTr);
            console.log(tbody);
        }

    });
    
    if(tbody.innerHTML == ''){ // 검색어에 해당하는 결과가 없을 경우

        const newTr = document.createElement("tr");
    
        const newTd = document.createElement("td");
        newTd.setAttribute("colspan", '6');
    
        newTd.innerText = '검색 결과가 없습니다.';

        newTr.append(newTd);
        tbody.append(newTr);
    }

    rows = document.querySelectorAll('.select-row');
});