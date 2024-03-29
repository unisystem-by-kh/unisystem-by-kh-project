// document.addEventListener("DOMContentLoaded", function() {
//     const studentNos = document.querySelectorAll('.studentMemberNo');
//     studentNos.forEach(studentNo => {
//         studentNo.addEventListener('click', function() {
//             const selectedStudentNo = this.textContent;
//             showLecturesByStudentNo(selectedStudentNo);
//         });
//     });

//     function showLecturesByStudentNo(studentNo) {
//         const lectureValues = document.querySelectorAll('.student-info-value');
//         const modal = document.getElementById("myModal");
//         const lectureInfo = document.getElementById("lectureInfo");
        
//         // 모달 내용 초기화
//         lectureInfo.innerHTML = "";

//         lectureValues.forEach(lectureValue => {
//             const lectureStudentNo = lectureValue.querySelector('.studentMemberNo').textContent;
//             if (lectureStudentNo === studentNo) {
//                 // 해당 학생의 강의 정보를 모달에 추가
//                 const className = lectureValue.querySelector('.className').textContent; // 과목명 가져오기
//                 const lecturePoint = lectureValue.querySelector('.lecturePoint').textContent; // 성적 가져오기
//                 // 강의 정보를 모달에 추가
//                 const lectureContent = document.createElement("div");
//                 lectureContent.textContent = `과목명: ${className}, 성적: ${lecturePoint}`;
//                 lectureInfo.appendChild(lectureContent);
//             }
//         });

//         // 모달 열기
//         modal.style.display = "block";

//         // 모달 닫기 버튼
//         const closeBtn = document.querySelector(".close");
//         closeBtn.onclick = function() {
//             modal.style.display = "none";
//         }

//         // 모달 외부 클릭 시 모달 닫기
//         window.onclick = function(event) {
//             if (event.target == modal) {
//                 modal.style.display = "none";
//             }
//         }
//     }
// });

// 클릭한 요소의 내용을 복사하여 클립보드에 저장하는 함수
function copyToClipboard(content, item) {
    // 임시 textarea 엘리먼트를 생성합니다.
    var textarea = document.createElement("textarea");
    // 복사할 텍스트를 textarea에 설정합니다.
    textarea.value = content;
    // textarea를 화면 밖으로 이동시킵니다.
    textarea.style.position = "absolute";
    textarea.style.left = "-9999px";
    // body 요소에 textarea를 추가합니다.
    document.body.appendChild(textarea);
    // textarea의 내용을 선택합니다.
    textarea.select();
    // 복사 명령을 실행합니다.
    document.execCommand('copy');
    // textarea를 제거합니다.
    document.body.removeChild(textarea);
    // 항목에 대한 설명을 포함한 알림 메시지를 표시합니다.
    alert( item + " 복사되었습니다.");
}

// 각 항목에 클릭 이벤트를 추가하여 해당 항목의 내용을 복사.
document.querySelectorAll('.student-info-value').forEach(function(element) {
    element.querySelector('.student-info-value > div:nth-child(1)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "학번이");
    });

    element.querySelector('.student-info-value > div:nth-child(2)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "학과명이");
    });

    element.querySelector('.student-info-value > div:nth-child(3)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "이름이");
    });

    element.querySelector('.student-info-value > div:nth-child(4)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "나이가");
    });

    element.querySelector('.student-info-value > div:nth-child(5)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "학년이");
    });

    element.querySelector('.student-info-value > div:nth-child(6)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "학기가");
    });

    element.querySelector('.student-info-value > div:nth-child(7)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "입학년도가");
    });

    element.querySelector('.student-info-value > div:nth-child(8)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "생년월일이");
    });

    element.querySelector('.student-info-value > div:nth-child(9)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "이메일이");
    });

    element.querySelector('.student-info-value > div:nth-child(10)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "전화번호가");
    });

    element.querySelector('.student-info-value > div:nth-child(11)').addEventListener('click', function() {
        copyToClipboard(this.textContent.trim(), "학적상태가");
    });

});


// 첫 번째 폼 요소의 값이 변경될 때 두 번째 폼 요소에 동일한 값을 복사하는 함수
function copyValues() {
    var searchType = document.getElementById('search-type').value;
    var searchQuery = document.getElementById('search-query').value;

    console.log(searchType);
    console.log(searchQuery);
    
    document.getElementById('download-type').value = searchType;
    document.getElementById('download-query').value = searchQuery;
}

const searchKey = document.getElementById('search-key');