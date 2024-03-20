// 담당 교수 실시간 검색
const deptName = document.getElementById("departmentNo");
const professor = document.getElementById("teacher");
const resultSet = document.getElementById("resultSet");

professor.addEventListener("focus",  () =>{

    if(deptName.value == 0){
        swal({
            title : "학과를 선택해주세요.",
            icon  : "warning",
            button : "예",
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
                resultSet.style.display = "block";

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
                resultSet.style.display = "block"; 
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
    }
    
}

resultSet.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("resultSet")) {
        resultSet.style.display = "none"
    }
})

/* 강의 시간 체크 교수는 맨 위에 선언되어있음 professor */
const checkTime = document.getElementById("checkTime"); // 시간체크 버튼
const classDay = document.getElementById("classDay"); // 요일
const classStart = document.getElementById("classStart"); // 시작교시
const classEnd = document.getElementById("classEnd"); // 마치는교시

checkTime.addEventListener("click", () =>{

    if(professor.value.trim().length == 0){
        alert("교수 비어있음");
        return;
    }

    if(classStart.value.trim().length == 0){
        alert("시작시간 비어있음");
        return;
    }

    if(classEnd.value.trim().length == 0){
        alert("마치는시간 비어있음");
        return;
    }

    if(classDay.value == 0){
        alert("요일 선택하셈");
        return;
    }

    
})

/* form태그 제출 시 */
document.getElementById("insertFrm").addEventListener("submit", e=>{
    
})

