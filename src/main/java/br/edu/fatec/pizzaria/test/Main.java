package br.edu.fatec.pizzaria.test;

import java.sql.Connection;
import java.sql.SQLException;

import br.edu.fatec.pizzaria.dao.ConnectionFactory;
import br.edu.fatec.pizzaria.dao.EmbalagemDao;

public class Main {

  public static void main(String[] args) throws SQLException {

    try (Connection connection = new ConnectionFactory().getConnection()) {
      EmbalagemDao dao = new EmbalagemDao(connection);
      
      System.out.println(dao.buscaTodos());
    }
  }

}
