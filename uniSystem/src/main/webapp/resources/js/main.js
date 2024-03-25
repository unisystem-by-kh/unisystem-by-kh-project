((e) => {
    console.log('메인페이지 연결 테스트');

    selectAnnouncement();
})()


function selectAnnouncement(){
    console.log('함수 연결 테스트');

    fetch("/selectAnnouncement")
    .then(response => response.json())
    .then(bList => {
        console.log(bList);
        
        const borderView = document.getElementsByClassName('border-view')[0];
        borderView.innerText='';
        console.log(borderView);

        for(let list of bList){

            const borderViewSelect = document.createElement('div');
            borderViewSelect.classList.add('border-view-select');

            const boardLink = document.createElement('a');
            boardLink.setAttribute('id' , 'boardLink');
            boardLink.setAttribute('href' , `/board/1/${list.boardNo}`);

            const borderTitle = document.createElement('border-title');
            borderTitle.classList.add('border-title');
            borderTitle.innerHTML = list.boardTitle;

            const borderContent = document.createElement('border-title');
            borderContent.classList.add('border-content');
            borderContent.innerHTML = list.boardContent;

            boardLink.append(borderTitle, borderContent);
            borderViewSelect.append(boardLink);

            borderView.append(borderViewSelect);
        }


    })
    .catch(err => console.log(err));
}