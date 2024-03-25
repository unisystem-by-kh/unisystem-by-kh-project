const checkObj = {
    "memberCk" : false,
    "memberNo" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberName" : false,
    "memberEmail" : false,
    "memberPhone" : false,
    "memberGen" : false,
    "authKey" : false
};


// 번호 유효성 검사
const memberNo = document.getElementById("memberNo");
const noMessage = document.getElementById("noMessage");
const noBtn = document.getElementById("memberCk");
const numberMessage = document.getElementById("numberMessage");

memberNo.addEventListener("input" , () => {
    // 입력된 번호가 없을 경우
    if(memberNo.value.trim().length == 0){
        memberNo.value = '';
        noMessage.innerText = '번호를 입력해주세요.';
        
        noMessage.classList.remove("confirm" , "error");

        checkObj.memberNo = false;
        return;
    }

    const regEx  = /^(01|02|03)-\d{2}\d{5}$/;

    if(regEx.test(memberNo.value)){ // 유효한 경우
        noMessage.classList.add("confirm");
        noMessage.classList.remove("error");
        noMessage.innerText = '유효한 번호입니다.';
        checkObj.memberNo = true; // 유효 O

    } else { // 유효하지 않은 경우
        noMessage.classList.add("error");
        noMessage.classList.remove("confirm");
        noMessage.innerText = '유효하지 않은 번호입니다.';
        checkObj.memberNo = false; // 유효 X
    }

})

noBtn.addEventListener("click" , (e) => {

    fetch("/selectInfo?number=" + memberNo.value)
    .then(response => response.text()) // 응답객체 -> 파싱(parsing, 데이터 형태 변환)
    .then(result => {
        if(result != ''){
            numberMessage.classList.add("confirm");
            numberMessage.classList.remove("error");
            numberMessage.innerHTML = '회원님의 소속 학과는 "' + result + '" 입니다.';
            checkObj.memberCk = true;
        }else{
            numberMessage.classList.add("error");
            numberMessage.classList.remove("confirm");
            numberMessage.innerText = '일치하지 않은 회원 번호 입니다.';
            checkObj.memberCk = false;
        }

    })
    .catch(err => {console.log(err)})
    
})




// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

// 이메일이 입력 될 때 마다
memberEmail.addEventListener("input" , () => {

    // 입력된 이메일이 없을 경우
    if(memberEmail.value.trim().length == 0){
        memberEmail.value = '';
        emailMessage.innerText = '메일을 받을 수 있는 이메일을 입력해주세요.';
        
        // confrim, error 클래스 삭제해서 검정 글씨로 만들기
        emailMessage.classList.remove("confirm" , "error");

        checkObj.memberEmail = false; // 빈칸 == 유효 X

        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{6,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(memberEmail.value)){ // 유효한 경우

        fetch("/dupCheck/email?email=" + memberEmail.value)
        .then(response => response.text()) // 응답객체 -> 파싱(parsing, 데이터 형태 변환)
        .then(count => {
            console.log(count);
            if(count == 0){
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");
                emailMessage.innerText = '사용 가능한 이메일 입니다.';
                checkObj.memberEmail = true;
            }else{
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");
                emailMessage.innerText = '이미 사용중인 이메일 입니다.';
                checkObj.memberEmail = false;
            }
        })
        .catch(err => {console.log(err)}) // 예외 처리

    }else{ // 유효하지 않은 경우
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confrim");
        emailMessage.innerText = '이메일 형식이 유효하지 않습니다.';
        checkObj.memberEmail = false; // 유효 X
    }

})


// 인증번호 발송
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;
// 인증 확인
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

// 인증번호를 발송한 이메일 저장
let tempEmail;
let resultAuthKey;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    // 인증 번호 발송 할 때마다 다시 타이머를 멈춤
    clearInterval(authTimer);

    checkObj.authKey = false;

    if(checkObj.memberEmail){ // 중복이 아닌 이메일인 경우

        /* fetch() API 방식 ajax */
        fetch("/sendEmail/signUp?email="+memberEmail.value)
        .then(resp => resp.json())
        .then(result => {

            resultAuthKey = result.authKey;
            console.log(result.authKey);

            if(result != null){
                tempEmail = memberEmail.value;

            }else{
                alert("인증번호 발송 실패");
            }

            checkAuthKeyBtn.addEventListener('click' , (e) => {
                console.log(resultAuthKey);
                console.log(authKey.value);

                if(resultAuthKey == authKey.value){
                    alert('인증번호가 일치합니다.');
                    clearInterval(authTimer);
                    authKeyMessage.innerText = "인증되었습니다.";
                    authKeyMessage.classList.add("confirm");
                    checkObj.authKey = true;

                    authKey.disabled = true;
                    checkAuthKeyBtn.disabled = true;
                }else{
                    alert('인증번호가 일치하지 않습니다.\n다시 인증해주세요.');
                    checkObj.authKey = false;
                }
            })

        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });

        alert("인증번호가 발송 되었습니다.");

        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");

        authTimer = window.setInterval(()=>{

            authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);
           
            if(authMin == 0 && authSec == 0){
                checkObj.authKey = false;
                clearInterval(authTimer);
                return;
            }

            if(authSec == 0){
                authSec = 60;
                authMin--;
            }

            authSec--; // 1초 감소

        }, 1000)

    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        memberEmail.focus();
    }

});


