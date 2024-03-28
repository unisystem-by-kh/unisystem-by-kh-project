// 교원증 사진 저장 버튼 클릭 시 호출되는 함수
document.getElementById("generateCertificateBtn").addEventListener("click", function() {
    // 교원증 영역을 캡쳐하여 이미지로 변환
    html2canvas(document.getElementById("professorCertificate"), {
        // 이미지 캡쳐 후 콜백 함수 실행
        onrendered: function(canvas) {
            // Canvas를 이미지 데이터로 변환 (기본적으로 PNG 형식)
            var imageData = canvas.toDataURL("image/png");

            // 이미지 다운로드를 위한 링크 생성
            var downloadLink = document.createElement("a");
            downloadLink.href = imageData;
            downloadLink.download = "professor_certificate.png"; // 파일 이름 설정
            document.body.appendChild(downloadLink);
            
            // 링크를 클릭하여 다운로드 시작
            downloadLink.click();

            // 링크 삭제
            document.body.removeChild(downloadLink);
        }
    });
});


// 교원증 캡쳐 버튼 클릭 시 호출되는 함수
document.getElementById("generateCertificateBtnC").addEventListener("click", function() {
    // 교원증 영역을 캡쳐하여 이미지로 변환
    html2canvas(document.getElementById("professorCertificate"), {
        onrendered: function(canvas) {
            // Canvas를 이미지 데이터로 변환 (기본적으로 PNG 형식)
            var imageData = canvas.toDataURL("image/png");

            // 작은 팝업으로 이미지를 표시
            var popupWindow = window.open("", "_blank", "width=500,height=500");
            popupWindow.document.write('<img src="' + imageData + '" width="100%" height="auto" />');
        }
    });
});
