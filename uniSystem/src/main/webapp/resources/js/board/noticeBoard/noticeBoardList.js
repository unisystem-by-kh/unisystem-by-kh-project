document.getElementById("searchBtn").addEventListener("click", function() {
    var searchQuery = document.getElementById("searchQuery").value;
    if (searchQuery === "") {
        alert("검색어를 입력하세요.");
    } else {
        // 검색 로직을 수행하는 함수를 호출합니다.
        // 여기에 검색 로직을 추가하세요.
        console.log("검색어:", searchQuery);
    }

})








// 글 작성 버튼 누르면

document.getElementById('writeBtn').addEventListener('click', function() {
    // 여기에 클릭 이벤트가 발생했을 때 실행할 코드를 작성합니다.
    // 예시로 다른 JSP 페이지로 이동하는 코드를 작성합니다.
    window.location.href = '/WEB-INF/views/board/noticeBoardWrite.jsp';
});