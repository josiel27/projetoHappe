/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.Conexao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Kenushi
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    Conexao conexao = new Conexao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        conexao.conecta(); //conectar com o BD      

        conexao.executaSQL("select * "
                + "from tb_usuario "
                + "where email= '" + email + "'"
                + "and senha= '" + senha + "'");

        try {
            conexao.rs.first();
            String emailQuery = conexao.rs.getString("email");
            String senhaQuery = conexao.rs.getString("senha");
            String nomeQuery = conexao.rs.getString("nome");
            String dtNascQuery = conexao.rs.getString("dt_nascimento");
            

            if (emailQuery != "") { //pra verificar se foi encontrado algum usuario com esse nome
                if (email.equals(emailQuery) && senha.equals(senhaQuery)) {
                    request.setAttribute("email", email);
                    request.setAttribute("nome", nomeQuery);
                    request.setAttribute("dtNasc", dtNascQuery);
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            conexao.desconecta();
            System.out.println("chamando ERROR");
            request.setAttribute("email", email);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        };
        conexao.desconecta();
    }

}
