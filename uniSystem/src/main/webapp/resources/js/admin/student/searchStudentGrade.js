console.log('TEST');

// 1학년 1학기 조회
document.getElementById('searchBtnA').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListOneAndOne`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})

// 1학년 2학기 조회
document.getElementById('searchBtnB').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListOneAndTwo`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 2학년 1학기 조회
document.getElementById('searchBtnC').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListTwoAndOne`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 2학년 2학기 조회
document.getElementById('searchBtnD').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListTwoAndTwo`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 3학년 1학기 조회
document.getElementById('searchBtnE').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListThreeAndOne`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 3학년 2학기 조회
document.getElementById('searchBtnF').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListThreeAndTwo`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 4학년 1학기 조회
document.getElementById('searchBtnG').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListFourAndOne`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 4학년 2학기 조회
document.getElementById('searchBtnH').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListFourAndTwo`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 성적 미부여
document.getElementById('searchBtnI').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListNoPoint`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 성적 미부여
document.getElementById('searchBtnJ').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListStatusY`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})
// 전체 목록 조회
document.getElementById('searchBtnZ').addEventListener('click' , (e)=>{

    fetch(`/admin/memberListAll`)
        .then(response => response.json())
        .then(listA => {

            const contentList = document.getElementsByClassName('contentList')[0];
            contentList.innerHTML = '';

            const gradeContent = document.createElement('div');
            gradeContent.classList.add('grade-content');

            for (let list of listA) {
                const gradeContent = document.createElement('div');
                gradeContent.classList.add('grade-content');

                // memberNo 요소 생성
                const memberNoDiv = document.createElement('div');
                memberNoDiv.textContent = list.memberNo;
                gradeContent.appendChild(memberNoDiv);

                // memberName 요소 생성
                const memberNameDiv = document.createElement('div');
                memberNameDiv.textContent = list.memberName;
                gradeContent.appendChild(memberNameDiv);

                // memberGrade 요소 생성
                const memberGradeDiv = document.createElement('div');
                memberGradeDiv.textContent = list.memberGrade;
                gradeContent.appendChild(memberGradeDiv);

                // memberTerm 요소 생성
                const memberTermDiv = document.createElement('div');
                memberTermDiv.textContent = list.memberTerm;
                gradeContent.appendChild(memberTermDiv);

                // departmentName 요소 생성
                const departmentNameDiv = document.createElement('div');
                departmentNameDiv.textContent = list.departmentName;
                gradeContent.appendChild(departmentNameDiv);

                // classNm 요소 생성
                const classNmDiv = document.createElement('div');
                classNmDiv.textContent = list.classNm;
                gradeContent.appendChild(classNmDiv);

                // lectureGrade 요소 생성
                const lectureGradeDiv = document.createElement('div');
                lectureGradeDiv.textContent = list.lectureGrade;
                gradeContent.appendChild(lectureGradeDiv);

                // lectureTerm 요소 생성
                const lectureTermDiv = document.createElement('div');
                lectureTermDiv.textContent = list.lectureTerm;
                gradeContent.appendChild(lectureTermDiv);

                // lecturePoint 요소 생성
                const lecturePointDiv = document.createElement('div');
                if (list.lecturePoint == '-1') {
                    lecturePointDiv.textContent = "미부여";
                } else {
                    lecturePointDiv.textContent = list.lecturePoint;
                }
                gradeContent.appendChild(lecturePointDiv);

                // memberStatus에 따른 상태 요소 생성
                const statusDiv = document.createElement('div');
                let status = "";
                switch (list.memberStatus) {
                    case 'N':
                        status = "재학중";
                        break;
                    case 'Y':
                        status = "휴학중";
                        break;
                    case 'P':
                        status = "졸업";
                        break;
                    case 'D':
                        status = "중퇴";
                        break;
                }
                statusDiv.textContent = status;
                gradeContent.appendChild(statusDiv);

                contentList.appendChild(gradeContent);
            }
  
            console.log(listA);
  
        })
        .catch(err => console.log(err));

})