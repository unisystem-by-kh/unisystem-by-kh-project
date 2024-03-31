/* (()=>{
    fetch("/admin/selectList", {
        method : 'get',
        headers : {'Content-Type' : "application/json"},
        body : 1
    })
    .then(resp => resp.text())
    .then(map=>{
        console.log(map);
    })
    .catch(e=>console.log(e))
})() */

const rows = document.querySelectorAll('.select-row'); // :checked

        const allSelect = document.getElementById("allSelect");

        // 학생 학번 클릭 시 배경색 변경
        allSelect.addEventListener("click", ()=>{
            rows.forEach(row => {
                if(!row.checked){
                    row.checked = true;
                    row.parentElement.parentElement.parentElement.classList.add('highlight');
                }
                
            });
        });

        rows.forEach(row => {
            row.addEventListener("change", ()=>{
                if(row.checked){
                    row.parentElement.parentElement.parentElement.classList.add('highlight');
                }else{
                    row.parentElement.parentElement.parentElement.classList.remove('highlight');
                }
            });
        });

        // 일괄 진급 클릭 시 호출되는 함수
        function openModal() {

            const checkedNo = document.querySelectorAll('.select-row');
            const memberNoArr = [];
            checkedNo.forEach(no => {
                if(no.checked){ // 체크 된 학생들만
                    console.log(no.parentElement.firstElementChild.innerText); // 체크 되어있는 학생의 번호
                    const memberNo = no.parentElement.firstElementChild.innerText;
                    const memberObj = {
                        memberNo : memberNo
                    }
                    memberNoArr.push(memberObj);
                }
            });
            console.log(memberNoArr.length);

            // 진급 승인 시 열리는 confirm
            swal({
                title : memberNoArr.length+"명의 진급을 승인하시겠습니까?",
                text : "진급을 승인하려면 확인 버튼",
                icon : "warning", // 아이콘 모양 
                buttons : ["취소", "승인"],
                dangerMode : true,
            })
            .then((willDelete) => {
                if(willDelete){ // 예 버튼 클릭시
                    console.log("진급 승인");

                    /* 진급 할려는 회원 번호를 가지고 비동기 통신 */
                    fetch("/admin/demotion",{
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(memberNoArr)
                    })
                    .then(resp => resp.text())
                    .then(result => {
                        console.log(result);
                        if(result > 0){
                            swal({
                                title : "진급 승인이 완료되었습니다.",
                                    icon  : "success",
                                    closeOnClickOutside : false
                            }).then(function(){
                                history.go(0);
                            });
                        }
                    })
                    .catch(e => console.log(e))


                }
            });

            /* const modal = document.getElementById("modal");
            modal.style.display = "block"; */
        }

       /*  function closeModal() {
            const modal = document.getElementById("modal");
            modal.style.display = "none";
        }

        function confirmModal() {
            document.querySelector(".modal-body > div").innerText = "N개의 진급이 승인되었습니다.";
            document.querySelector(".modal-footer > button").style = "display:none;";
            // document.querySelector(".confirm-btn").style = "display:block;";

            const confirm = document.querySelector(".approve-btn");
            confirm.innerText = "확인";
            confirm.removeAttribute("onclick");
            confirm.setAttribute("onclick", "closeModal()");
        } */


        // 재적 상태 '신청'일 때 재적 요청 사유 조회
        function statusChange(requestReason, e){
            /* console.log(requestReason);
            console.log(e.target.childNodes[1]);
            console.log(e.target); */

            const checkStatus = e.target.childNodes[1]; // input type='checkbox' 요소
            const status = e.target; // 클릭된 td

            if(!checkStatus.checked){ // hidden인 input이 체크되지 않은 상태일때
                const tr = document.createElement("tr");
                const td = document.createElement("td");

                td.innerText = requestReason; // 매개변수로 받아온 재적 요청 사유를 대입

                td.setAttribute("colspan", "6"); // td를 한줄 크키로 지정
                tr.append(td);
                status.parentElement.after(tr); // 클릭된 td 바로 다음 요소에 추가

                checkStatus.checked = true; // input 체크
            }else{ // input이 체크 해제 되었을 때
                status.parentElement.nextSibling.remove(); // 추가했던 td요소 제거
                checkStatus.checked = false; // 체크 해제
            }
        }