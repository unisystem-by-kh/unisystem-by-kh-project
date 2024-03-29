// 로그인 
const loginFrm = document.getElementById("loginFrm");
const userId = document.getElementById("userId");
const userPw = document.getElementById("userPw");

loginFrm.addEventListener("submit", e => {

    if(userPw.value.trim() == 0){

        swal({
            title : "비밀번호를 입력해주세요.",
            icon  : "error",
            dangerMode : true,
            closeOnClickOutside : false
        }).then(function(){
            userPw.value = "";
            userPw.focus();
        });
        e.preventDefault();
    }

    if(userId.value.trim() == 0){

        swal({
            title : "아이디를 입력해주세요.",
                icon  : "error",
                closeOnClickOutside : false
        }).then(function(){
            userId.value = "";
            userId.focus();
        });
        e.preventDefault();
    }
})

// 아이디 저장 체크
const saveId = document.getElementById("saveId");

saveId.addEventListener("change", () => {

    if(saveId.checked){

        swal({
            title : "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다.",
            text : "개인 PC가 아닌 경우 취소를 눌러주세요.",
            icon : "warning", // 아이콘 모양 
            buttons : ["취소", "저장"],
            dangerMode : true,
        })
        .then((willDelete) => {
            if(willDelete){ // 예 버튼 클릭시
                saveId.checked = true;
            } else {
                saveId.checked = false;
            }
        });

    }
})

// 모달창 영역
const modalId = document.querySelector(".modal.id");
const modalPw = document.querySelector(".modal.pw");
const idModal = document.querySelector(".btn-open-modal-id"); // 아이디 찾기
const pwModal = document.querySelector(".btn-open-modal-pw"); // 비밀번호 찾기
const closeArea = document.querySelectorAll(".close-area");

// 모달창 켜기(아이디 찾기)
idModal.addEventListener("click", () => {
    modalId.style.display="flex";
});

// 모달영역이 아닌 부분 클릭시 모달창 닫기
/* modalId.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal")) {
        modalId.style.display = "none"
    }
}) */

// 모달창 켜기(비밀번호 찾기)
pwModal.addEventListener("click", () => {
    modalPw.style.display="flex";
});

// 모달영역이 아닌 부분 클릭시 모달창 닫기
/* modalPw.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal")) {
        modalPw.style.display = "none"
    }
}) */

// x버튼 클릭시 모달창 닫기
closeArea[0].addEventListener("click", ()=>{
    modalId.style.display ="none";
});
closeArea[1].addEventListener("click", ()=>{
    modalPw.style.display ="none";
});

// 아이디 찾기 버튼 클릭시
const btn1 = document.getElementById("btn1");
const idUserName = document.getElementById("idUserName");
const idUserEmail = document.getElementById("idUserEmail");

if(btn1 != null){
    btn1.addEventListener("click", ()=>{
        if(idUserEmail.value.trim().length == 0){
            swal({
                title : "이메일을 입력해주세요.",
                    icon  : "error",
                    closeOnClickOutside : false
            }).then(function(){
                idUserEmail.focus();
            });
        }
        
        if(idUserName.value.trim().length == 0){
            swal({
                title : "이름을 입력해주세요.",
                    icon  : "error",
                    closeOnClickOutside : false
            }).then(function(){
                idUserName.focus();
            });
        }


        fetch("findMemberId?memberName=" + idUserName.value + "&memberEmail=" + idUserEmail.value)
        .then( resp => resp.text())
        .then( memberNo => {

            if(memberNo.length != 0){
                swal({
                    title : "아이디 찾기 결과",
                    text : `회원님의 학번은 ${memberNo} 입니다.`,
                    icon : "success",
                    closeOnClickOutside : false
                });

            } else {
                swal({
                    title : "일치하는 회원이 없습니다.",
                    text : "이름또는 이메일을 확인해주세요.",
                    icon : "error",
                    closeOnClickOutside : false
                });
            }
        })
        .catch( e => console.log(e) );

    })
}

// 비밀번호 찾기 버튼 클릭시
const btn2 = document.getElementById("btn2");
const pwUserName = document.getElementById("pwUserName");
const pwUserEmail = document.getElementById("pwUserEmail");
const pwUserId = document.getElementById("pwUserId");

if(btn2 != null){
    btn2.addEventListener("click", ()=>{

        if(pwUserId.value.trim().length == 0){
            swal({
                title : "아이디를 입력해주세요.",
                    icon  : "error",
                    closeOnClickOutside : false
            }).then(function(){
                pwUserId.focus();
            });
        }

        if(pwUserEmail.value.trim().length == 0){
            swal({
                title : "이메일을 입력해주세요.",
                    icon  : "error",
                    closeOnClickOutside : false
            }).then(function(){
                pwUserEmail.focus();
            });
        }
        
        if(pwUserName.value.trim().length == 0){
            swal({
                title : "이름을 입력해주세요.",
                    icon  : "error",
                    closeOnClickOutside : false
            }).then(function(){
                pwUserName.focus();
            });
        }

        const data = {"memberNo" : pwUserId.value,
                      "memberName" : pwUserName.value,
                      "memberEmail" : pwUserEmail.value};
    
        fetch("/findMemberPw",{
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then( resp => resp.text())
        .then( result => {

            if(result.length != 0){
                
                sendEmail(result, pwUserName);

            } else {
                swal({
                    title : "일치하는 회원이 없습니다.",
                    text : "학번,이름또는 이메일을 확인해주세요.",
                    icon : "error",
                    closeOnClickOutside : false
                });
            }
        })
        .catch( e=>{console.log(e);})

    })

    function sendEmail(email, memberName) {

        showLoadingSpinner(); // 로딩창 시작
        console.log(memberName);
        fetch("/sendEmail/findPw?email=" + email + "&memberName="+memberName.value)
        .then(resp => resp.text())
        .then( result => {

            if(result > 0){
                swal({
                    title : "비밀번호 찾기",
                    text : `${email} 로 임시비밀번호 발급해드렸습니다.`,
                    icon : "success",
                    closeOnClickOutside : false
                });

            } else{
                swal({
                    title : "인증 실패",
                    text : "학번, 이름, 이메일을 확인해주세요.",
                    icon : "warning",
                    closeOnClickOutside : false
                });
            }
            
        })
        .catch(e => console.log(e))
        .finally(() => {
            hideLoadingSpinner(); // 로딩창 끝
        })

    }

}

function showLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'block';
}

function hideLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'none';
}