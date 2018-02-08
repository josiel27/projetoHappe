/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kenushi
 */
public class Conexao {

    public Statement stm;//prepara e realiza pesquisa no Banco de Dados
    public ResultSet rs;//armazena o resultado de uma pesquisa passada para o statement
    public String driver = "org.postgresql.Driver";//resp por identificar o serviço de banco de dados
    public String caminho = "jdbc:postgresql://localhost:5432/happeBD";
    public String usuario = "postgres";
    public String senha = "shiryu";
    public Connection conn;// responsalvel por realizar a conexao do banco de dados

    public void conecta() {
        try {
            try {
                //tenta conectar
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            }
//            Connection connection = null;
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/happeBD", "postgres", "shiryu");
//            connection.close();

//            System.setProperty("jdbc.Drivers", driver);//seta a propiedade do driver de conexão
//            conn = DriverManager.getConnection(caminho, usuario, senha);//realiza a conexão com o banco de dados
        } catch (SQLException ex) {//se nao conseguir conectar, cai aqui
            System.out.println("Erro de conexão com o Banco de Dados!" + ex.getMessage());
        }
    }

    public void executaSQL(String sql) {
        try {
            stm = conn.createStatement(rs.TYPE_SCROLL_INSENSITIVE, rs.CONCUR_READ_ONLY);
            rs = stm.executeQuery(sql);

        } catch (SQLException ex) {

            System.out.println("Erro ao executar sql!\n Erro: " + ex.getMessage());

        }
        desconecta();
    }
    
    public void UpdateSQL(String sql) {
        try {
            stm = conn.createStatement();
            stm.executeUpdate(sql);//UPDATE usado no lugar de QUERY, para não ter retorno do BD  
            System.out.println("Alterado com sucesso!");

        } catch (SQLException ex) {
            System.out.println("Erro ao Alterar!\n" + ex.getMessage());
        }
    }

    public void InsertSQL(String sql) {
        try {
            stm = conn.createStatement();
            stm.executeUpdate(sql);//UPDATE usado no lugar de QUERY, para não ter retorno do BD  
            System.out.println("Cadastrado com sucesso!");

        } catch (SQLException ex) {

            System.out.println("Erro ao cadatrar!\n" + ex.getMessage());

        }
    }

    public void SelectSQL(String sql) {
        try {
            stm = conn.createStatement(rs.TYPE_SCROLL_INSENSITIVE, rs.CONCUR_READ_ONLY);
            rs = stm.executeQuery(sql);

        } catch (SQLException ex) {

            System.out.println("Erro ao executar sql!\n Erro: " + ex.getMessage());

        }
        desconecta();
    }

    public void desconecta() {     //metodo para fechar a conexao com o banco
        try {
            conn.close(); //fecha a conexao    
        } catch (SQLException ex) {
            System.out.println("Erro ao fechar conexão com o Banco de Dados!\n Erro: " + ex.getMessage());
        }
    }
}
