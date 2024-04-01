function changeStatus(memberNo, requestType){

    console.log("회원 번호 : "+memberNo);
    console.log("요청 타입 : "+requestType);
    const memberStatus = document.getElementById("student-select");
    
    if(requestType == ''){
        
    }else{
        if(requestType != memberStatus.value){
            console.log("현재 회원의 상태"+memberStatus.value);

            swal({
                title : "요청한 상태랑 다릅니다",
                text : "정말 선택한 상태로 변경하시겠습니까?",
                icon  : "warning",
                buttons : ["취소", "변경"],
                closeOnClickOutside : false
            }).then( ch => {

                fetch("/admin/studentUpdate", {
                    method : "PUT",
                    headers : {'Content-Type': 'application/json'},
                    body : JSON.stringify({
                        memberNo : memberNo,
                        memberStatus : memberStatus
                    })
                })
                .then(resp => resp.text())
                .then(result => {
                    
                })
                .catch(e=>console.log(e))

            } );
        }
    }


}