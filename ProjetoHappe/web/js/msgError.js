var msgError = document.getElementById("msgError");
var error = msgError.getAttribute("name");

if (error != "null") {
    if (error == "cadastrou") {
        alert("Usuario Cadastrado!")
        error = "null";
    } else {
        alert("Usuario e Senha incorretos!")
        error = "null";
    }
}
