<%-- 
    Document   : index
    Created on : 07/02/2018, 22:00:39
    Author     : Kenushi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="icon" type="image/x-icon" class="js-site-favicon" href="img/favicon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css\font-awesome\css\font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/menu.css">
         <link rel="stylesheet" href="css/bootstrap.css">

    </head>

    <body class="style_body">
        <!-- //Div para msg de error -->
        <div id="msgError" name="<%= request.getAttribute("email")%>"> </div>

        <!-- //começa o body -->
        <div class="container">
            <div class="omb_login">
                <div class="circleLogo">
                    <image src="img/logo.png" class="style_logo"></image>
                </div>
                <h3 class="style_tittle omb_authTitle">Entrar ou
                    <a href="registrarUsuario.jsp">Registrar</a>
                </h3>

                <div class="row omb_row-sm-offset-3 omb_loginOr">
                    <div class="col-xs-12 col-sm-6">
                        <hr class="omb_hrOr">
                    </div>
                </div>

                <div class="row omb_row-sm-offset-3">
                    <div class="col-xs-12 col-sm-6">
                        <form class="omb_loginForm" action="login" autocomplete="off" method="POST">
                            <div class="input-group">
                                <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                    <i class=" fa fa-user"></i>
                                </span>
                                <input required="required" type="email" class="form-control" name="email" placeholder="Digite seu email">
                            </div>
                            <span class="help-block"></span>
                            <br>
                            <div class="input-group">
                                <span class=" btn btn-secondary input-group-addon btnSemBorda">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input required="required" type="password" class="form-control" name="senha" placeholder="Digite sua senha">
                            </div>
                            <br>
                            <br>

                            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>

                            <br>
                            <div class="omb_row-sm-offset-3 omb_socialButtons">
                                <button class="btn btn-secondary btn-lg omb_btn-facebook btn-block" type="submit">Entrar com
                                    <i class="fa fa-facebook visible-xs"></i> Facebook</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row omb_row-sm-offset-3">
                    <div class="col-xs-12 col-sm-3"> </div>
                    <div class="col-xs-12 col-sm-3">
                        <p class="omb_forgotPwd">
                            <a href="recuperarSenha.jsp" class="fa fa-question"> Recuperar Senha</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/main.js"></script>
        <script src="js/msgError.js"></script>

    </body>

</html>
