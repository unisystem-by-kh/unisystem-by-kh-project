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