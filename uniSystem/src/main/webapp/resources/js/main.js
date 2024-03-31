/* ((e) => {
    selectAnnouncement();
})()

// 공지사항 목록이였던 것
function selectAnnouncement(){
    fetch("/selectAnnouncement")
    .then(response => response.json())
    .then(bList => {
        const borderView = document.getElementsByClassName('border-view')[0];
        borderView.innerText='';

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
} */