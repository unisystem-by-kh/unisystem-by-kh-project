/* 학기 버튼 마다 학기 숫자 변경 */
const semesterButtons = document.querySelectorAll('.title-area button');
const semesterSpan = document.querySelector('.title-area span');

// 처음 1학기 선택
semesterButtons[0].classList.add('active');

semesterButtons.forEach((button) => {
    button.addEventListener('click', () => {
        const semester = button.textContent;
        semesterSpan.textContent = `(${semester})`;

        // 클릭된 버튼 활성화
        const activeButton = document.querySelector('.title-area .active');
        if (activeButton) {
            activeButton.classList.remove('active');
        }
        button.classList.add('active');
    });
});

/* 페이지네이션 클릭 효과 */
const paginations = document.getElementById('paginations');

paginations.addEventListener('click', (e) => {
    const clickedElement = e.target;

    // 기존 활성화된 요소 비활성화
    const activeElement = paginations.querySelector('.active');
    if (activeElement) {
        activeElement.classList.remove('active');
    }

    // 클릭된 요소 활성화
    clickedElement.classList.add('active');
});


/* 교과목 선택시 이름 변경 */
const objectClassSelect = document.getElementById('objectClass');
const objectClassName = document.querySelector('.objectClass-name div');

objectClassSelect.addEventListener('change', () => {
    const selectedValue = objectClassSelect.value;

    // 선택된 값에 따른 이름 설정
    switch (selectedValue) {
        case '경영학개론':
            objectClassName.textContent = '경영학개론';
            break;
        case '심리학개론':
            objectClassName.textContent = '심리학개론';
            break;
        case '통계학개론':
            objectClassName.textContent = '통계학개론';
            break;
        default:
            objectClassName.textContent = '과목선택';
    }
});



/* 각 버튼(수정완료 , 수정취소 , 학생조회 , 돌아가기) 효과 */
// 필요 버튼 변수 선언
const buttonsArea = document.getElementsByClassName('buttons-area')[0];
const updateOk = document.getElementById('update-ok');
const updateNo = document.getElementById('update-no');
const studentSelect = document.getElementById('student-select');
const backBtn = document.getElementById('back-btn');
const studentGrade = document.getElementById('studentGrade'); // 학생점수

// 버튼 영역이 있을 경우 효과 적용
if(buttonsArea != null){

    // 수정 취소 할 경우 모든 input값 제거
    updateNo.addEventListener('click', (e)=>{
        if(confirm('정말 취소하시겠습니까?\n[ 입력되어있는 학생 성적을 지웁니다. ]')){
            studentGrade.value = '';
        }else{
            return;
        }
    })

    // 이전페이지로 버튼 눌렀을 경우
    backBtn.addEventListener('click', () => {
        // 이전 페이지로 이동
        history.back();
    });

}