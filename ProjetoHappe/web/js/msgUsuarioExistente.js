var msgUsuarioExistente = document.getElementById("msgUsuarioExistente");
var errorCadastro = msgUsuarioExistente.getAttribute("name");

if (errorCadastro == "usuarioExistente") {
    alert("Email já está cadastrado no sistema!")
    errorCadastro = "null";
}
