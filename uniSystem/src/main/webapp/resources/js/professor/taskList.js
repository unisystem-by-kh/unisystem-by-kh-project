document.addEventListener("DOMContentLoaded", function() {
    const paginationLinks = document.querySelectorAll(".pagination a:not(.prev):not(.next)");

    paginationLinks.forEach(link => {
        link.addEventListener("click", function(event) {
            event.preventDefault();

            // 현재 활성화된 페이지 링크 스타일 제거
            const activeLink = document.querySelector(".pagination a.active");
            if (activeLink) {
                activeLink.classList.remove("active");
            }

            // 클릭된 페이지 링크에 스타일 추가
            link.classList.add("active");
        });
    });

    // 처음으로 1페이지가 선택되었음을 표시
    const firstPageLink = document.querySelector(".pagination a:not(.prev):not(.next):first-child");
    if (firstPageLink) {
        firstPageLink.classList.add("active");
    }
});
