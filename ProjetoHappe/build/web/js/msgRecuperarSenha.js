var msgRecuperarSenha = document.getElementById("msgRecuperarSenha");
var errorRecuperarSenha = msgRecuperarSenha.getAttribute("name");

if (errorRecuperarSenha == "falhaRecuperarSenha") {
    alert("Falha ao recuperar senha, dados não conferem!")
    errorRecuperarSenha = "null";
}

if (errorRecuperarSenha == "senhaRecuperada") {
    alert("Senha recuperada com sucesso!")
    errorRecuperarSenha = "null";
}