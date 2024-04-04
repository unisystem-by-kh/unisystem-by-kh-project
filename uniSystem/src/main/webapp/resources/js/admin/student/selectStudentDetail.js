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

                if(ch){ // 변경 버튼 클릭 시
                    console.log(requestType);
                    studentUpdate(memberNo, memberStatus.value, requestType);
                }

            } );
        }else{
            studentUpdate(memberNo, memberStatus.value, requestType);
        }
    }

}

function studentUpdate(memberNo, memberStatus, requestType){
    fetch("/admin/studentUpdate", {
        method : "PUT",
        headers : {'Content-Type': 'application/json'},
        body : JSON.stringify({
            memberNo : memberNo,
            memberStatus : memberStatus,
            requestType : requestType
        })
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            swal({
                title : "재적 변경이 완료되었습니다.",
                icon  : "success",
                closeOnClickOutside : false
            }).then(function(){
                history.go(0);
            });
        }else{
            swal({
                title : "변경 실패",
                icon  : "error",
                closeOnClickOutside : false
            }).then(function(){
                history.go(0);
            });
        }
    })
    .catch(e=>console.log(e))

}
