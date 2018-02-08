/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.Conexao;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kenushi
 */
@WebServlet(name = "senha", urlPatterns = {"/senha"})
public class senha extends HttpServlet {

    Conexao conexao = new Conexao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String dtNasc = request.getParameter("dtNasc");
        Boolean emailConfirmado = false;

        conexao.conecta();
        conexao.executaSQL("select * from tb_usuario where email= '" + email + "' and dt_nascimento= '" + dtNasc + "'");

        try {
            conexao.rs.first();
            String emailQuery = conexao.rs.getString("email");

            if (emailQuery != "") { //pra verificar se foi encontrado algum usuario com esse nome
                System.out.println("EMAIL CONFIRMADO ");
                emailConfirmado = true;
            }
            
        } catch (SQLException ex) {
            request.setAttribute("email", "falhaRecuperarSenha");
            request.getRequestDispatcher("recuperarSenha.jsp").forward(request, response);
        };

        //PARA EXECUTAR OUTRA QUERY É NESCESSARIO FECHAR E ABRIR A CONEXAO COM BD
        conexao.desconecta();
        conexao.conecta();

        if (emailConfirmado == true) {
            System.out.println("InicioUPDATE ");
            String sql = "UPDATE tb_usuario SET senha = '" + senha + "' WHERE email = '" + email + "'";
            conexao.UpdateSQL(sql);
            request.setAttribute("email", "senhaRecuperada");
            request.getRequestDispatcher("recuperarSenha.jsp").forward(request, response);
        }

        conexao.desconecta();
    }

}
