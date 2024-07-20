/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function displayAll() {
    var bestSeller = document.getElementById("bestSeller");
    var state = document.getElementById("allItems").style.display;
    var allItems = document.getElementById("allItems");
    if (state == "none") {
        allItems.style.display = "flex";
    } else {
        allItems.style.display = "none";
    }
}
function moveToItemsPage(id) {
    window.location = "items?id=" + id;
}

const plus = document.querySelector(".plus"),
        minus = document.querySelector(".minus"),
        num = document.querySelector(".num");
let a = 1;

plus.addEventListener("click", () => {
    a++;

    num.innerText = a;
    console.log(a);
});
minus.addEventListener("click", () => {
    if (a > 1) {
        a--;
    }
    num.innerText = a;
    console.log(a);
});
function submitOrder(id) {
    var quantity = document.querySelector(".num").innerText;
    console.log(quantity);
    window.location = "ord?quantity=" + quantity + "&id=" + id;
}


