var msgUsuarioAlterado = document.getElementById("msgUsuarioAlterado");
var err = msgUsuarioAlterado.getAttribute("name");

if (err != "null") {
    if (err == "alterado") {
        msgUsuarioAlterado.setAttribute("name", "null");
        alert("Dados pessoais foram alterados!");
    }
}
