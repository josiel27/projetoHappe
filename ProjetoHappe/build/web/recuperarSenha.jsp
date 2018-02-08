<%-- 
    Document   : recuperarSenha
    Created on : 08/02/2018, 00:10:49
    Author     : Kenushi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   

    <head>
        <link rel="icon" type="image/x-icon" class="js-site-favicon" href="img/favicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css\font-awesome\css\font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.css">


    </head>

    <body class="style_body">
        <!-- //Div para msg de error -->
        <div id="msgRecuperarSenha" name="<%= request.getAttribute("email")%>"></div>


        <div class="container">
            <div class="omb_login">
                <h3 class="style_tittle omb_authTitle">Recuperar Senha </h3>

                <div class="row omb_row-sm-offset-3 omb_loginOr">
                    <div class="col-xs-12 col-sm-6">
                        <hr class="omb_hrOr">
                    </div>
                </div>

                <div class="row omb_row-sm-offset-3">
                    <div class="col-xs-12 col-sm-6">
                        <form class="omb_loginForm" action="senha" autocomplete="off" method="POST">
                            <div class="input-group">
                                <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                    <i class=" fa fa-user"></i>
                                </span>
                                <input required="required" type="email" class="form-control" name="email" placeholder="Digite seu email">
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
                                <input  id="confirm_password" required="required" type="password" class="form-control" name="password" placeholder="Repita a nova senha">
                            </div>
                            <div id="textoSenhaRepetida" class="classSenhaDiferente">Senhas diferentes</div>
                            <br>
                            <br>

                            <button class="btn btn-lg btn-info btn-block" type="submit">Recuperar Senha</button>
                            <br>

                            <button onclick="window.location.href = 'index.jsp'" type="button" class="btn btn-lg btn-danger btn-block" value="Cancelar">Cancelar</button>
                            </input>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/msgRecuperarSenha.js"></script>
        <script src="js/testarSenhasRepetidas.js"></script>
    </body>

</html>
