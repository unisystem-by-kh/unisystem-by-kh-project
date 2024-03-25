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
            console.log(memberList);

            if(memberList.length != 0){

                resultSet.innerText = "";
                xBtn.style.display = "block";
                resultSet.style.display = "block";
                resultSet1.style.display = "block";

                for (const mem of memberList) {
                    const li = document.createElement("li");
                    const b = document.createElement("b");
                    const span = document.createElement("span");

                    b.setAttribute("onclick", "setting(event)");
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

function setting(event) {
    event.preventDefault();
    const clickedElement = event.target;
    
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


/* 강의 시간 체크 교수는 맨 위에 선언되어있음 professor */
const checkTime = document.getElementById("checkTime"); // 시간체크 버튼
const classDay = document.getElementById("classDay"); // 요일
const classStart = document.getElementById("classStart"); // 시작교시
const classEnd = document.getElementById("classEnd"); // 마치는교시
let check = false;

checkTime.addEventListener("click", () =>{

    if(professor.value.trim().length == 0){

        swal({
            title : "시간 체크 불가.",
            text : "담당 교수님을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(()=>{
            // 알림창 이후 실행 할 코드 (있을때만 작성)
        });
        
        
        return;
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

/* form태그 제출 시 */
document.getElementById("insertFrm").addEventListener("submit", e=>{

    if(professor.value.trim().length == 0){

        swal({
            title : "등록 불가",
            text : "담당 교수님을 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
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

