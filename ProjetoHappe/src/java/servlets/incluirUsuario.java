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
@WebServlet(name = "incluirUsuario", urlPatterns = {"/incluirUsuario"})
public class incluirUsuario extends HttpServlet {

    Conexao conexao = new Conexao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String dtNasc = request.getParameter("dtNasc");
        String senha = request.getParameter("senha");

        conexao.conecta(); //conectar com o BD      
        try {
            PreparedStatement pst = conexao.conn.prepareCall("insert into tb_usuario(email, nome, dt_nascimento, senha)values(?,?,?,?)");
            pst.setString(1, email);
            pst.setString(2, nome);
            pst.setString(3, dtNasc);
            pst.setString(4, senha);
            pst.execute();
            System.out.println("Cadastrou");
            request.setAttribute("email", "cadastrou");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException ex) {
            request.setAttribute("email", "usuarioExistente");
            request.getRequestDispatcher("registrarUsuario.jsp").forward(request, response);
        };
        
        conexao.desconecta();
    }

}
