document.getElementById("botaoEntrar").addEventListener("click", function () {
    document.getElementById('inputEmail').removeAttribute('disabled');
    document.getElementById('inputNome').removeAttribute('disabled');
    document.getElementById('inputDtNascimento').removeAttribute('disabled');
    this.style.display = "none";
    document.getElementById("botaoSalvar").style.display = "block";
});

document.getElementById("botaoEditar").addEventListener("click", function () {
    document.getElementById("pagEdicaoUsuario").style.display = "block";
    document.getElementById("pagIniciar").style.display = "none";
    document.getElementById("pagAlterarSenha").style.display = "none";
});

document.getElementById("btnCancel").addEventListener("click", function () {
    document.getElementById("pagEdicaoUsuario").style.display = "none";
    document.getElementById("pagIniciar").style.display = "block";
    document.getElementById("pagAlterarSenha").style.display = "none";
});

document.getElementById("btnCancelSenha").addEventListener("click", function () {
    document.getElementById("pagEdicaoUsuario").style.display = "none";
    document.getElementById("pagIniciar").style.display = "block";
    document.getElementById("pagAlterarSenha").style.display = "none";
});

document.getElementById("botaoHomeImg").addEventListener("click", function () {
    document.getElementById("pagEdicaoUsuario").style.display = "none";
    document.getElementById("pagIniciar").style.display = "block";
    document.getElementById("pagAlterarSenha").style.display = "none";
});

document.getElementById("botaoAlterarSenha").addEventListener("click", function () {
    document.getElementById("pagEdicaoUsuario").style.display = "none";
    document.getElementById("pagIniciar").style.display = "none";
    document.getElementById("pagAlterarSenha").style.display = "block";
});