console.log("수강신청 js 연결")

// 수강 신청 목록 담기
const addToCart = (th) => {
    let row = th.parentNode.parentNode.cells; // 선택한 행
    // 정원 초과 과목 return
    if(row[9].innerText<=row[10].innerText){
        alert("정원 초과 과목입니다.");
        return
    }

    if(document.getElementById('noneLecture') != null){
        document.getElementById('noneLecture').parentNode.remove();
    }


    const selectClass = document.querySelector(".select-class table");

    let tr = document.createElement('tr');

    for (let i =0; i < row.length; i++) { // 클릭한 행의 td 요소들

                                if(selectClass.rows.length != 1){ // 수강 과목이 없을 경우 배제
                                    for(let ro of selectClass.rows){ // 수강 신청 내역의 테이블의 tr 요소들

                                        for(let cell of ro.cells){ // 각 tr 요소의 td 요소들

                                            if(row[0].innerText == ro.cells[0].innerText){
                                                alert("이미 담겨 있는 과목 입니다.")
                                                return;
                                            }

                                            let selectday = row[8].innerText.split(/[ ,(,),교시]/)[0];
                                            let selectStart = row[8].innerText.split(/[ ,(,),교시]/)[2];
                                            let selectEnd = row[8].innerText.split(/[ ,(,),교시]/)[6];
                                            
                                            let orginday = cell.innerText.split(/[ ,(,),교시]/)[0];
                                            let orgStart = cell.innerText.split(/[ ,(,),교시]/)[2];
                                            let orgEnd = cell.innerText.split(/[ ,(,),교시]/)[6];

                                            if(orginday == selectday  ){ // 같은 요일
                                                if( orgStart <= selectStart && orgEnd >= selectStart ){ // 시작 교시 조건
                                                    alert("강의 시간이 중복됩니다.");
                                                    return;
                                                }
                                                if( orgStart <= selectEnd && orgEnd >= selectEnd){ // 끝 교시 조건
                                                    alert("강의 시간이 중복됩니다.");
                                                    return;
                                                }
                                            };
                                        }

                                    } 
                                }// 중복 확인 영역
        
        let td = document.createElement('td');

        if( i == 7 ){ // 강의 담기 버튼 따로 생성
            
            const cancleBtn = document.createElement('button');
            const updateBtn = document.createElement('button');

            cancleBtn.innerText = '취소';
            cancleBtn.setAttribute("onclick", "deleteClass(this)" );

            updateBtn.innerText = '신청';
            updateBtn.setAttribute("onclick", "updateMyClass(this)" );
            
            td.append(cancleBtn,updateBtn);
            
        }else{
            td.innerHTML = row[i].innerHTML;
        }
        tr.append(td);
    }

    selectClass.append(tr);

    pointCount();

    selectClass.scrollIntoView();
}


// 담은 목록에서만 삭제
const deleteClass = th => {

    const row = th.parentNode.parentNode; // 선택한 tr 반환

    row.remove(); // 요소 삭제
}

// 신청한 수강 과목을 삭제
const deleteMyClass = th => {

    const row = th.parentNode.parentNode; // 선택한 tr 반환

    let classNo = row.cells[0].innerText; // tr의 첫 번째 td 반환 == 과목 번호

    console.log(classNo);

    const bodyData = { 'memberNo' : memberNo,
                        'classNo' : classNo};

    console.log(bodyData);

    fetch('/collegian/deleteLecture',{
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(bodyData)
    })
    .then(res =>res.text())
    .then(result=>{
        if(result > 0){
            alert("해당 수강 신청이 취소 되었습니다.");

            const row = th.parentNode.parentNode;

            row.remove(); // 해당 행 삭제

            // 수강 목록 리프레시
            refresh();
        }
    })

};

// 단일 수강 신청
const updateMyClass = th => {

    const row = th.parentNode.parentNode; // 선택한 tr 반환

    let classNo = row.cells[0].innerText; // tr의 첫 번째 td 반환 == 과목 번호

    console.log(classNo);

    const bodyData = { 'memberNo' : memberNo,'classes' : classNo}; // 비동기로 넘길 것들

    if(classNo != ""){

        fetch('/collegian/insertLecture',{
    
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(bodyData)
        })
        .then(res => res.json())
        .then(result => {

            console.log(result);
    
            if(result>0 && result<100){
                alert("해당 과목 수강 신청이 완료되었습니다.");

                row.cells[7].innerHTML =""; 

                const deletBtn = document.createElement('button');
                deletBtn.innerText = '신청 취소';
                deletBtn.setAttribute("onclick", "deleteMyClass(this)" );

                row.cells[7].append(deletBtn);

                console.log(row.cells[10].innerText);

                row.cells[10].innerText = parseInt(row.cells[10].innerText)+1;

                refresh();

            }else if(result>=100){

                alert("수강 정원이 다 찼습니다.");

                row.cells[7].innerHTML =""; 

                const deletBtn = document.createElement('button');
                deletBtn.innerText = '취소';
                deletBtn.setAttribute("onclick", "deleteClass(this)" );

                row.cells[7].append(deletBtn);

            }else{
                alert("수강 신청 실패");
            }

    
        })
        .catch(err => {console.log(err)})
    }else{
        alert("신청할 과목이 존재하지 않습니다.")
    }

}





