
console.log("nav.js 연결")

const navList = document.querySelectorAll('.stu-nav a'); // 네비의 모든 a태그
window.onload = function (){
    let text = document.querySelector(".stu-header").innerText;
    
    
    for (let i = 0; i < navList.length; i++) {
    
        if(navList[i].innerText == "- "+text){
            navList[i].style.color='black';
        }
    } 
}

	
const certNo = window.location.pathname.split('/').reverse()[0];

if(certNo == '1'){
    navList[4].style.color='black';
}

if(certNo == '2'){
    navList[5].style.color='black';
}

if(certNo == '3'){
    navList[6].style.color='black';
}

if(certNo == '4'){
    navList[7].style.color='black';
}