// 비밀번호/비밀번호 확인 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");
const pwMessageConfirm = document.getElementById("pwMessageConfirm");

memberPw.addEventListener("input" , () => {

    if(memberPw.value.trim().length == 0){
        memberPw.value = '';
        pwMessage.innerText = '영어,숫자,특수문자(!,@,#,-,_) 8~20글자 사이로 입력해주세요.';
        
        pwMessage.classList.remove("confirm" , "error");

        checkObj.memberPw = false;

        return;
    }

    const regEx =  /^[A-Za-z\d\!\@\#\-\_]{8,20}$/;

    if(regEx.test(memberPw.value)){
        checkObj.memberPw = true; 

        if(memberPwConfirm.value.trim().length == 0){
            
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            pwMessage.innerText = '유효한 형식 입니다.';

        }else{
            if(memberPw.value == memberPwConfirm.value){
                pwMessageConfirm.classList.add("confirm");
                pwMessageConfirm.classList.remove("error");
                pwMessageConfirm.innerText = '비밀번호가 일치합니다.';
                checkObj.memberPwConfirm = true;
            }else{ 
                pwMessageConfirm.classList.add("error");
                pwMessageConfirm.classList.remove("confrim");
                pwMessageConfirm.innerText = '비밀번호가 일치하지 않습니다.';
                checkObj.memberPwConfirm = false;
            }

        }

    }else{ 
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confrim");
        pwMessage.innerText = '비밀번호 형식이 유효하지 않습니다.';
        checkObj.memberPw = false;
        checkObj.memberPwConfirm = false; 
    }
})


// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener("input" , () => {
    if(checkObj.memberPw){ 

        if(memberPw.value == memberPwConfirm.value){
            pwMessageConfirm.classList.add("confirm");
            pwMessageConfirm.classList.remove("error");
            pwMessageConfirm.innerText = '비밀번호가 일치합니다.';
            checkObj.memberPwConfirm = true;
        }else{
            pwMessageConfirm.classList.add("error");
            pwMessageConfirm.classList.remove("confrim");
            pwMessageConfirm.innerText = '비밀번호가 일치하지 않습니다.';
            checkObj.memberPwConfirm = false; 
        }

    }else{ 
        checkObj.memberPwConfirm = false;
    }
})


// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const nameMessage = document.getElementById("nameMessage");

