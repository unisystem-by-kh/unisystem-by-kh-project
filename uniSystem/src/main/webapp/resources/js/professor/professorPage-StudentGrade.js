// 커서모양 변경
const element = document.querySelector(".grade-area");

element.addEventListener("mouseenter", function() {
  element.style.cursor = "url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHdpZHRoPSIyMHB4IiBoZWlnaHQ9IjIwcHgiIHZpZXdQb3J0PSIxMCAxMCAyMCAyMCI+PHBhdGggZD0ibTMgMTJjMy4zMTQgMCA2LjY4Ni0xLjA0MyA5LjA5NC0yLjgxNmwtMS40MTQtMS40MTQgLTUuNjE0IDUuNjE0eiIgZmlsbD0iIzAwMCI+PC9wYXRoPjwvc3ZnPg=='), auto";
});

element.addEventListener("mouseleave", function() {
  element.style.cursor = "default";
});


// 학생 목록 조회
function selectMemberList(){

  fetch("/professor/selectMemberList")
    .then(response => response.json())
    .then(mList => {
        console.log(mList);

        const gradeArea = document.getElementsByClassName('grade-area')[0];
        gradeArea.innerHTML = ''

        const gradeTitle = document.createElement('div');
        gradeTitle.classList.add('grade-title');

        const number = document.createElement('div');
        number.innerHTML = '학번';
        const name = document.createElement('div');
        name.innerHTML = '이름';
        const grade = document.createElement('div');
        grade.innerHTML = '학년';
        const term = document.createElement('div');
        term.innerHTML = '학기';
        const depart = document.createElement('div');
        depart.innerHTML = '학과';
        const classes = document.createElement('div');
        classes.innerHTML = '과목';
        const point = document.createElement('div');
        point.innerHTML = '성적';
        gradeTitle.append(number, name, grade, grade, term, depart, classes, point);

        const content = document.createElement('div');
        content.classList.add('content');

        for(let list of mList){

            const gradeContent = document.createElement('div'); // 학생이 갖는 내용
            gradeContent.classList.add('grade-content');

            const sNumber = document.createElement('div');
            sNumber.innerHTML = list.memberNo;
            sNumber.classList.add('sNumber'); // 학번을 식별할 클래스 추가
            const sName = document.createElement('div');
            sName.innerHTML = list.memberName;
            const sGrade = document.createElement('div');
            sGrade.innerHTML = list.lectureGrade;
            const sTerm = document.createElement('div');
            sTerm.innerHTML = list.lectureTerm;
            const sDepart = document.createElement('div');
            sDepart.innerHTML = list.departmentName;
            const sClass = document.createElement('div');
            sClass.innerHTML = list.classNm;
            const sClassNo = document.createElement('div');
            sClassNo.innerHTML = list.classNo;
            sClassNo.style.display = 'none';

            const sPoint = document.createElement('div');
            const sPointInput = document.createElement('input');
            sPointInput.setAttribute('placeholder' , '성적 입력');
            sPointInput.setAttribute('value' , list.lecturePoint);
            if(sPointInput.value == '0'){
              sPointInput.setAttribute('value' , '')
            }
            sPoint.append(sPointInput);
            
            gradeContent.append(sNumber, sName, sGrade, sTerm, sDepart, sClass, sPoint, sClassNo);

            content.append(gradeContent);

          }
          
          gradeArea.append(gradeTitle, content);
          

    })
    .catch(err => console.log(err));

}


