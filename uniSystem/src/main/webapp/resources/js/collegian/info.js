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

})

function deleteProfile(){
    profileInput.value = null;
    preview.src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzvIOVR3wCWA_xolR9Z8AvEs0D9KAofBSsCr29hr--XA&s";
    route.value = "";
}

const Tochange = document.getElementById("ToChange");


Tochange.addEventListener("click",e=>{

    location.href="/collegian/change"
})



