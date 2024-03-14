document.addEventListener("DOMContentLoaded", function() {
    const generateButton = document.querySelector("button");
    const radios = document.getElementsByName("radios");
    const completeNo = document.getElementById("completeNo");
    const nameInput = document.getElementById("name");
    const departmentSelect = document.getElementById("department");
    const ssnInput = document.getElementById("ssn");

    generateButton.addEventListener("click", function() {
        let prefix = "";
        let isValid = true;
        let errorMessage = "";

        // 라디오 버튼 체크 확인
        let radioChecked = false;
        for (const radio of radios) {
            if (radio.checked) {
                radioChecked = true;
                if (radio.id === "radio1") {
                    prefix = "01-";
                } else if (radio.id === "radio2") {
                    prefix = "02-";
                }
                break;
            }
        }
        if (!radioChecked) {
            errorMessage += "라디오 버튼을 선택해주세요.\n";
            isValid = false;
        }

        // 이름 입력 확인
        if (nameInput.value.trim() === "") {
            errorMessage += "이름을 입력해주세요.\n";
            isValid = false;
        }

        // 학과 선택 확인
        if (departmentSelect.value.trim() === "") {
            errorMessage += "학과를 선택해주세요.\n";
            isValid = false;
        }

        // 주민등록번호 입력 확인
        const ssnPattern = /^\d{6}-\d{7}$/;
        if (!ssnPattern.test(ssnInput.value.trim())) {
            errorMessage += "주민등록번호 형식을 올바르게 입력해주세요. (예: 000000-0000000)\n";
            isValid = false;
        }

        if (isValid) {
            // 임의의 7자리 숫자 생성
            const randomNumber = Math.floor(1000000 + Math.random() * 9000000);

            // 앞번호와 임의의 숫자를 합쳐서 출력
            completeNo.textContent = prefix + randomNumber;
            document.getElementById("complete").textContent = "생성완료";
        } else {
            alert(errorMessage);
            completeNo.textContent = "";
            document.getElementById("complete").textContent = "";
        }
    });
});
