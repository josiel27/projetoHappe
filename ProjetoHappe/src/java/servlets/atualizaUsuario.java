/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.Conexao;
import java.io.IOException;
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
@WebServlet(name = "atualizaUsuario", urlPatterns = {"/atualizaUsuario"})
public class atualizaUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Conexao conexao = new Conexao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailAntigo = request.getParameter("emailAntigo");
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String dtNasc = request.getParameter("dtNasc");
        String emailQuery = "";
        Boolean emailConfirmado = false;

        conexao.conecta();
        conexao.executaSQL("select * from tb_usuario where email= '" + emailAntigo + "'");

        try {
            conexao.rs.first();
            emailQuery = conexao.rs.getString("email");

            if (emailQuery != "") { //pra verificar se foi encontrado algum usuario com esse nome
                System.out.println("EMAIL CONFIRMADO ");
                emailConfirmado = true;
            }

        } catch (SQLException ex) {
            //colocar tratamento para quando o usuria remover o email da edicao
        };

        //PARA EXECUTAR OUTRA QUERY É NESCESSARIO FECHAR E ABRIR A CONEXAO COM BD
        conexao.desconecta();
        conexao.conecta();

        if (emailConfirmado == true) {
            System.out.println("InicioUPDATE ");
            String sql = "UPDATE tb_usuario SET email = '" + email + "', nome = '" + nome + "', dt_nascimento = '" + dtNasc + "' WHERE email = '" + emailAntigo + "'";
            conexao.UpdateSQL(sql);
            request.setAttribute("msgSucesso", "alterado");
            request.setAttribute("email", email);
            request.setAttribute("nome", nome);
            request.setAttribute("dtNasc", dtNasc);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }

        conexao.desconecta();
    }

}
