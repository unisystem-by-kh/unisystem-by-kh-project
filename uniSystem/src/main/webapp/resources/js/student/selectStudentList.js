const rows = document.querySelectorAll('.select-row'); // :checked

        const allSelect = document.getElementById("allSelect");

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

        function openModal() {
            const modal = document.getElementById("modal");
            modal.style.display = "block";
        }

        function closeModal() {
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
        }

        const stdStatus = document.getElementsByClassName("std-status");
        for (const i of stdStatus) {
            i.addEventListener("click", (e)=>{
                const checkStatus = e.target.childNodes[1];
                
                /* 선택자 확인용 */
                // console.log(checkStatus);
                // console.log(checkStatus.checked);
                // console.log(e.target.childNodes[1]);

                if(!checkStatus.checked){
                    const tr = document.createElement("tr");
                    const td = document.createElement("td");

                    td.innerText = "삶이 피폐해서...";

                    td.setAttribute("colspan", "6");
                    tr.append(td);
                    i.parentElement.after(tr);

                    checkStatus.checked = true;
                }else{
                    i.parentElement.nextSibling.remove();

                    checkStatus.checked = false;
                }
            });
        }