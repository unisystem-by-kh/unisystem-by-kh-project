// 검색 영역
const searchFrm = document.getElementById("searchFrm");
const subjectKey = document.getElementById("subjectKey");
const subjectKeyQuery = document.getElementById("subjectQuery");
const options = document.querySelectorAll("#subjectKey > option");

(()=>{
    const params = new URL(location.href).searchParams;

    const key = params.get("key"); 
    const query = params.get("query"); 

    if(key != null){ // 검색을 했을 때
        // 검색어를 화면에 출력
        subjectKeyQuery.value = query;

        // option태그를 하나씩 순차 접근해서 value가 key랑 같으면
        // selected 속성 추가
        for (let op of options) {
            if(key == op.value){
                op.selected = true;
            }
        }
    }
    
})();

searchFrm.addEventListener("submit", e => {

    if(subjectKeyQuery.value.trim().length == 0){
        e.preventDefault();
        swal({
            title : "검색어를 입력해주세요.",
            icon  : "warning",
            button : "확인",
            closeOnClickOutside : false
        }).then(function(){
            subjectKeyQuery.value = "";
            subjectKeyQuery.focus();
        });
    }

})

// 과목 수정 버튼 클릭시
const table = document.querySelector("table");
const rowList = table.rows;
const modal = document.querySelector(".modal"); // 수정 모달창

for(i=1; i<rowList.length; i++){ // thead부분 제외.

    const row = rowList[i];
    const updateBtn = row.cells[5];
    const deleteBtn = row.cells[6];

    const classNo = row.cells[0].innerHTML; // 과목 번호
    const deptName = row.cells[1].innerHTML; // 학과 이름
    const className = row.cells[2].innerHTML; // 과목명
    const professor = row.cells[3].innerHTML; // 전담 교수
    const classTime = row.cells[4].innerHTML; // 강의 시간

    updateBtn.addEventListener("click", ()=>{

    
        const deptOptions = document.querySelectorAll("#departmentNo>option"); 
        const inputClassNo = document.getElementById("classNo");
        const inputClassName = document.getElementById("className");
        const inputProfessor = document.getElementById("teacher");
        const classStart = document.getElementById("classStart"); // 시작 시간
        const classEnd = document.getElementById("classEnd"); // 종료 시간
        const classDay = document.getElementById("classDay"); // 요일

        const regex = /^([가-힣]+)\((\d+)교시~(\d+)교시\)$/;
        // 원하는 부분 추출
        const match = classTime.match(regex);
        let day = match[1][0];
        let startPeriod = parseInt(match[2]);
        let endPeriod = parseInt(match[3]);

        modal.style.display="flex";

        inputClassNo.value = classNo;
        inputClassName.value = className;
        inputProfessor.value = professor;
        classStart.value = startPeriod;
        classEnd.value = endPeriod;
        classDay.value = day;
        for (let op of deptOptions) {
            if(deptName == op.innerHTML){
                op.selected = true;
            }
        }

    }) // 수정버튼 이벤트 종료

    // 삭제 버튼 클릭시
    deleteBtn.addEventListener("click", ()=>{

        swal({
            title : "정말로 삭제하시겠습니까?",
            text : "삭제된 교과목 정보는 다시 불러올 수 없습니다.",
            icon : "error", // 아이콘 모양 
            buttons : ["취소", "삭제"],
            dangerMode : true,
        })
        .then((willDelete) => {
            if(willDelete){ // 삭제 버튼 클릭시

                fetch("/staff/delete",{
                    method : "DELETE",
                    headers : {"Content-Type" : "application/json"},
                    body : classNo
                })
                .then( resp => resp.text() )
                .then( result =>{
                    console.log(result);

                    if(result > 0){
                        swal({
                            title : "삭제되었습니다.",
                            icon : "success",
                            button : "확인",
                            closeOnClickOutside : false
                        })
                        .then(()=>{
                            history.go(0);
                        });

                    } else {
                        swal({
                            title : "삭제 실패.",
                            icon : "error",
                            button : "확인",
                            closeOnClickOutside : false
                        })
                    }

                })
                .catch( e=> console.log(e))
            }

        });

    })

}

// 수정 모달 x버튼
const x = document.querySelector(".close-area");
if(x != null){
    x.addEventListener("click", ()=>{
        if(modal.style.display =="flex"){
            modal.style.display="none";
        }
    })
}
