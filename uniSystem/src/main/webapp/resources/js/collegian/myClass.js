console.log("수강신청 js 연결")

const addToCart = (th) => {
    console.log(th.parentNode.parentNode.cells)

    let row = th.parentNode.parentNode.cells;

    const selectClass = document.querySelector(".select-class table");

    let tr = document.createElement('tr');

    for (let i =0; i < row.length; i++) { // 클릭한 행의 td 요소들
        
        for(let ro of selectClass.rows){ // 수강 신청 내역의 테이블의 tr 요소들

            for(let cell of ro.cells){ // 각 tr 요소의 td 요소들

                if(row[4].innerText == ro.cells[4].innerText){
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
}


const deleteClass = th => {

    const row = th.parentNode.parentNode; // 선택한 tr 반환

    row.remove(); // 요소 삭제
}

const deleteMyClass = th => {

    const row = th.parentNode.parentNode; // 선택한 tr 반환

    let classNo = row.cells[0]; // tr의 첫 번째 td 반환 == 과목 번호

}

const updateMyClass = th => {

    const row = th.parentNode.parentNode; // 선택한 tr 반환

    let classNo = row.cells[0].innerText; // tr의 첫 번째 td 반환 == 과목 번호

    const bodyData = { 'mem' : loginMember,'classes' : classNo};

    console.log(bodyData);

}





// 수강 신청 버튼
document.getElementById("class-btn").addEventListener("click", e => {
    let classes = "";

    // 수강 신청 화면
    const selectClass = document.querySelector(".select-class table");

    for(let ro = 0; ro < selectClass.rows.length; ro++){ // 수강 신청 내역의 테이블의 tr 요소들

        if(ro != 0){ // 1번째 행은 제외

            if(selectClass.rows[ro].cells[7].innerText != '신청 취소'){
                
                let classNo = selectClass.rows[ro].cells[0].innerText; // 수강 신청 과목번호 담음
        
                classes +=classNo.trim()+"/";
            }
        }
    }

    if(classes != ""){ // 담긴 과목 번호가 있을 경우
        
        fetch('/collegian/insertLecture',{
    
            method: "POST",
            headers: {
                "Content-Type": "application/text",
            },
            body: classes
        })
        .then(res => res.text())
        .then(result => {
    
            if(result>0){
                alert(result + "개의 수강 과목이 신청되었습니다.");

                // 화면 다시 만들자....

            }else{
                alert("수강 신청 실패");
            }
    
        })
        .catch(err => {console.log(err)})
    }else{
        alert("신청할 과목이 존재하지 않습니다.")
    }

});
