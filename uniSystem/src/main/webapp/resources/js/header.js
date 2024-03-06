// 3번째 네비게이션 효과
// 필요변수 선언
const homeNav = document.getElementsByClassName('navigation3-home')[0];
const home = document.getElementById('home');
const studentNav = document.getElementsByClassName('navigation3-student')[0];
const student = document.getElementById('student');
const subjectNav = document.getElementsByClassName('navigation3-subject')[0];
const subject = document.getElementById('subject');
const examNav = document.getElementsByClassName('navigation3-exam')[0];
const exam = document.getElementById('exam');
const professorNav = document.getElementsByClassName('navigation3-professor')[0];
const professor = document.getElementById('professor');

// 홈에 올렸을 경우
home.addEventListener("mouseover" , ()=>{
    studentNav.style.display = "none";
    subjectNav.style.display = "none";
    examNav.style.display = "none";
    professorNav.style.display = "none";
    
    homeNav.style.display = "flex";
    setTimeout(() => {
        homeNav.style.opacity = "1";

        studentNav.style.opacity = "0";
        subjectNav.style.opacity = "0";
        examNav.style.opacity = "0";
        professorNav.style.opacity = "0";
    }, 30);
});


// 학생에 올렸을 경우
if(student != null){
    student.addEventListener("mouseover" , ()=>{
        homeNav.style.display = "none";
        subjectNav.style.display = "none";
        examNav.style.display = "none";
        professorNav.style.display = "none";
        
        studentNav.style.display = "flex";
        setTimeout(() => {
            studentNav.style.opacity = "1";
            
            homeNav.style.opacity = "0";
            subjectNav.style.opacity = "0";
            examNav.style.opacity = "0";
            professorNav.style.opacity = "0";
        }, 30);
    });
}

// 교과목에 올렸을 경우
if(subject != null){
    subject.addEventListener("mouseover" , ()=>{
        homeNav.style.display = "none";
        studentNav.style.display = "none";
        examNav.style.display = "none";
        professorNav.style.display = "none";
        
        subjectNav.style.display = "flex";
        setTimeout(() => {
            subjectNav.style.opacity = "1";
            
            homeNav.style.opacity = "0";
            studentNav.style.opacity = "0";
            examNav.style.opacity = "0";
            professorNav.style.opacity = "0";
        }, 30);
    });
}

if(exam != null){
    // 시험에 올렸을 경우
    exam.addEventListener("mouseover" , ()=>{
        homeNav.style.display = "none";
        studentNav.style.display = "none";
        subjectNav.style.display = "none";
        professorNav.style.display = "none";
        
        examNav.style.display = "flex";
        setTimeout(() => {
            examNav.style.opacity = "1";
            
            subjectNav.style.opacity = "0";
            homeNav.style.opacity = "0";
            studentNav.style.opacity = "0";
            professorNav.style.opacity = "0";
        }, 30);
    });
}

if(professor != null){
    // 교수에 올렸을 경우
    professor.addEventListener("mouseover" , ()=>{
        homeNav.style.display = "none";
        studentNav.style.display = "none";
        subjectNav.style.display = "none";
        examNav.style.display = "none";
        
        professorNav.style.display = "flex";
        setTimeout(() => {
            professorNav.style.opacity = "1";
            
            subjectNav.style.opacity = "0";
            examNav.style.opacity = "0";
            homeNav.style.opacity = "0";
            studentNav.style.opacity = "0";
        }, 30);
    });
}



// ---------------------------------------------------------------------------------------------
// 간편메뉴 효과                      였던것...
// const navigation1Professor = document.getElementsByClassName("navigation1-row2-professor")[0];
// const quickMenuEasy = document.getElementById("quickMenu-easy");
// const quickMenuMyPage = document.getElementById("quickMenu-myPage");
// const quickMenuPwChange = document.getElementById("quickMenu-pwChange");
// const quickMenuClose = document.getElementById("quickMenu-close");

// // 교수로 로그인 되었을 때
// if(navigation1Professor != null){

//     // 간편메뉴를 클릭했을 때
//     quickMenuEasy.addEventListener("click" , ()=>{
//         // 각 메뉴 노출
//         quickMenuEasy.style.display = 'none';
//         quickMenuMyPage.style.display = 'flex';
//         quickMenuPwChange.style.display = 'flex';
//         quickMenuClose.style.display = 'flex';
//         otherW.innerText = '';
//     })

//     // 닫기를 클릭했을 때
//     quickMenuClose.addEventListener("click" , ()=>{
//         // 메뉴 닫고 간편메뉴만 노출
//         quickMenuEasy.style.display = 'flex';
//         quickMenuMyPage.style.display = 'none';
//         quickMenuPwChange.style.display = 'none';
//         quickMenuClose.style.display = 'none';
//         otherW.innerText = '기타';
//         otherW.setAttribute('href' , '#');
//         otherW.setAttribute('id' , 'otherW');
//     })

// }