// 전체 신청 버튼
document.getElementById("class-btn").addEventListener("click", e => {
    let classes = "";

    
    let selectClass = document.querySelector(".select-class table"); // 수강 신청 화면
    
    for(let ro = 0; ro < selectClass.rows.length ; ro++){ // 수강 신청 내역의 테이블의 tr 요소들

        if(ro != 0){ // 1번째 행은 제외

            if(selectClass.rows[ro].cells[7].innerText != '신청 취소'){
                
                let classNo = selectClass.rows[ro].cells[0].innerText; // 수강 신청 과목번호 담음
        
                classes +=classNo.trim()+"/";
            }
        }
    }

    const bodyData = {'memberNo':memberNo,'classes':classes}

    if(classes != ""){ // 담긴 과목 번호가 있을 경우
        
        fetch('/collegian/insertLecture',{
    
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(bodyData)
        })
        .then(res => res.text())
        .then(result => {
            console.log(result);
            if(result>0){
                location.reload(); // 페이지 새로 고침
                alert("수강 과목 신청 결과" + result);

            }else{
                alert("수강 신청 실패 서버 콘솔 확인하세요");
            }
    
        })
        .catch(err => {console.log(err)})
    }else{
        alert("신청할 과목이 존재하지 않습니다.")
    }

});


// 비동기 통신

const selectBoxes = document.querySelectorAll(".search-area select")

for (let i of selectBoxes) {
    
    i.addEventListener("change" , e=>{

        const major = document.getElementsByName("major")[0];
        const grade = document.getElementsByName("grade")[0];
        const step = document.getElementsByName("step")[0];
        const type = document.getElementsByName("type")[0];
        

        const majorIndex = major.selectedIndex;
        const majorValue = major.options[majorIndex].value;

        const gradeIndex = grade.selectedIndex;
        const gradeValue = grade.options[gradeIndex].value;

        const stepIndex = step.selectedIndex;
        const stepValue = step.options[stepIndex].value;

        const typeIndex = type.selectedIndex;
        const typeValue = type.options[typeIndex].value;

        const keys = {
            'major' : majorValue,
            'grade' : gradeValue,
            'step'  : stepValue,
            'type'  : typeValue,
            'memberNo' : memberNo
        }

        fetch('/collegian/myClass' , {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(keys)
        })
        .then(res => res.json())
        .then(searchList => {
            
            history.replaceState({}, null, location.pathname); // 주소의 파라미터 값 지움
            
            document.getElementsByName("query")[0].value = ''; // 검색어 삭제

            placeholer();

            const lecture = searchList.lecture;

            const area = document.querySelector(".stu-board > table tbody");

            area.innerHTML = "";
          
            if(lecture.length == 0) {

                const nullTr = document.createElement("tr");

                const nullTd = document.createElement("td");

                nullTd.innerText = "과목이 존재하지 않습니다.";

                nullTd.style.textAlign ="center";
                nullTd.style.fontSize = "17px";

                nullTd.setAttribute("colspan", '11');

                nullTr.append(nullTd);

                area.append(nullTr);
            }
            
            for (const i of lecture) {

                const tr = document.createElement("tr");

                let classTypeText = "";

                if(i.classPoint == 3) {
                    classTypeText = '전공';
                }else{
                    classTypeText = '교양';
                }

                const classTd = document.createElement("td");
                classTd.innerText = i.classNo;
                const departmentName = document.createElement("td");
                departmentName.innerText = i.departmentName;
                const classGrade = document.createElement("td");
                classGrade.innerText = i.classGrade+"학년";
                const classTrem = document.createElement("td");
                classTrem.innerText = i.classTerm+"학기";
                const className = document.createElement("td");
                className.innerText = i.className;
                const classType = document.createElement("td");
                classType.innerText = classTypeText;
                const classPoint = document.createElement("td");
                classPoint.innerText = i.classPoint;

                const lectureFL = document.createElement("td");

                let flBtn = document.createElement("button");
                if(i.lectureFL > 0){ // 수강한 과목
                    flBtn.innerText="신청 완료";
                }else{
                    flBtn.innerText="강의 담기";
                    flBtn.setAttribute("onclick","addToCart(this)");
                }
                lectureFL.append(flBtn);

                const classTime = document.createElement("td");
                classTime.innerText = i.classDay+" ("+i.classStart+"교시"+" ~ "+i.classEnd+"교시)";

                const max = document.createElement("td");
                max.innerText = i.classMax;

                const count = document.createElement("td");
                count.innerText = i.lectureCount;

                tr.append(classTd,departmentName,classGrade, 
                    classTrem, className,  classType,  classPoint ,lectureFL, classTime,max,count);
                
                area.append(tr);
            }

        } )
        .catch(err => {console.log(err)})
    })
}

