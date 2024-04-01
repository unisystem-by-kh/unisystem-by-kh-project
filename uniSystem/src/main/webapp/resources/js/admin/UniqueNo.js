document.addEventListener('DOMContentLoaded', function () {
    const generateBtn = document.getElementById('generateBtn');
    const copyBtn = document.getElementById('copyBtn');
    const numberAndCopyBtn = document.getElementById('numberAndCopyBtn');
    const completeNo = document.getElementById('completeNo');
    const radios = document.getElementsByName('radios');
    const departmentGroup = document.getElementById('departmentGroup');
    const department = document.getElementById('department');
    const memberNameInput = document.getElementById('memberName');
    const ssnInput = document.getElementById('ssn');

    // 주민등록번호 유효성 검사를 위한 정규식
    const ssnRegex = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])[-]\d{7}$/;
    // 한글 이름을 위한 정규식
    const memberNameRegex = /^[가-힣]{2,}$/;

    // generateBtn 클릭 시 동작
    generateBtn.addEventListener('click', function () {
        let type;

        // 선택된 라디오 버튼 확인
        for (const radio of radios) {
            if (radio.checked) {
                type = radio.id;
                break;
            }
        }

        const memberName = memberNameInput.value;
        const departmentValue = department.value;
        const ssn = ssnInput.value;

        // 입력값 확인
        if (!type || !memberName || !ssn) {
            alert('모든 항목을 입력해주세요.');
            return;
        }

        // 이름 유효성 검사
        if (!memberNameRegex.test(memberName)) {
            alert('올바른 한글 이름 형식이 아닙니다.');
            return;
        }

        // 주민등록번호 유효성 검사
        if (!ssnRegex.test(ssn)) {
            alert('올바른 주민등록번호 형식이 아닙니다.');
            return;
        }

        // 학번, 교번, 교직원 번호 생성
        let prefix;
        switch (type) {
            case 'radio1':
                prefix = '02-';
                break;
            case 'radio2':
                prefix = '01-';
                break;
            case 'radio3':
                prefix = '03-';
                break;
            default:
                prefix = '';
                break;
        }

        // 현재 연도의 두 번째 자릿수를 가져옵니다.
        const currentYear = new Date().getFullYear() % 100;

        // 다섯 개의 랜덤 숫자를 생성합니다.
        const randomDigits = Math.floor(Math.random() * 90000) + 10000;

        // 현재 연도의 두 번째 자릿수와 랜덤 숫자를 결합하여 최종 랜덤 숫자를 생성합니다.
        const randomNumber = currentYear * 100000 + randomDigits;

        // 생성된 번호를 표시합니다.
        completeNo.textContent = prefix + randomNumber;
        // 복사하기 버튼을 보여줍니다.
        numberAndCopyBtn.style.display = 'block';

        // 학생 라디오 버튼인 경우에만 학과 입력란을 표시합니다.
        if (type == 'radio2') {
            departmentGroup.style.display = 'flex';
            department.required = true;
        }

        if (type == 'radio1') {
            departmentGroup.style.display = 'flex';
            department.required = true;
        }
        
        if (type == 'radio3') {
            departmentGroup.style.display = 'none';
            department.required = false;
        }

        // 입력란 초기화
        memberNameInput.value = '';
        ssnInput.value = '';
        // 생성된 번호를 서버로 전송합니다.
        generateNumber(prefix, randomNumber, memberName, ssn);
    });

    // 복사하기 버튼을 클릭하면 번호를 클립보드에 복사합니다.
    function copyNumber() {
        const numberToCopy = completeNo.textContent;
        const el = document.createElement('textarea');
        el.value = numberToCopy;
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
        alert('번호가 복사되었습니다: ' + numberToCopy);
    }

    // 복사하기 버튼에 클릭 이벤트 리스너 추가
    copyBtn.addEventListener('click', copyNumber);

    // 라디오 버튼 변경 시 동작
    radios.forEach(radio => {
        radio.addEventListener('change', function () {
            // 학생 라디오 버튼을 선택했을 때만 학과 선택란을 표시합니다.
            if (this.id === 'radio2') {
                departmentGroup.style.display = 'flex';
                department.required = true;
            }

            if (this.id === 'radio1') {
                departmentGroup.style.display = 'flex';
                department.required = true;
            }

            if (this.id === 'radio3') {
                departmentGroup.style.display = 'none';
                department.required = true;
            }

            // 입력란 초기화
            memberNameInput.value = '';
            ssnInput.value = '';
        });
    });
});

function generateNumber(prefix, randomNumber, memberName, memberSsn) {
    // 번호 생성을 위해 필요한 데이터를 수집합니다.
    const department = document.getElementById('department').value;
    // 서버로 전송할 데이터를 객체로 정의합니다.
    const data = {
        memberNo: prefix + randomNumber,
        memberName: memberName,
        memberSsn: memberSsn,
        department: department
    };
    
    console.log(data);
    // 서버로 데이터를 전송합니다.
    fetch("/admin/UniqueNo", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(data)
    })
    .then(response => response.text())
    .then(result => {
        // 서버에서 받은 결과를 처리합니다.
        if (result > 0) {
            // 성공적으로 생성된 경우
            document.getElementById('numberAndCopyBtn').style.display = 'block';
        } else {
            // 생성에 실패한 경우
            alert('번호 생성에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('Server communication error:', error);
        alert('서버와의 통신 중 오류가 발생했습니다.');
    });
}
