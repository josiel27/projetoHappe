var msgAlterarSenha = document.getElementById("msgAlterarSenha");
var status = msgAlterarSenha.getAttribute("name");

if (status == "falhaAlterarSenha") {
    alert("Falha ao alterar senha, dados não conferem!")
    msgAlterarSenha.setAttribute("name", "null");
}

if (status == "senhaAlterada") {
    alert("Senha alterada com sucesso!")
    msgAlterarSenha.setAttribute("name", "null");
}