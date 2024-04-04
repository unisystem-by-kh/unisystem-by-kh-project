const currDept = document.getElementsByName('dept')[0].innerHTML; // + 버튼 누르면 값을 추가하기 위해서
const upXBtn = document.getElementsByClassName('up-x')[0].innerHTML; // 위와 마찬가지
const newTr = document.querySelector("tbody>tr:first-child").innerHTML;

const writePlus = document.getElementById("writePlus");

// 과제 등록의 +버튼 클릭시
writePlus.addEventListener("click", ()=>{

    const tr = document.createElement("tr");

    // tr을 통째로 넣었을 때 JS가 작동 X
    tr.innerHTML = newTr; // 1행에 있던 HTML을 복사

    document.querySelector("tbody").append(tr);

    dateFn();
    fileFn();
    deptFn();
    xBtnFn();
    deleteBtn();

});



// document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

// 제출 기한 설정의 초기값
const currentDate = document.getElementsByClassName('currentDate');
for(let i=0; i<currentDate.length; i++){
    currentDate[i].value = new Date().toISOString().substring(0, 10);
}
function dateFn(){
    currentDate[currentDate.length-1].value = new Date().toISOString().substring(0, 10);
}



const file = document.getElementsByName("file");
const upload =  document.getElementsByClassName('up-x');

function fileFn(){
    /* 파일 업로드 시 td 태그 내에 내용 변경 */
    for(let i=0; i<file.length; i++){
        file[i].addEventListener("change", (e)=>{
            // console.log("파일 변경됨");
    
            // console.log(upload[i].firstElementChild);
            upload[i].firstElementChild.style.display = 'none';
    
            const text = document.createElement('span');
            // console.log(file[i].value);
    
            const str = file[i].value.lastIndexOf("\\");
            // console.log(file[i].value.substring(str+1));
            
            text.innerText = file[i].value.substring(str+1);
            
            upload[i].prepend(text);
        });
    }

    return;
}

const xBtn = document.getElementsByName('X-btn');
// 과제 등록의 X 버튼 클릭시 과제 삭제
function xBtnFn(){
    for(let i=0; i<xBtn.length; i++){
        xBtn[i].addEventListener("click", ()=>{
            // console.log(file[i].value == '');
    
            if(file[i].value == ''){
                console.log(file[i].value);
                console.log("if문 안쪽");
                return;
            }
    
            upload[i].firstElementChild.remove();
            file[i].value = '';
    
            upload[i].firstElementChild.style.display = '';
    
    
        });
    }
    return;
}


const dept = document.getElementsByName('dept');
const deptList = document.getElementsByClassName('deptList');
const term = document.getElementsByClassName('term');
const grade = document.getElementsByClassName('grade');

// 과목명에 따라 분류, 학기, 학년 변경
function deptFn(){
    for(let j=0; j < dept.length; j++){
        dept[j].addEventListener("change", ()=>{
            const selectVal = dept[j].value;
        
            for(let i=0; i<classNo.length; i++){
                if(selectVal == classNo[i]){
        
                    let str;
                    switch(classList[i]){
                        case '2' : str = '비전공'; break;
                        case '3' : str = '전공'; break;
                    }
        
                    dept[j].parentElement.nextElementSibling.innerText = str;
                    dept[j].parentElement.previousSibling.innerText = classTerm[i];
                    // dept[j].parentElement.previousSibling.previousSibling.innerText = classTerm[i];
                    term[j].innerText = classTerm[i];
                    grade[j].innerText = classGrade[i];
                    
                }
            }
        })
    }
}

const delBtn = document.getElementsByClassName("del-btn"); // td 삭제 버튼
document.querySelectorAll(".del-btn")


function deleteBtn(){

    for(let i=0; i<delBtn.length; i++){
        delBtn[i].addEventListener("click", (e)=>{
            // console.log("삭제 진입");
            e.target.parentElement.parentElement.remove();
        });
    }
    return;
}

const saveBtn = document.getElementById("save");

// 현 상태 저장을 누를 시 교과목, 제출기한, 과제파일 명(파일을 가져가는게 아닌 파일 명만)을 가지고 서버로 감
saveBtn.addEventListener("click", ()=>{
    for(let i of dept){
        if(Number(i.value) < 0){
            alert("과목이 선택되지 않은 과제가 있습니다.");
            return;
        }
    }

    for(let i of file){
        if(i.value == ''){
            alert("과제파일이 등록되지 않은 과제가 있습니다.");
            return;
        }
    }


    // JavaScript 객체를 JSON 문자열로 변환
    let jsonData = '';
    
    const arr = [];

    for(let i=0; i<dept.length; i++){
        
        const classNo = dept[i].value;
        console.log(classNo);
        const fileName = file[i].value;
        const taskDate = currentDate[i].value;

        console.log(classNo);

        const obj = {
            classNo : classNo,
            fileName : fileName,
            taskDate : taskDate
        }

        arr.push(obj);
    }

    console.log(arr);
    
    

    // JSON 데이터 전송
    fetch('/professor/taskWrite', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(arr)
    })
    .then(resp => resp.text())
    .then(result => {

        const subForm =  document.getElementById("subForm");

        subForm.action = '/professor/uploadTask';
        subForm.method = 'POST';
        subForm.enctype = 'multipart/form-data';
        subForm.submit();
        
    })
    .catch(e => {console.log(e)})

    
   
});


dateFn();
fileFn();
deptFn();
xBtnFn();
deleteBtn();



// 등록된 과제 삭제
function deleteTask(taskNo){
    console.log(taskNo);

    fetch('/professor/taskDelete',{
        method: 'PUT',
        headers: {'Content-Type': 'application/json'},
        body: taskNo
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            console.log("삭제 완");
            
            swal({
                title : "등록된 과제가 삭제되었습니다.",
                    icon  : "success",
                    closeOnClickOutside : false
            }).then(function(){
                history.go(0);
            });

        }else{
            swal({
                title : "과제 삭제 실패",
                    icon  : "error",
                    closeOnClickOutside : false
            }).then(function(){
                history.go(0);
            });
        }
    })
    .catch(e => console.log(e))

    // history.go(0); : 페이지 새로 고침
}