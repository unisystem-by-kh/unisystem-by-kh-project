    // 구매자 정보


// 결제창 함수 넣어주기
// const buyButton = document.getElementById('payment')
// buyButton.setAttribute('onclick', `kakaoPay('${user_email}', '${username}')`)

var IMP = window.IMP;

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;

function kakaoPay() {
    if (confirm("결제 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
       

            IMP.init("imp35637705"); // 가맹점 식별코드
            IMP.request_pay({
                pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
                pay_method: 'kakaopay', // 결제 방식
                merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
                name: '등록금', // 제품명
                amount: departmentPrice, // 가격
                //구매자 정보 ↓
                /* buyer_email: `email`,
                buyer_name: `name`, */
                // buyer_tel : '010-1234-5678',
                //buyer_postcode : '123-456'
                buyer_no : loginMemberNo1
            }, async function (rsp) { // callback
                if (rsp.success) { //결제 성공시
					
                    const data = {"memberNo" : loginMemberNo,
                                  "departmentPrice" : departmentPrice,
                                  "payMethod" : rsp.pay_method}
                    console.log(rsp.pay_method)

                    fetch("/tuition/insert",{
                        method : "POST",
                        headers : {"Content-Type" : "application/json"},
                        body : JSON.stringify(data)
                    })

                    .then(resp => resp.json())
                    .then(result => {
                        console.log(result)
                        if(result > 0){
                            alert("등록금이 납부되었습니다.")
                            location.href = "main"
                        }else{
                            alert("등록금 납부에 실패하셨습니다.")
                        }
                    })
                    .catch()

                    
                } else if (rsp.success == false) { // 결제 실패시
                    alert(rsp.error_msg)
                }
            })
       
    } else { // 구매 확인 알림창 취소 클릭시 돌아가기
        return false;
    }
}


const mainPagi = document.getElementById("mainPagi")
const backPagi = document.getElementById("backPagi")
if(mainPagi != null){
    mainPagi.addEventListener("click", ()=>{
        location.href = "main"
    })

}

if(backPagi != null){
    backPagi.addEventListener("click", ()=>{
        history.back();
    })

}
$('#print').click(function() {
    if(confirm("파일을 다운로드 하시겠습니까?")){
    html2canvas($('.pay-main')[0]).then(function(canvas) {
        // 캔버스를 이미지로 변환
        let imgData = canvas.toDataURL('image/png');

        let margin = 10; // 출력 페이지 여백설정
        let imgWidth = 210 - (10 * 2); // 이미지 가로 길이(mm) A4 기준
        let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
        let imgHeight = canvas.height * imgWidth / canvas.width;
        let heightLeft = imgHeight;

        let doc = new jsPDF('p', 'mm');
        let position = margin;

        // 첫 페이지 출력
        doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;

        // 한 페이지 이상일 경우 루프 돌면서 출력
        while (heightLeft >= 20) {
            position = heightLeft - imgHeight;
            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            doc.addPage();
            heightLeft -= pageHeight;
        }

        // 파일 저장
        doc.save('등록금 고지서.pdf');
        alert("다운로드가 완료되었습니다.")
    });
}
});


    
    
    

	
	
