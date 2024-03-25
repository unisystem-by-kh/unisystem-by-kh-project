document.addEventListener("DOMContentLoaded", function() {
    const studentNos = document.querySelectorAll('.studentMemberNo');
    studentNos.forEach(studentNo => {
        studentNo.addEventListener('click', function() {
            const selectedStudentNo = this.textContent;
            showLecturesByStudentNo(selectedStudentNo);
        });
    });

    function showLecturesByStudentNo(studentNo) {
        const lectureValues = document.querySelectorAll('.student-info-value');
        const modal = document.getElementById("myModal");
        const lectureInfo = document.getElementById("lectureInfo");
        
        // 모달 내용 초기화
        lectureInfo.innerHTML = "";

        lectureValues.forEach(lectureValue => {
            const lectureStudentNo = lectureValue.querySelector('.studentMemberNo').textContent;
            if (lectureStudentNo === studentNo) {
                // 해당 학생의 강의 정보를 모달에 추가
                const className = lectureValue.querySelector('.className').textContent; // 과목명 가져오기
                const lecturePoint = lectureValue.querySelector('.lecturePoint').textContent; // 성적 가져오기
                // 강의 정보를 모달에 추가
                const lectureContent = document.createElement("div");
                lectureContent.textContent = `과목명: ${className}, 성적: ${lecturePoint}`;
                lectureInfo.appendChild(lectureContent);
            }
        });

        // 모달 열기
        modal.style.display = "block";

        // 모달 닫기 버튼
        const closeBtn = document.querySelector(".close");
        closeBtn.onclick = function() {
            modal.style.display = "none";
        }

        // 모달 외부 클릭 시 모달 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }
});
