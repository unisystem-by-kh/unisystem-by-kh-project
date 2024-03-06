/* 옵션 변경시 값 변동 추후 수정해야함 과목마다 다르기 때문!! */
const selectElement = document.getElementById('objectClass');
const imgElement = document.querySelector('.objectClass-img img');
const subjectTextElement = document.getElementById('selectedSubject');

// 옵션 변경 시 이벤트 발생
selectElement.addEventListener('change', (event) => {
  const selectedValue = event.target.value;

  // 선택된 값에 따라 이미지와 텍스트 변경
  switch (selectedValue) {
    case '교과목선택':
      imgElement.src = 'https://image.slidesharecdn.com/sns-130503032642-phpapp01/85/sns-1-320.jpg?cb=1668837476';
      subjectTextElement.textContent = '';
      break;
    case '경영학개론':
      imgElement.src = 'https://contents.kyobobook.co.kr/sih/fit-in/400x0/pdt/9791186376003.jpg';
      subjectTextElement.textContent = '경영학개론';
      break;
    case '품질경영관리A':
      imgElement.src = 'https://image.yes24.com/goods/112229971/XL';
      subjectTextElement.textContent = '품질경영관리A';
      break;
    case '통계학개론':
      imgElement.src = 'https://image.yes24.com/goods/110242564/L';
      subjectTextElement.textContent = '통계학개론';
      break;
    case '문화와이해':
      imgElement.src = 'https://press.knou.ac.kr/com/file/getImage.do?fileName=0000000000000002883900001.jpg&filePath=/public/cmdtimages';
      subjectTextElement.textContent = '문화와이해';
      break;
  }
});




// 학기 변경 JS
const semesterButtons = document.querySelectorAll('.semester-button');
const semesterTextElement = document.getElementById('semester-text');

// 학기 버튼 클릭 이벤트
semesterButtons.forEach((button) => {
  button.addEventListener('click', () => {
    const semester = button.id.split('-')[1];

    // 선택된 학기 텍스트 표시
    semesterTextElement.textContent = `학생 성적 등록 (${semester}학기)`;

    // 히든 인풋 값 변경
    const hiddenInput = document.querySelector('.student-grade-insert-info input[type="hidden"]');
    hiddenInput.value = semester;

    // 선택된 버튼 표시
    updateSelectedButton(button);
  });
});

// 선택된 버튼 표시 함수
function updateSelectedButton(selectedButton) {
  // 모든 버튼 'active' 클래스 제거
  semesterButtons.forEach((button) => {
    button.classList.remove('active');
  });

  // 선택된 버튼에 'active' 클래스 추가
  selectedButton.classList.add('active');
}

