
// 게시글 삭제
if(document.getElementById("deleteBtn") != null){
    
    document.getElementById("deleteBtn").addEventListener("click",() => {
        if(confirm("정말 삭제하시겠습니까?")){
            
            
            location.href = "/board/" + categoryNo +"/" + boardNo +  "/delete";
    
            
            alert("삭제 되었습니다.")
            
        }
    })

}
// 목록으로
const goToListBtn = document.getElementById("goToListBtn")


goToListBtn.addEventListener("click",()=>{

    // location.href = "/board/" + boardCode + location.search;
    
    
    const pathname = location.pathname;
    const params = new URL(location.href).searchParams;

    let url = pathname.substring(0, pathname.indexOf("/",7));
    
    let cp;

    if(params.get("cp") != null){ 
        cp = "cp=" + params.get("cp"); 
    }else{
        cp = "cp=1" 
    }

    url += "?" + cp;


    let key;
    let query;

    if(params.get("key") != null){
        key = "&key=" + params.get("key");
        query = "&query=" + params.get("query");

        url += key + query;
    }
    
    location.href = url;


})


// 게시글 수정 
const updateBtn = document.getElementById("updateBtn");
if(updateBtn != null){


    updateBtn.addEventListener("click", () => {
        location.href = "/board/" + categoryNo +"/" + boardNo +  "/update" + location.search;
        
    })
}