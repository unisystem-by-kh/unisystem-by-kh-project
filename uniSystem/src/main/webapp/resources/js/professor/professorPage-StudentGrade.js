const objectArea = document.querySelector(".object-area");
const select = document.querySelector("#objectList");

select.addEventListener("change", function() {
    objectArea.textContent = select.value;
});

// 커서모양 변경
const element = document.querySelector(".grade-area");

element.addEventListener("mouseenter", function() {
  element.style.cursor = "url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHdpZHRoPSIyMHB4IiBoZWlnaHQ9IjIwcHgiIHZpZXdQb3J0PSIxMCAxMCAyMCAyMCI+PHBhdGggZD0ibTMgMTJjMy4zMTQgMCA2LjY4Ni0xLjA0MyA5LjA5NC0yLjgxNmwtMS40MTQtMS40MTQgLTUuNjE0IDUuNjE0eiIgZmlsbD0iIzAwMCI+PC9wYXRoPjwvc3ZnPg=='), auto";
});

element.addEventListener("mouseleave", function() {
  element.style.cursor = "default";
});


((e)=>{
  console.log('test');

})()


function selectMemberList(){

  fetch("/professor/selectMemberList")
    .then(response => response.json())
    .then(mList => {
        console.log(mList);

    })
    .catch(err => console.log(err));

}