// 검색창 입력 시 조건에 맞는 학생 목록 조회
const searchFrm = document.getElementById('searchFrm');
searchFrm.addEventListener('submit' , (e)=>{
  e.preventDefault();
  searchMemberList();
})
// 특정 조건 - 검색에 따른 학생 목록 조회 ajax
function searchMemberList(){

  const query = document.getElementById('query').value;
  const key = document.getElementById('search').value;

  fetch(`/professor/searchMemberList?key=${key}&query=${query}`)

    .then(response => response.json())
    .then(sList => {
        console.log(sList);
        console.log(query);

        const gradeArea = document.getElementsByClassName('grade-area')[0];
        gradeArea.innerHTML = ''

        const gradeTitle = document.createElement('div');
        gradeTitle.classList.add('grade-title');

        const number = document.createElement('div');
        number.innerHTML = '학번';
        const name = document.createElement('div');
        name.innerHTML = '이름';
        const grade = document.createElement('div');
        grade.innerHTML = '학년';
        const term = document.createElement('div');
        term.innerHTML = '학기';
        const depart = document.createElement('div');
        depart.innerHTML = '학과';
        const classes = document.createElement('div');
        classes.innerHTML = '과목';
        const point = document.createElement('div');
        point.innerHTML = '성적';
        gradeTitle.append(number, name, grade, grade, term, depart, classes, point);

        const content = document.createElement('div');
        content.classList.add('content');

        for(let list of sList){

            const gradeContent = document.createElement('div'); // 학생이 갖는 내용
            gradeContent.classList.add('grade-content');

            const sNumber = document.createElement('div');
            sNumber.innerHTML = list.memberNo;
            sNumber.classList.add('sNumber'); // 학번을 식별할 클래스 추가
            const sName = document.createElement('div');
            sName.innerHTML = list.memberName;
            const sGrade = document.createElement('div');
            sGrade.innerHTML = list.lectureGrade;
            const sTerm = document.createElement('div');
            sTerm.innerHTML = list.lectureTerm;
            const sDepart = document.createElement('div');
            sDepart.innerHTML = list.departmentName;
            const sClass = document.createElement('div');
            sClass.innerHTML = list.classNm;
            const sClassNo = document.createElement('div');
            sClassNo.innerHTML = list.classNo;
            sClassNo.style.display = 'none';

            const sPoint = document.createElement('div');
            const sPointInput = document.createElement('input');
            sPointInput.setAttribute('placeholder' , '성적입력');
            sPointInput.setAttribute('value' , list.lecturePoint);
            if(sPointInput.value == '0'){
              sPointInput.setAttribute('value' , '')
            }
            sPoint.append(sPointInput);
            
            gradeContent.append(sNumber, sName, sGrade, sTerm, sDepart, sClass, sPoint, sClassNo);

            content.append(gradeContent);
          }
          
          gradeArea.append(gradeTitle, content);

    })
    .catch(err => console.log(err));

}


// 학년, 학기, 학과, 과목 조건에 따른 검색
document.getElementById('searchBtn').addEventListener('click', () => {
  searchMember();
});

function searchMember() {
  const grade = document.querySelector('select[name="grade"]').value;
  const term = document.querySelector('select[name="term"]').value;
  const depart = document.querySelector('select[name="depart"]').value;
  const classes = document.querySelector('select[name="classes"]').value;

  fetch(`/professor/searchMember?grade=${grade}&term=${term}&depart=${depart}&classes=${classes}`)
      .then(response => response.json())
      .then(scList => {
          console.log(scList);

          const gradeArea = document.getElementsByClassName('grade-area')[0];
          gradeArea.innerHTML = '';

          const gradeTitle = document.createElement('div');
          gradeTitle.classList.add('grade-title');

          const number = document.createElement('div');
          number.innerHTML = '학번';
          const name = document.createElement('div');
          name.innerHTML = '이름';
          const grade = document.createElement('div');
          grade.innerHTML = '학년';
          const term = document.createElement('div');
          term.innerHTML = '학기';
          const depart = document.createElement('div');
          depart.innerHTML = '학과';
          const classes = document.createElement('div');
          classes.innerHTML = '과목';
          const point = document.createElement('div');
          point.innerHTML = '성적';
          gradeTitle.append(number, name, grade, grade, term, depart, classes, point);

          const content = document.createElement('div');
          content.classList.add('content');

          for (let list of scList) {
              const gradeContent = document.createElement('div'); // 학생이 갖는 내용
              gradeContent.classList.add('grade-content');

              const sNumber = document.createElement('div');
              sNumber.innerHTML = list.memberNo;
              sNumber.classList.add('sNumber'); // 학번을 식별할 클래스 추가
              const sName = document.createElement('div');
              sName.innerHTML = list.memberName;
              const sGrade = document.createElement('div');
              sGrade.innerHTML = list.lectureGrade;
              const sTerm = document.createElement('div');
              sTerm.innerHTML = list.lectureTerm;
              const sDepart = document.createElement('div');
              sDepart.innerHTML = list.departmentName;
              const sClass = document.createElement('div');
              sClass.innerHTML = list.classNm;
              const sClassNo = document.createElement('div');
              sClassNo.innerHTML = list.classNo;
              sClassNo.style.display = 'none';
              
              const sPoint = document.createElement('div');
              const sPointInput = document.createElement('input');
              sPointInput.setAttribute('placeholder', '성적입력');
              sPointInput.setAttribute('value', list.lecturePoint);
              if(sPointInput.value == '0'){
                sPointInput.setAttribute('value' , '')
              }
              sPoint.append(sPointInput);

              gradeContent.append(sNumber, sName, sGrade, sTerm, sDepart, sClass, sPoint, sClassNo);

              content.append(gradeContent);
          }
          

          gradeArea.append(gradeTitle, content);


      })
      .catch(err => console.log(err));
}

