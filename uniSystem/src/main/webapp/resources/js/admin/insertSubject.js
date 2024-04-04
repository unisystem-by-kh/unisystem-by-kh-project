// 담당 교수 실시간 검색
const deptName = document.getElementById("departmentNo");
const professor = document.getElementById("teacher");
const resultSet = document.getElementById("resultSet");
const resultSet1 = document.getElementsByClassName("resultSet-area")[0];
const xBtn = document.getElementById("x-btn");

professor.addEventListener("focus",  () =>{

    if(deptName.value == 0){
        swal({
            title : "학과를 선택해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(function(){
            deptName.focus();
        });

    }else{
    
        fetch("/staff/professorSearch",{
            method : "POST",
            headers : {"Content-Type" : "application/text"}, 
            body : deptName.value
        })
        .then( resp => resp.json())
        .then( memberList => {

            if(memberList.length != 0){

                resultSet.innerText = "";
                xBtn.style.display = "block";
                resultSet.style.display = "block";
                resultSet1.style.display = "block";

                for (const mem of memberList) {
                    const li = document.createElement("li");
                    const b = document.createElement("b");
                    const span = document.createElement("span");

                    b.setAttribute("memberNo", mem.memberNo);
                    b.setAttribute("onclick", `setting(event)`);
                    b.innerHTML = mem.memberName 
                    

                    span.innerHTML = ` - ${mem.memberNo}`;
                    li.append(b,span);
                    resultSet.append(li);
                }

            } else{
                xBtn.style.display = "block";
                resultSet.style.display = "block"; 
                resultSet1.style.display = "block";
                resultSet.innerHTML = "<li>해당 학과에 담당교수님이 없습니다.</li>";
                professor.value = '';
            }

        } )
        .catch( err => console.log(err))
    }

})

let saveMemberNo;

function setting(event) {
    event.preventDefault();

    const clickedElement = event.target;
    saveMemberNo = clickedElement.getAttribute("memberNo");

    if (clickedElement.tagName === "B") {
        const clickedValue = clickedElement.innerText;
        
        professor.value = clickedValue; 

        resultSet.style.display = "none";
        xBtn.style.display = "none";
        resultSet1.style.display = "none";
    }
    
}

// x버튼 클릭시 닫기
if(xBtn != null){
    xBtn.addEventListener("click", ()=>{
        if(resultSet.style.display = "block"){
            resultSet.style.display = "none";
            xBtn.style.display = "none";
            resultSet1.style.display = "none";
        }
    })
}

document.addEventListener("click", function(e) {
    // 클릭된 요소가 결과 영역 외부에 있으면 결과 영역을 숨깁니다.
    if (!resultSet1.contains(e.target) && !professor.contains(e.target)) {
        resultSet.style.display = "none";
        xBtn.style.display = "none";
    }
});

// function removeDiv(e, rs){
//     console.log(rs);
//     if (!resultSet1.contains(rs) && !professor.contains(e.target)) {
//         resultSet.style.display = "none";
//         xBtn.style.display = "none";
//     }
// }

// 포커스 아웃 시 검색결과창 닫기
// professor.addEventListener("focusout", (e)=>{
//     removeDiv(e.target, resultSet1);
// })

// 담당 교수 change 시 존재하는 담당교수 인지 확인
professor.addEventListener("change", ()=>{

    if(resultSet.style.display != "none"){

        resultSet.style.display = "none";
        xBtn.style.display = "none";
        resultSet1.style.display = "none";
    }

    if(professor.value.trim().length == 0){
        swal({
            title : "담당 교수님을 입력해주세요.",
            icon  : "warning",
            closeOnClickOutside : false
        }).then(function(){
            professor.value = "";
            professor.focus();
        });
    }

    fetch("/staff/checkProfessor?deptCode=" + deptName.value + "&professor=" + professor.value)
    .then( resp => resp.text() )
    .then( result => {

        if(result == 0){
            swal({
                title : "담당 교수님을 확인해주세요.",
                text : "해당 교수님의 이름으로 등록된 교수님은 없습니다.",
                icon  : "warning",
                closeOnClickOutside : false
            }).then(function(){
                professor.value = "";
                professor.focus();
            });
        }
    })
    .catch(e => console.log(e));

})


