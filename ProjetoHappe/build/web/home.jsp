<%-- 
    Document   : home
    Created on : 07/02/2018, 01:03:04
    Author     : Kenushi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="icon" type="image/x-icon" class="js-site-favicon" href="img/favicon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="css\font-awesome\css\font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/bootstrap.css">

    </head>

    <body class="menu-content style_body">
         <!-- //Div para msg de usuario atualizado -->
         <div style="margin-left: 50%" id="msgUsuarioAlterado" name="<%= request.getAttribute("msgSucesso")%>"></div>
         <!-- //Div para msg de senha alterada -->
         <div style="margin-left: 50%" id="msgAlterarSenha" name="<%= request.getAttribute("msgAlterarSenha")%>"></div>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-light-blue w3-collapse w3-top w3-leftbar w3-border-blue" style="z-index:3;width:260px" id="mySidebar">
            <div class="w3-container w3-display-container w3-padding-16">
                <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
                <image id="botaoHomeImg" src="img/logo.png" class="style_logo"></image>
                <h4>Bem Vindo</h4>
                <h5><%= request.getAttribute("nome")%></h5>

                <a id="botaoEditar" class="w3-bar-item w3-button w3-padding-16 w3-round-large" onclick="">
                    <i class="fa fa-user"></i> Editar</a>
                <a id="botaoAlterarSenha" class="w3-bar-item w3-button w3-padding-16 w3-round-large" onclick="">
                    <i class="fa fa-user"></i> Alterar Senha</a>
                <a href="index.jsp" class="w3-bar-item w3-button w3-padding-16 w3-round-large" onclick="document.getElementById( & #39; subscribe & #39; ).style.display = & #39; block & #39;">
                    <i class="fa fa-sign-out"></i> Sair</a>
                <hr>

                <div class="w3-bar-block">
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-building"></i> Eletrodomésticos</a>
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-glass"></i> Alimentos e Bebidas</a>
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-home"></i> Casa e Construção</a>
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-eye"></i> Beleza e Perfumaria</a>
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-medkit"></i> Saúde</a>
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-book"></i> Livros</a>
                    <a class="w3-bar-item w3-button w3-padding-16 w3-round-large">
                        <i class="fa fa-envelope"></i> Decoração</a>
                </div>
                <hr>
                </nav>

                <!-- Top menu on small screens -->
                <header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
                    <span class="w3-bar-item">Bem Vindo </span>
                    <a href="javascript:void(0)" class="w3-right w3-bar-item w3-button" onclick="w3_open()">
                        <i class="fa fa-bars"></i>
                    </a>
                </header>

                <!-- Overlay effect when opening sidebar on small screens -->
                <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>


                <!-- Subscribe Modal -->
                <div id="subscribe" class="w3-modal">
                    <div class="w3-modal-content w3-animate-zoom w3-padding-large">
                        <div class="w3-container w3-white w3-center">
                            <i onclick="document.getElementById( & #39; subscribe & #39; ).style.display = & #39; none & #39;" class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
                            <h2 class="w3-wide">SUBSCRIBE</h2>
                            <p>Join our mailing list to receive updates on available dates and special offers.</p>
                            <p>
                                <input class="w3-input w3-border" type="text" placeholder="Enter e-mail">
                            </p>
                            <button type="button" class="w3-button w3-padding-large w3-green w3-margin-bottom" onclick="document.getElementById( & #39; subscribe & #39; ).style.display = & #39; none & #39;">Subscribe</button>
                        </div>
                    </div>
                </div>


                <br><br>
                <div id="pagIniciar" style="display:block" class="container">
                    <div class="omb_login">
                        <h3 class="style_tittle omb_authTitle">Página Inicial Mercado</h3>
                    </div>

                    <image src="img/fundoHome.png" class="fundoHome"></image>
                </div>

                <!-- EDICAO DE USUARIO  -->
                <div id="pagEdicaoUsuario" style="display:none" class="container">
                    <div class="omb_login">
                        <h3 class="style_tittle omb_authTitle">Dados Pessoais</h3>

                        <div class="row omb_row-sm-offset-3 omb_loginOr">
                            <div class="col-xs-12 col-sm-6">
                                <hr class="omb_hrOr">
                            </div>
                        </div>

                        <div class="row omb_row-sm-offset-3">
                            <div class="col-xs-12 col-sm-6">
                                <form class="omb_loginForm" action="atualizaUsuario" autocomplete="off" method="POST">
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class=" fa fa-envelope"></i>
                                        </span>
                                        <!--Primeiro input escondido para salvar o email antigo-->
                                        <input value="<%= request.getAttribute("email")%>" id="" required="required" type="email" class="form-control" style="display:none" name="emailAntigo" placeholder="Digite seu email">
                                        <input value="<%= request.getAttribute("email")%>" id="inputEmail" required="required" type="email" class="form-control" name="email" placeholder="Digite seu email" disabled>
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class=" fa fa-user"></i>
                                        </span>
                                        <input value="<%= request.getAttribute("nome")%>" id="inputNome" required="required" type="text" class="form-control" name="nome" placeholder="Digite seu nome completo" disabled>
                                    </div>
                                    <span class="help-block"></span>
                                    <span class="help-block"></span>
                                    <br>
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class=" fa fa-calendar"></i>
                                        </span>
                                        <input value="<%= request.getAttribute("dtNasc")%>" id="inputDtNascimento" required="required" type="date" class="form-control" name="dtNasc" placeholder="Digite sua data de nascimento" disabled>
                                    </div>

                                    <br>
                                    <br>


                                    <button id="botaoSalvar" class="btn btn-lg btn-success btn-block" style="display:none" type="submit">Salvar</button>
                                </form>


                                <button id="botaoEntrar" class="btn btn-lg btn-info btn-block" style="display:block">Editar</button>
                                <br>

                                <button id="btnCancel" type="button" class="btn btn-lg btn-danger btn-block" value="Cancelar">Cancelar</button>
                                </input>
                            </div>
                        </div>
                    </div>
                </div>
                                    
                                    
                <div id="pagAlterarSenha" style="display:none" class="container">
                    <div class="omb_login">
                        <h3 class="style_tittle omb_authTitle">Alterar Senha </h3>

                        <div class="row omb_row-sm-offset-3 omb_loginOr">
                            <div class="col-xs-12 col-sm-6">
                                <hr class="omb_hrOr">
                            </div>
                        </div>

                        <div class="row omb_row-sm-offset-3">
                            <div class="col-xs-12 col-sm-6">
                                <form class="omb_loginForm" action="alterarSenha" autocomplete="off" method="POST">
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class=" fa fa-user"></i>
                                        </span>
                                        <input required="required" type="email" class="form-control" name="email" placeholder="Digite seu email">
                                        <input value="<%= request.getAttribute("nome")%>" id="" required="required" type="text" class="form-control" style="display:none" name="nomeAtual" placeholder="nomeEscondido">
                                        <input value="<%= request.getAttribute("email")%>" id="" required="required" type="text" class="form-control" style="display:none" name="emailAtual" placeholder="nomeEscondido">
                                        <input value="<%= request.getAttribute("dtNasc")%>" id="" required="required" type="text" class="form-control" style="display:none" name="dtNascAtual" placeholder="nomeEscondido">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class=" fa fa-calendar"></i>
                                        </span>
                                        <input required="required" type="date" class="form-control" name="dtNasc" placeholder="Digite sua data de nascimento">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                        <input  id="password" required="required" type="password" class="form-control" name="senha" placeholder="Digite a nova senha">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                        <input id="confirm_password" required="required" type="password" class="form-control" name="password" placeholder="Repita a nova senha">
                                    </div>
                                    <div id="textoSenhaRepetida" class="classSenhaDiferente">Senhas diferentes</div>
                                    <br>
                                    <br>

                                    <button class="btn btn-lg btn-info btn-block" type="submit">Alterar Senha</button>
                                    <br>

                                    <button id="btnCancelSenha" type="button" class="btn btn-lg btn-danger btn-block" value="Cancelar">Cancelar</button>
                                    </input>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="js/msgRecuperarSenha.js"></script>
                <script src="js/menu.js"></script>
                <script src="js/editar.js"></script>
                <script src="js/msgUsuarioAlterado.js"></script>
                <script src="js/msgAlterarSenha.js"></script>
                <script src="js/testarSenhasRepetidas.js"></script>
                </body>

                </html>