const placeholer = () => {
    const urlParams = new URL(location.href).searchParams;

    const major = urlParams.get('major');
    const grade = urlParams.get('grade');
    const step = urlParams.get('step');
    const type = urlParams.get('type');
    const query = urlParams.get('query');

    if(query != null){
        const majorSelect = document.getElementsByName("major")[0];
        const gradeSelect = document.getElementsByName("grade")[0];
        const stepSelect = document.getElementsByName("step")[0];
        const typeSelect = document.getElementsByName("type")[0];
        const queryInput = document.getElementsByName("query")[0];

        for (const m of majorSelect.options) {
            if(m.value == major){m.selected = true;}
        }

        for (const g of gradeSelect.options) {
            if(g.value == grade){g.selected = true;}
        }

        for (const s of stepSelect.options) {
            if(s.value == step){s.selected = true;}
        }
        for (const t of typeSelect.options) {
            if(t.value == type){t.selected = true;}
        }

        queryInput.value = query;
    }
}

placeholer();


function refresh(){
    const major = document.getElementsByName("major")[0];
        const grade = document.getElementsByName("grade")[0];
        const step = document.getElementsByName("step")[0];
        const type = document.getElementsByName("type")[0];
        

        const majorIndex = major.selectedIndex;
        const majorValue = major.options[majorIndex].value;

        const gradeIndex = grade.selectedIndex;
        const gradeValue = grade.options[gradeIndex].value;

        const stepIndex = step.selectedIndex;
        const stepValue = step.options[stepIndex].value;

        const typeIndex = type.selectedIndex;
        const typeValue = type.options[typeIndex].value;

        const keys = {
            'major' : majorValue,
            'grade' : gradeValue,
            'step'  : stepValue,
            'type'  : typeValue,
            'memberNo' : memberNo
        }

        fetch('/collegian/myClass' , {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(keys)
        })
        .then(res => res.json())
        .then(searchList => {
            
            history.replaceState({}, null, location.pathname); // 주소의 파라미터 값 지움
            
            document.getElementsByName("query")[0].value = ''; // 검색어 삭제

            placeholer();

            const lecture = searchList.lecture;

            const area = document.querySelector(".stu-board > table tbody");

            area.innerHTML = "";
          
            if(lecture.length == 0) {

                const nullTr = document.createElement("tr");

                const nullTd = document.createElement("td");

                nullTd.innerText = "과목이 존재하지 않습니다.";

                nullTd.style.textAlign ="center";
                nullTd.style.fontSize = "17px";

                nullTd.setAttribute("colspan", '11');

                nullTr.append(nullTd);

                area.append(nullTr);
            }
            
            for (const i of lecture) {

                const tr = document.createElement("tr");

                let classTypeText = "";

                if(i.classPoint == 3) {
                    classTypeText = '전공';
                }else{
                    classTypeText = '교양';
                }

                const classTd = document.createElement("td");
                classTd.innerText = i.classNo;
                const departmentName = document.createElement("td");
                departmentName.innerText = i.departmentName;
                const classGrade = document.createElement("td");
                classGrade.innerText = i.classGrade+"학년";
                const classTrem = document.createElement("td");
                classTrem.innerText = i.classTerm+"학기";
                const className = document.createElement("td");
                className.innerText = i.className;
                const classType = document.createElement("td");
                classType.innerText = classTypeText;
                const classPoint = document.createElement("td");
                classPoint.innerText = i.classPoint;

                const lectureFL = document.createElement("td");

                let flBtn = document.createElement("button");
                if(i.lectureFL > 0){ // 수강한 과목
                    flBtn.innerText="신청 완료";
                }else{
                    flBtn.innerText="강의 담기";
                    flBtn.setAttribute("onclick","addToCart(this)");
                }
                lectureFL.append(flBtn);

                const classTime = document.createElement("td");
                classTime.innerText = i.classDay+" ("+i.classStart+"교시"+" ~ "+i.classEnd+"교시)";

                const max = document.createElement("td");
                max.innerText = i.classMax;

                const count = document.createElement("td");
                count.innerText = i.lectureCount;

                tr.append(classTd,departmentName,classGrade, 
                    classTrem, className,  classType,  classPoint ,lectureFL, classTime,max,count);
                
                area.append(tr);
            }

        } )
        .catch(err => {console.log(err)})
}


function pointCount(){
     
    let count = 0;

    let selectClass = document.querySelector(".select-class table"); // 수강 신청 화면
    
    for(let ro = 0; ro < selectClass.rows.length ; ro++){ // 수강 신청 내역의 테이블의 tr 요소들

        if(ro != 0){ // 1번째 행은 제외

            count += parseInt(selectClass.rows[ro].cells[6].innerText);

        }
    }

    const countArea = document.querySelector("#count-area span");

    countArea.innerText = count;

}

window.onload = pointCount();



