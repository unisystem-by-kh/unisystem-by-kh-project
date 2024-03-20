console.log("수강신청 js 연결")

const addToCart = (th) => {
    console.log(th.parentNode.parentNode.cells)

    let row = th.parentNode.parentNode.cells;

    const selectClass = document.querySelector(".select-class table");

    let tr = document.createElement('tr');

    for (let i =0; i < row.length; i++) { // 클릭한 행의 td 요소들
        
        for(let ro of selectClass.rows){ // 수강 신청 내역의 테이블의 tr 요소들

            for(let cell of ro.cells){ // 각 tr 요소의 td 요소들

                if(row[4].innerHTML == cell.innerHTML){
                    alert("이미 담겨 있는 과목 입니다.")
                    return;
                }
            }

        }
        
        let td = document.createElement('td');

        if( i == 7 ){ // 강의 담기 버튼 따로 생성
            
            const cancleBtn = document.createElement('button');
            cancleBtn.innerText = '취소';
            cancleBtn.setAttribute("onclick", "deleteClass(this)" );
            
            td.append(cancleBtn)
            
        }else{
            td.innerHTML = row[i].innerHTML;
        }

        tr.append(td);
    }

    selectClass.append(tr);
}


const deleteClass = th => {

    const row = th.parentNode.parentNode;

    row.remove();
}
