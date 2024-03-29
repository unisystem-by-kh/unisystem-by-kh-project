document.addEventListener("DOMContentLoaded", function() {
    // 검색 요소에 대한 참조 가져오기
    var searchForm = document.getElementById("boardSearch");
    var searchBtn = document.getElementById("searchBtn");
    var searchKey = document.getElementById("searchKey");
    var searchQuery = document.getElementById("searchQuery");

    // 검색 버튼에 이벤트 리스너 추가
    searchBtn.addEventListener("click", function(event) {
        // 기본 폼 제출 동작 방지
        event.preventDefault();

        // 선택된 검색 키와 쿼리 가져오기
        var selectedKey = searchKey.value;
        var query = searchQuery.value.trim();

        // 검색 URL에 쿼리 매개변수와 함께 검색 URL 구성
        var searchUrl = searchForm.getAttribute("action") + "?key=" + selectedKey + "&query=" + encodeURIComponent(query);

        // 사용자를 검색 결과 페이지로 리디렉션
        window.location.href = searchUrl;
    });
});





