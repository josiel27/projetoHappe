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
@WebServlet(name = "alterarSenha", urlPatterns = {"/alterarSenha"})
public class alterarSenha extends HttpServlet {

    Conexao conexao = new Conexao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String dtNasc = request.getParameter("dtNasc");
        String emailAtual = request.getParameter("emailAtual");
        String nomeAtual = request.getParameter("nomeAtual");
        String dtNascAtual = request.getParameter("dtNascAtual");
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
            request.setAttribute("msgAlterarSenha", "falhaAlterarSenha");
            request.setAttribute("email", emailAtual);
            request.setAttribute("nome", nomeAtual);
            request.setAttribute("dtNasc", dtNascAtual);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        };

        //PARA EXECUTAR OUTRA QUERY É NESCESSARIO FECHAR E ABRIR A CONEXAO COM BD
        conexao.desconecta();
        conexao.conecta();

        if (emailConfirmado == true) {
            System.out.println("InicioUPDATE ");
            String sql = "UPDATE tb_usuario SET senha = '" + senha + "' WHERE email = '" + email + "'";
            conexao.UpdateSQL(sql);
            request.setAttribute("msgAlterarSenha", "senhaAlterada");
            request.setAttribute("email", email);
            request.setAttribute("nome", nome);
            request.setAttribute("dtNasc", dtNasc);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }

        conexao.desconecta();
    }

}
