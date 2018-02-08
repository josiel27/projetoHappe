
var password = document.getElementById("password")
var confirm_password = document.getElementById("confirm_password");

function intervaloSenhas() {
    setInterval(function () {
        console.log('password.value ' + password.value)
        console.log('password.value ' + confirm_password.value)
        if (password.value != confirm_password.value) {
//            confirm_password.setCustomValidity("Senhas diferente!");
            document.getElementById("textoSenhaRepetida").style.opacity = "1";
        } else {
            document.getElementById("textoSenhaRepetida").style.opacity = "0";
        }
    }, 100)
}
intervaloSenhas();
