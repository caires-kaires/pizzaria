package br.edu.fatec.pizzaria.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

  public Connection getConnection() {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      return DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/pizzaria", "root", "root");
    } catch (Exception e) {
      throw new RuntimeException("Erro ao concetar o banco de dados");
    }
  }
}
