// 전체 네비게이션 영역
const category = document.getElementsByClassName('navigation3')[0];

// 소식 버튼(공통)
const news = document.getElementById('home');

// 학생
// 수강 버튼
const lectureBtn = document.getElementById('lecture');
// 증명서 버튼
const certificateBtn = document.getElementById('certificate');
// 내정보 버튼
const myinfoBtn = document.getElementById('myinfo');
// 등록금 버튼
const tuitionBtn = document.getElementById('tuition');

// 소식 버튼 하위메뉴
const newsList = document.getElementById('newsList');
// 수강 버튼 하위메뉴
const lecture = document.getElementById('lectureList');
// 증명서 버튼 하위메뉴
const certificate = document.getElementById('certificateList');
// 내정보 버튼 하위메뉴
const myinfo = document.getElementById('myinfoList');

// 교수
// 학생 버튼
const studentBtn = document.getElementById('studentBtn');
// 과제 버튼
const taskBtn = document.getElementById('taskBtn');
// 교수 버튼
const professorBtn = document.getElementById('professorBtn');

// 학생 버튼 하위 메뉴
const studentList = document.getElementById('studentList');
// 과제 버튼 하위 메뉴
const taskList = document.getElementById('taskList');
// 교수 버튼 하위 메뉴
const professorList = document.getElementById('professorList');

// 교직원
// 조회 버튼
const selectBtn = document.getElementById('selectBtn');
// 교과목 버튼
const objectBtn = document.getElementById('objectBtn');
// 학번/교번 발급 버튼
const memberBtn = document.getElementById('memberBtn');

// 학생 버튼 하위 메뉴
const selectList = document.getElementById('selectList');
// 과제 버튼 하위 메뉴
const objectList = document.getElementById('objectList');

if(news != null){
    // 소식 버튼에 마우스를 올렸을 경우
    news.addEventListener('mouseover' , ()=>{
        // 먼저 하위 메뉴 영역 띄워 줘야함
        category.style.display = 'flex';
        newsList.style.display = 'flex';
        
        // 소식 하위 메뉴 빼고 나머지 하위 메뉴를 다 없애줘야함
        if(lectureBtn != null){
            lecture.style.display = 'none';
            certificate.style.display = 'none';
            myinfo.style.display = 'none';
        }

        if(studentBtn != null){
            studentList.style.display = 'none';
            taskList.style.display = 'none';
            professorList.style.display = 'none';
        }
        
        if(selectBtn != null){
            selectList.style.display = 'none';
            objectList.style.display = 'none';
        }
    })
}

if(lectureBtn != null){
    // 수강 버튼 올렸을 경우
    lectureBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        lecture.style.display = 'flex';
    
        newsList.style.display = 'none';
        certificate.style.display = 'none';
        myinfo.style.display = 'none';
    })
    
    // 증명서 버튼 올렸을 경우
    certificateBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        certificate.style.display = 'flex';
    
        newsList.style.display = 'none';
        myinfo.style.display = 'none';
        lecture.style.display = 'none';
    })
    
    // 내정보 버튼 올렸을 경우
    myinfoBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        myinfo.style.display = 'flex';
        
        certificate.style.display = 'none';
        newsList.style.display = 'none';
        lecture.style.display = 'none';
    })

    // 등록금 버튼 올렸을 경우
    tuitionBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'none';
    })
}

if(studentBtn != null){
    studentBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        studentList.style.display = 'flex';
    
        taskList.style.display = 'none';
        professorList.style.display = 'none';
        newsList.style.display = 'none';
    })
    taskBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        taskList.style.display = 'flex';
    
        studentList.style.display = 'none';
        professorList.style.display = 'none';
        newsList.style.display = 'none';
    })
    professorBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        professorList.style.display = 'flex';
    
        studentList.style.display = 'none';
        taskList.style.display = 'none';
        newsList.style.display = 'none';
    })
}

if(selectBtn != null){
    selectBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        selectList.style.display = 'flex';
    
        objectList.style.display = 'none';
        newsList.style.display = 'none';
    })
    objectBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'flex';
        objectList.style.display = 'flex';
    
        selectList.style.display = 'none';
        newsList.style.display = 'none';
    })
    memberBtn.addEventListener('mouseover' , ()=>{
        category.style.display = 'none';
    })
}



// 하위 메뉴 영역에서 때면 사라져 버림(공통)
category.addEventListener('mouseleave' , ()=>{
    category.style.display = 'none';
})

