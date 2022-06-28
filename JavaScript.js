/*-------------------------giỏ hàng----------------------*/
const btn = document.querySelectorAll(".but")
console.log(btn)
btn.forEach(function (button, index) {
    button.addEventListener("click", function (event) {
        var btnItem = event.target
        var product = btnItem.parentElement
        var productImg = product.querySelector(".item img").src
        var productName = product.querySelector(".ten").innerText
        var productPrice = product.querySelector(".price").innerText
        //console.log(productImg,productName, productPrice)
        addcart(productImg, productName, productPrice)
    })

})
function addcart(productImg, productName, productPrice) {
    var addp = document.createElement("tr")
    var cartItem = document.querySelectorAll("tbody tr")
    for (var i = 0; i < cartItem.length; i++) {
        var productT = document.querySelectorAll(".name")
        if (productT[i].innerText == productName) {
            alert("Sản phảm đã có trong giỏ hàng!")
            return
        }
    }
    var pcontent = '<tr><td><img style="width:50px;" src="' + productImg + '" /></td ><td> <span class="name">' + productName + '</span></td><td> Giá:<span class="gia">' + productPrice + '</span></td><td>Số lượng<input class="soluong" style="width:30px;" type="number" value="1" min="1" /> </td><td><span class="xoa"> Xóa</span></td></tr >'
    var cartTable = document.querySelector("tbody")
    addp.innerHTML = pcontent
    cartTable.append(addp)
    carttotal()
    xoa()
}
//--------------------------total----
function carttotal() {
    var cartItem = document.querySelectorAll("tbody tr")
    var totalB = 0;
    for (var i = 0; i < cartItem.length; i++) {
        var inputValue = cartItem[i].querySelector("input").value

        var price = cartItem[i].querySelector(".gia").innerHTML
        console.log(inputValue, price)
        totalA = parseInt(inputValue) * parseInt(price) * 1000

        totalB = totalB + totalA
    }
    var cartTotalA = document.querySelector(".total span")
    cartTotalA.innerText = totalB.toLocaleString('de-DE')
    change()
}
//-----------------xoa
function xoa() {
    var cartItem = document.querySelectorAll("tbody tr")
    for (var i = 0; i < cartItem.length; i++) {

        var productT = document.querySelectorAll(".xoa")
        productT[i].addEventListener("click", function (event) {
            var xoacart = event.target
            var xoaSP = xoacart.parentElement.parentElement
            /*console.log(xoacart)*/
            xoaSP.remove()
            carttotal()
        })

    }
}
function change() {
    var cartItem = document.querySelectorAll("tbody tr")
    for (var i = 0; i < cartItem.length; i++) {

        var inputvalue = cartItem[i].querySelector(".soluong")
        inputvalue.addEventListener("change", function () {
            carttotal()
        })

    }
}
