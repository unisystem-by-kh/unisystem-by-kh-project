const currDept = document.getElementsByName('dept')[0].innerHTML; // + 버튼 누르면 값을 추가하기 위해서
const upXBtn = document.getElementsByClassName('up-x')[0].innerHTML; // 위와 마찬가지
const newTr = document.querySelector("tbody>tr:first-child").innerHTML;


// 기본 인덱스 길이
let defaultIndex = 3; // 추후 숫자 변경

const writePlus = document.getElementById("writePlus");

writePlus.addEventListener("click", ()=>{

    const tr = document.createElement("tr");
    const noTd = document.createElement("td");
    noTd.innerText = defaultIndex++;

    // tr을 통째로 넣었을 때 JS가 작동 X
    tr.innerHTML = newTr;
    console.log(tr);
    document.querySelector("tbody").append(tr);


    document.querySelector("tbody>tr:last-child>td:first-child").remove();


    document.querySelector("tbody>tr:last-child").prepend(noTd);

    dateFn();
    fileFn();
    deptFn();
    xBtnFn();
    deleteBtn();

});



// document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

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

// 과목명에 따라 분류, 학기 변경
function deptFn(){
    for(let i=0; i<dept.length; i++){
        dept[i].addEventListener("change", ()=>{
    
            const index = Number(dept[i].value)-1;
            let str;
            switch(classList[index]){
                case '2' : str = '비전공'; break;
                case '3' : str = '전공'; break;
            }
            term[i].innerText = classTerm[index];
            deptList[i].innerText = str;
        });
    }
    return;
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

    // form 데이터 가져오기
    // const form = document.querySelector('form');
    // const formData = new FormData(form);

    // 1번 객체
    let firstObject = {};

    // 2번 객체
    const secondObject = {};
    
    for (let i = 0; i < dept.length; i++) {
        // 1번 객체에 데이터 담기
        firstObject.dept = dept[i].value;
        firstObject.file = file[i].value;
        firstObject.date = currentDate[i].value;
    
        // 1번 객체를 2번 객체에 담기
        secondObject.data = { ...firstObject };
    
        // 1번 객체 초기화
        firstObject = {};
    
        // 2번 객체에 1번 객체 담기
        secondObject[i] = { ...secondObject.data };
    }
    delete secondObject.data;
    // console.log(secondObject);
    // console.log(secondObject[0]);
    // console.log(secondObject[1]);


    // JavaScript 객체를 JSON 문자열로 변환
    let jsonData = '';
    
    console.log(Object.values(secondObject).length);

    for(let i=0; i<Object.values(secondObject).length; i++){
        if(i+1 == Object.values(secondObject).length){
            jsonData += JSON.stringify(secondObject[i]);
        }else{
            jsonData += JSON.stringify(secondObject[i])+",";
        }
    }
  

    console.log(JSON.stringify(jsonData));
    console.log(jsonData);

    // JSON 데이터 전송
    fetch('/taskWrite', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: jsonData,
    })
    .then(response => {
        // 응답 처리
    })
    .catch(error => {
        // 에러 처리
    });

});








dateFn();
fileFn();
deptFn();
xBtnFn();
deleteBtn();