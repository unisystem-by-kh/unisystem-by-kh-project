// // 버튼 요소를 가져옵니다.
// var buttons = document.querySelectorAll('#btn1');

// // 각 버튼에 대해 이벤트 리스너를 추가합니다.
// buttons.forEach(function(button) {
//     button.addEventListener('click', function() {
//         // 클릭된 버튼의 부모 요소에서 해당 요소를 찾습니다.
//         var parent = this.parentElement.parentElement;
//         // 해당 요소 안에 있는 값을 가져옵니다.
//         var studentNo = parent.querySelector('.studentNo').textContent;
        
//         // 가져온 학번을 출력합니다.
//         console.log(studentNo);
//         // 또는 원하는 작업을 수행할 수 있습니다.
//     });
// });



// 버튼 요소를 가져옵니다.
var buttons = document.querySelectorAll('.btn-fetch');

// 각 버튼에 대해 이벤트 리스너를 추가합니다.
buttons.forEach(function(button) {
    button.addEventListener('click', function() {
        // 클릭된 버튼의 data-memberNo 속성에서 학번을 가져옵니다.
        var studentNo = this.getAttribute('data-memberNo');

        // fetch API를 사용하여 비동기 요청을 보냅니다.
        fetch('/professor/selectLecture?memberNo=' + encodeURIComponent(studentNo))
            .then(function(response) {
                // 응답을 JSON 형태로 파싱합니다.
                return response.json();
            })
            .then(function(lectures) {
                // 서버에서 받은 데이터를 처리합니다.
                console.log(lectures);
                // lectures를 사용하여 필요한 작업을 수행합니다.
            })
            .catch(function(error) {
                // 요청이 실패한 경우 에러를 출력합니다.
                console.error('Request failed:', error);
            });
    });
});