// 학과 목록 조회로 select option에 넣을 ajax
function departmentList() {
  fetch(`/professor/departmentList`)
      .then(response => response.json())
      .then(departmentList => {
        console.log(departmentList);

        const objectSelectArea = document.getElementsByClassName('object-select-area-depart')[0];
        objectSelectArea.innerHTML = '';
        
        const departmentListS = document.createElement('select');
        departmentListS.setAttribute('name' , 'depart');
        departmentListS.setAttribute('id' , 'departmentList');

        for(let department of departmentList){
          const departments = document.createElement('option');
          departments.innerHTML = department.departmentName;
          departments.setAttribute('value' , department.departmentName);
          departments.setAttribute('name' , 'queryD');

          departmentListS.append(departments);
        }

        objectSelectArea.append(departmentListS);

      })
      .catch(err => console.log(err));
}

// 학과 목록 조회로 select option에 넣을 ajax
function classList() {
  fetch(`/professor/classList`)
      .then(response => response.json())
      .then(classList => {
        console.log(classList);

        const objectSelectArea = document.getElementsByClassName('object-select-area-class')[0];
        objectSelectArea.innerHTML = '';
        
        const classAll = document.createElement('select');
        classAll.setAttribute('name' , 'classes');
        classAll.setAttribute('id' , 'classList');

        for(let classes of classList){
          const classO = document.createElement('option');
          classO.innerHTML = classes.classNm;
          classO.setAttribute('value' , classes.classNm);
          classO.setAttribute('name' , 'queryD');

          classAll.append(classO);
        }

        objectSelectArea.append(classAll);

      })
      .catch(err => console.log(err));
}


document.getElementById('insertBtn').addEventListener('click' , ()=>{
  updateGrades();
  selectMemberList();
  location.reload(); // 새로고침(성적 등록 결과값 불러오기 위함)
})

// 학생들의 점수를 비동기적으로 수정하는 함수
function updateGrades(event) {
  // 현재 화면에 표시된 학생들의 정보영역을 가져옴
  const gradeContentList = document.querySelectorAll('.grade-content');
  
  // 수정된 점수를 담을 배열
  const updatedGrades = [];

  // 각 학생의 정보를 순회하면서 수정된 정보를 가져와 배열에 추가
  gradeContentList.forEach(gradeContent => {
    const sNumber = gradeContent.querySelector(':nth-child(1)').innerHTML; // 학번
    const sGrade = gradeContent.querySelector(':nth-child(3)').innerHTML; // 학년
    const sTerm = gradeContent.querySelector(':nth-child(4)').innerHTML; // 학기
    const sClassNumber = gradeContent.querySelector(':nth-child(8)').innerHTML; // 과목 번호
    const sPointInput = gradeContent.querySelector('input').value;

    if (sPointInput == '1' || sPointInput == '2' || sPointInput == '3' || sPointInput == '4') {
      const updatedGrade = {
        memberNo: sNumber,
        lectureGrade: sGrade, // 학년
        lectureTerm: sTerm, // 학기
        classNo: sClassNumber, // 과목 번호
        lecturePoint: sPointInput // 수정된 점수
      };

      updatedGrades.push(updatedGrade);
    }else{
      // 올바른 값을 입력하도록 사용자에게 경고 메시지 출력
      alert('올바른 점수를 입력하세요. \n(1 ~ 4 까지의 숫자만 입력 가능)');
      // 해당 입력창으로 다시 포커스 이동
      gradeContent.querySelector('input').focus();
      // 함수 종료
      event.stopPropagation();
    }

  });
  if (updatedGrades.length > 0) {
    fetch('/professor/updateGrades', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({updatedGrades})
    })
    .then(response => {
      if (response.ok) {
        if(confirm('성적을 수정하시겠습니까?')){
          alert('성적이 성공적으로 업데이트되었습니다.');
        }else{
          alert('성적 수정을 취소 했습니다.');
        }

      } else {
        throw new Error('성적 업데이트에 실패했습니다.');
      }
    })
    .catch(error => {
      console.error('Error updating grades:', error);
      alert('성적 업데이트에 실패했습니다. 다시 시도해주세요.');
    });
  }
}


// 페이지 입장시 검색 ajax 요청
(()=>{
  selectMemberList();
  departmentList();
  classList();
})()