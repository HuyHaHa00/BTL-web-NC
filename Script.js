/*const { Doc } = require("codemirror");*/

function check() {
    let email = document.getElementById("tk").value;
    let mk = document.getElementById("mk").value;
    let loi = document.getElementById("loi");
    let dn = document.getElementById("loidn");
    let i = 0;

    for (i = 0; i < email.toString().length; i++) {
        if (email.charAt(i) == '@') {

        }
    }
    loi.innerHTML = "";
    console.log(email, mk)
    if (email.length == 0) {
        loi.innerHTML = "Mời nhập tên tài khoản";
        dn.style.display = "none";
        return;
    }
    
    if (mk.length == 0) {
        loi.innerHTML = "Mời nhập mật khẩu";
        return;
    }

    document.getElementById('form1').submit();
}
function xoathongtin() {
    document.getElementById("thongbaoasp").style.display = "none";
}
function checkdulieu() {
    let hoten = document.getElementById("hoten").value;
    let email = document.getElementById("email").value;
    let uName = document.getElementById("username").value;
    let mk = document.getElementById("mk").value;
    let rmk = document.getElementById("rmk").value;
    let sdt = document.getElementById("sdt").value;
    let loi = document.getElementById("loi");
    let hid = document.getElementById("hidden");
    var checkEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    console.log(hoten, email, mk, rmk, sdt)
    if ((hoten == "") || (email == "") || (mk == "") || (rmk == "") || (sdt == "") || (uName == "")) {
        loi.innerHTML = "Bạn cần điền đầy đủ thông tin vào các trường!";
        return false;
    }
    else
    if ((hoten.indexOf("0") >= 0) || (hoten.indexOf("1") >= 0) || (hoten.indexOf("2") >= 0) || (hoten.indexOf("3") >= 0) || (hoten.indexOf("4") >= 0)
        || (hoten.indexOf("5") >= 0) || (hoten.indexOf("6") >= 0) || (hoten.indexOf("7") >= 0) || (hoten.indexOf("8") >= 0) || (hoten.indexOf("9") >= 0)) {
        loi.innerHTML = "Họ và tên không được chứa số!";
        document.getElementById("hoten").focus();
        return false;
    }
    else
    if ((email.length < 6) || (!email.match(checkEmail)) ){
        loi.innerHTML = "Email chưa đúng định dạng!";
        document.getElementById("email").focus();
        return false;
    }
    else
    if (mk.length < 6) {
        loi.innerHTML = "Mật khẩu phải trên 6 kí tự!";
        document.getElementById("mk").focus();
        return false;
    }
    else
    if (mk != rmk) {
        loi.innerHTML = "Bạn cần nhập lại đúng mật khẩu !";
        document.getElementById("rmk").focus();
        return false;
    }
    else
    if ((isNaN(sdt)) || (sdt.length < 9)) {
        loi.innerHTML = "Số điện thoại phải là số và dài từ 9 đến 11 kí tự!";
        document.getElementById("").focus();
        return false;
    }
    loi.innerHTML = "";
    hid.value = "Đăng ký";
    hid.click();
}



