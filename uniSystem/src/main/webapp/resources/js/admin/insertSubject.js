// 담당 교수 실시간 검색
const deptName = document.getElementById("departmentNo");
const professor = document.getElementById("teacher");
const resultSet = document.getElementById("resultSet");

professor.addEventListener("focus",  () =>{

    if(deptName.value == 0){
        alert("학과를 선택해주세요.");
        deptName.focus();

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

                    li.innerHTML = `<b>${mem.memberName}</b>` + `<span> - ${memberNo}</span>`;
                    resultSet.append(li);
                }

            } else{
                resultSet.style.display = "block";
                resultSet.innerHTML = "<li>해당 학과에 담당교수님이 없습니다.</li>";
            }

        } )
        .catch( err => console.log(err))

    }


    


})