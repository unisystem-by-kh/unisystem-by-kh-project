(()=>{
    fetch("/admin/selectList", {
        method : 'get',
        headers : {'Content-Type' : "application/json"},
        body : 1
    })
    .then(resp => resp.text())
    .then(map=>{
        console.log(map);
    })
    .catch(e=>console.log(e))
})()