/* 강의 시간 체크 교수는 맨 위에 선언되어있음 professor */
const checkTime = document.getElementById("checkTime"); // 시간체크 버튼
const classDay = document.getElementById("classDay"); // 요일
const classStart = document.getElementById("classStart"); // 시작교시
const classEnd = document.getElementById("classEnd"); // 마치는교시
const timetable = document.querySelector(".timetable"); // 시간표
let check = false;
let savedClassStart;
let savedClassEnd;

// 비동기로 불러온 해당 교수의 수업 정보를 시간표에 추가하는 함수
function addClassToTimetable(classDay, classStart, classEnd, className) {
    
    // 교시가 시작하는 행과 끝나는 행을 계산
    const startRow = classStart;
    const endRow = classEnd;
    
    // 교시가 요일의 몇 번째 열에 해당하는지 인덱스를 가져옴
    const dayIndex = getDayIndex(classDay);
    
    // 시작 행부터 끝 행까지 반복하여 시간표에 수업 이름을 추가
    for (let i = startRow; i <= endRow; i++) {
        const row = timetable.querySelector(`tbody tr:nth-child(${i})`); // 해당 교시의 행
        const cell = row.querySelector(`td:nth-child(${dayIndex})`); // 해당 요일의 셀
        cell.textContent = className; // 수업 이름을 셀에 표시
       
    }
}

// 교시가 시간표의 몇 번째 요일에 해당하는지 인덱스를 반환하는 함수
function getDayIndex(day) {
    switch (day) {
        case "월":
            return 2;
        case "화":
            return 3;
        case "수":
            return 4;
        case "목":
            return 5;
        case "금":
            return 6;
        default:
            return -1; // 잘못된 입력이면 -1 반환
    }
}

// 교수의 수업 리스트(classList)를 받아서 시간표에 추가하는 함수
function displayClassSchedule(classList) {
    classList.forEach(classInfo => {
        const { classDay, classStart, classEnd, className } = classInfo;
        addClassToTimetable(classDay, classStart, classEnd, className);
    });
}

// 이전 내용을 삭제하기 위한 코드 추가
const clearTimetable = () => {
    const table = document.querySelector(".timetable>table");
    const rowList = table.rows;

    for (let i = 1; i < rowList.length; i++) { // thead 부분을 제외하기 위해 1부터 시작
        const row = rowList[i];
        const tdsNum = row.childElementCount; // 아래 for문에서 사용하기 위해 row 하위에 존재하는 td의 갯수를 구합니다.

        for (let j = 2; j <= tdsNum; j++) { // 첫번째 td부분을 제외하기 위해서 2부터 시작
            const cell = row.querySelector(`td:nth-child(${j})`);
            cell.textContent = "";
        }
    }
};