memberName.addEventListener("input" , () => {
    // 입력된 이름이 없을 경우
    if(memberName.value.trim().length == 0){
        memberName.value = '';
        nameMessage.innerText = '이름을 입력해주세요.';
        
        nameMessage.classList.remove("confirm" , "error");

        checkObj.memberName = false; // 빈칸 == 유효 X

        return;
    }

    const regEx = /^[가-힣]{2,5}$/; // 한글로 2~5자리

    if(regEx.test(memberName.value)){ // 유효한 경우
        nameMessage.classList.add("confirm");
        nameMessage.classList.remove("error");
        nameMessage.innerText = '유효한 이름입니다.';
        checkObj.memberName = true; // 유효 O
    } else { // 유효하지 않은 경우
        nameMessage.classList.add("error");
        nameMessage.classList.remove("confirm");
        nameMessage.innerText = '유효하지 않은 이름입니다. (한글 2~5자리만 입력 가능합니다.)';
        checkObj.memberName = false; // 유효 X
    }
})


// 전화번호 유효성 검사
const memberPhone = document.getElementById("memberPhone");
const phoneMessage = document.getElementById("phoneMessage");
memberPhone.addEventListener("input" , ()=>{

    if(memberPhone.value.trim().length == 0){
        memberPhone.value = '';
        phoneMessage.innerText = '전화번호를 입력해주세요.(- 제외)';
        
        phoneMessage.classList.remove("confirm" , "error");

        checkObj.memberPhone = false; // 빈칸 == 유효 X

        return;
    }

    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regEx.test(memberPhone.value)){
        phoneMessage.classList.add("confirm");
        phoneMessage.classList.remove("error");
        phoneMessage.innerText = '유효한 형식 입니다.';
        checkObj.memberPhone = true;
    }else{
        phoneMessage.classList.add("error");
        phoneMessage.classList.remove("confrim");
        phoneMessage.innerText = '전화번호 형식이 유효하지 않습니다.';
        checkObj.memberPhone = false;
    }

})


// 성별 유효성 검사
const memberGenM = document.getElementById("memberGenM");
const memberGenF = document.getElementById("memberGenF");
const genMessage = document.getElementById("genMessage");

// 성별이 선택되었는지 확인
function isGenderSelected() {
    return memberGenM.checked || memberGenF.checked;
}

// 성별 유효성 검사 및 메시지 표시
function validateGender() {
    if (!isGenderSelected()) {
        genMessage.classList.add("error");
        genMessage.classList.remove("confirm");
        genMessage.innerText = '성별을 선택해 주세요.';
        checkObj.memberGen = false; // 유효 X
    } else {
        genMessage.innerText = '성별이 선택되었습니다.';
        genMessage.classList.add("confirm");
        genMessage.classList.remove("error");
        checkObj.memberGen = true; // 유효 O
    }
}

// 성별이 선택되지 않았을 때 메시지 표시
memberGenM.addEventListener("change", validateGender);
memberGenF.addEventListener("change", validateGender);


// 회원 가입 form 태그가 제출 되었을 때
const signUpFrm = document.getElementById("signUpFrm");
signUpFrm.addEventListener("submit" , e => {

    // 성별을 체크하지 않은 경우(성별은 별개)
    if (!isGenderSelected()) {
        alert("성별을 선택해 주세요.");
        e.preventDefault();
        return;
    }

    validateGender();

    for(let key in checkObj){
        if(!checkObj[key]){
            switch(key){
                case "memberCk": alert("학과 확인을 해주세요."); break;
                case "memberNo": alert("번호 유효하지 않습니다.\n다시 입력 해주세요."); break;
                case "memberEmail": alert("이메일이 유효하지 않습니다."); break;
                case "authKey" : alert("인증번호 확인 필수"); break;
                case "memberPw": alert("비밀번호가 유효하지 않습니다."); break;
                case "memberPwConfirm": alert("비밀번호확인이 일치하지 않습니다."); break;
                case "memberName": alert("이름이 유효하지 않습니다."); break;
                case "memberPhone": alert("전화번호가 유효하지 않습니다."); break;
                case "memberGen" : alert("성별을 체크해 주세요."); break;
            }

            document.getElementById(key).focus();

            e.preventDefault();

            return;
        }
    }


})




