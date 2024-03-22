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

console.log('test');

const memberNo = document.getElementsByClassName('studentMemberNo');

for(let i = 0; i < memberNo.length; i++){
    memberNo[i].addEventListener('click' , (e)=>{
        console.log('asd');
        console.log(memberNo[i].textContent);
    })
}