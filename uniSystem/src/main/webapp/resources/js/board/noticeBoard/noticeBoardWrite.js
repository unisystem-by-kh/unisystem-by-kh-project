function validateForm() {
    var title = document.getElementById('boardTitle').value;
    var content = document.getElementById('boardContent').value;

    if (title.trim() === '') {
        alert('제목을 입력하세요.');
        return false; // 제목이 비어있으면 유효성 검사를 통과하지 못했음을 반환하여 폼이 제출되지 않도록 합니다.
    }

    if (content.trim() === '') {
        alert('내용을 입력하세요.');
        return false; // 내용이 비어있으면 유효성 검사를 통과하지 못했음을 반환하여 폼이 제출되지 않도록 합니다.
    }

    return true; // 모든 입력 필드가 비어있지 않다면 유효성 검사를 통과하도록 합니다.
}
