const goToListBtn = document.getElementById("goToListBtn")


goToListBtn.addEventListener("click",()=>{

    /* // location.href = "/board/" + boardCode + location.search;
    
    
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

    if(params.get("query") != null){
        key = "&key=" + params.get("key");
        query = "&query=" + params.get("query");

        url += key + query;
    }
    
    location.href = url; */
    if(confirm("수정을 취소하시겠습니까?")){
        history.back();

    }

})