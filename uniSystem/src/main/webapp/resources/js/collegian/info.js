const profileInput = document.getElementById("profile-input");

let num = 0;

const preview = document.getElementById("preview");

const route = document.getElementById("route");

profileInput.addEventListener("change", e =>{

    route.value = profileInput.files[0].name;

    if (profileInput.files && profileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
        };
        reader.readAsDataURL(profileInput.files[0]);
      } else {
        preview.src = "";
        route.value = "";
      }

    
    num = 1;

})

function deleteProfile(){
    profileInput.value = null;
    preview.src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzvIOVR3wCWA_xolR9Z8AvEs0D9KAofBSsCr29hr--XA&s";
    route.value = "";
    num = 1;
}

const Tochange = document.getElementById("ToChange");


Tochange.addEventListener("click",e=>{

    location.href="/collegian/change"
})


function profileValidation(){
    if(num == 0){
        alert("변경 사항이 없습니다.")
        return false;
    }else{
        return true;
    }
}



