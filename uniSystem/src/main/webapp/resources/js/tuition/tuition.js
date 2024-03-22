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
                buyer_no : loginMemberNo
            }, async function (rsp) { // callback
                if (rsp.success) { //결제 성공시
					
                    const data = {"memberNo" : loginMemberNo,
                                  "payAcount" : departmentPrice,
                                  "payMethod" : rsp.pay_method}


                    fetch("/tuition/insert",{
                        method : "PUT",
                        headers : {"Content-Type" : "application/json"},
                        body : JSON.stringify(data)
                    })

                    .then(resp => resp.json())
                    .then()
                    .catch()

                    
                } else if (rsp.success == false) { // 결제 실패시
                    alert(rsp.error_msg)
                }
            })
       
    } else { // 구매 확인 알림창 취소 클릭시 돌아가기
        return false;
    }
}