checkTime.addEventListener("click", () =>{
    
    if(professor.value.trim().length == 0){

        swal({
            title : "시간 체크 불가.",
            text : "담당 교수님을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            professor.focus();
            professor.value = "";
        });
        
        return;

    }

    if(timetable != null){ // 교과목 등록일 때 만 사용하게 조건 걸어둠

        // 교수의 수업 리스트를 가져오는 API 호출
        fetch("/staff/timeTable",{
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : saveMemberNo
        })
        .then( resp => resp.json())
        .then( classList => {

            if(classList.length > 0){
                clearTimetable(); // 빈 테이블로 만드는 함수 호출 
                // 시간표에 수업 추가
                timetable.style.display = "block";
                displayClassSchedule(classList);
            }else{
                timetable.style.display = "none";
            }
                
        })
        .catch( e=> console.log(e))

    }


    if(classStart.value.trim().length == 0){

        swal({
            title : "시간 체크 불가.",
            text : "시작 교시를 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classStart.value = "";
            classStart.focus();
        });

        return;
    }

    if(classEnd.value.trim().length == 0){

        swal({
            title : "시간 체크 불가.",
            text : "마치는 교시를 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classEnd.value = "";
            classEnd.focus();
        });

        return;
    }

    const regEx = /[1-8]/;

    if(!regEx.test(classStart.value)){
        swal({
            title : "시간 체크 불가.",
            text : "1 ~ 8교시만 존재합니다.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classStart.value = "";
            classStart.focus();
        });

        return;
    }

    if(!regEx.test(classEnd.value)){
        swal({
            title : "시간 체크 불가.",
            text : "1 ~ 8교시만 존재합니다.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classEnd.value = "";
            classEnd.focus();
        });

        return;
    }

    if(classDay.value == 0){

        swal({
            title : "시간 체크 불가.",
            text : "요일을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classDay.focus();
        });

        return;
    }

    if(classStart.value.trim() > classEnd.value.trim()){

        swal({
            title : "시간 체크 불가.",
            text : "시작 시간은 마치는 시간보다 같거나 작아야합니다.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classStart.value = "";
            classStart.focus();
        });

        return;
    }

    const data = {
        "professor" : professor.value,
        "classDay" : classDay.value,
        "classStart" : classStart.value,
        "classEnd" : classEnd.value
    };

    fetch("/staff/timeCheck",{
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then( resp => resp.text())
    .then( count =>{
        
        // 겹치는 시간이 있는지 확인 != 0 중복됨 강의 등록 X
        if(count == 0){
            swal("등록 가능", "", "success");

            savedClassStart = classStart.value;
            savedClassEnd = classEnd.value;

            check = true;

        }else{
            swal({
                title : "등록 불가",
                text : `해당 시간에 ${professor.value} 교수님 강의가 있습니다.`,
                icon : "warning",
                buttons : "확인"
            })

            check = false;
        }

    })
    .catch( e => console.log(e))

    
})

const className = document.getElementById("className");
const classPoint = document.getElementById("classPoint");
const classMax = document.getElementById("classMax");
const grade = document.getElementById("grade");
const semester = document.getElementById("semester");

className.addEventListener("focus", ()=>{
    if(resultSet.style.display != "none"){

        resultSet.style.display = "none";
        xBtn.style.display = "none";
        resultSet1.style.display = "none";
    }
})

/* form태그 제출 시 */
document.getElementById("insertFrm").addEventListener("submit", e=>{

    if(professor.value.trim().length == 0){

        swal({
            title : "등록 불가",
            text : "담당 교수님을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            professor.value = "";
            professor.focus();
        });

        e.preventDefault();
        return;
    }

    if(className.value.trim().length == 0){

        swal({
            title : "등록 불가",
            text : "과목명을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            className.value = "";
            className.focus();
        });
        
        e.preventDefault();
        return;
    }

    if(classPoint.value.trim().length == 0){

        swal({
            title : "등록 불가",
            text : "강의 학점을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classPoint.value = "";
            classPoint.focus();
        });

        e.preventDefault();
        return;
    }

    if(classPoint.value != "2" && classPoint.value != "3" ){

        swal({
            title : "등록 불가",
            text : "강의 학점은 3(전공) 또는 2(교양)만 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classPoint.focus();
            classPoint.value = "";
        });

        e.preventDefault();
        return;
    }

    const regEx = /^[\d]+$/;

    if(!regEx.test(classMax.value)){
        swal({
            title : "등록 불가",
            text : "수강 정원에 숫자만 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classMax.value = "";
            classMax.focus();
        });

        e.preventDefault();
        return;
    }

    if(classMax.value.trim().length == 0){

        swal({
            title : "등록 불가",
            text : "수강 정원을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            classMax.value = "";
            classMax.focus();
        });

        e.preventDefault();
        return;
    }

    if(grade.value == 0){

        swal({
            title : "등록 불가",
            text : "학년을 선택해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            grade.focus();
        });

        e.preventDefault();
        return;
    }

    if(semester.value == 0){

        swal({
            title : "등록 불가",
            text : "학기를 선택해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            semester.focus();
        });

        e.preventDefault();
        return;
    }

    if(savedClassStart != classStart.value){
        check = false;
    }

    if(savedClassEnd != classEnd.value){
        check = false;
    }

    if(check == false){

        swal({
            title : "등록 불가",
            text : "시간 체크 후 등록해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            checkTime.focus();
        });

        e.preventDefault();
        return;
    }
    

})

// 초기화 버튼 클릭 시 시간표 숨김
const resetBtn = document.querySelector(".btn-area>button:nth-child(1)");
if(resetBtn != null){
    resetBtn.addEventListener("click", ()=>{
        timetable.style.display = "none";
    })
}