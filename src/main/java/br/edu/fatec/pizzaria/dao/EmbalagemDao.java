package br.edu.fatec.pizzaria.dao;

import br.edu.fatec.pizzaria.model.Embalagem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmbalagemDao {

  private Connection connection;

  public EmbalagemDao(Connection connection) {
    this.connection = connection;
  }

  public void salva(Embalagem embalagem) {
    String insert = "INSERT INTO embalagens (embalagem, unidade) VALUES (?,?)";

    try (PreparedStatement statement = connection.prepareStatement(insert)) {
      // inicia transacao
      connection.setAutoCommit(false);

      statement.setString(1, embalagem.getEmbalagem());
      statement.setString(2, embalagem.getUnidade());
      statement.execute();

      connection.commit();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void atualiza(Embalagem embalagem) {
    String insert = "UPDATE embalagens set embalagem=?, unidade=? WHERE id_embalagen=?";

    try (PreparedStatement statement = connection.prepareStatement(insert)) {
      // inicia transacao
      connection.setAutoCommit(false);

      statement.setString(1, embalagem.getEmbalagem());
      statement.setString(2, embalagem.getUnidade());
      statement.setLong(3, embalagem.getId());
      statement.execute();

      connection.commit();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void apaga(Long id_embalagen) {
    String insert = "DELETE FROM embalagens WHERE id_embalagen=?";

    try (PreparedStatement statement = connection.prepareStatement(insert)) {
      // inicia transacao
      connection.setAutoCommit(false);

      statement.setLong(1, id_embalagen);
      statement.execute();

      connection.commit();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public Embalagem busca(Long id_embalagen) {
    String insert = "SELECT id_embalagen, embalagem, unidade FROM embalagens WHERE id_embalagen=?";

    try (PreparedStatement statement = connection.prepareStatement(insert)) {

      statement.setLong(1, id_embalagen);
      
      try (ResultSet resultSet = statement.executeQuery()) {
        if (resultSet.next()) {
          Embalagem embalagem = new Embalagem();
          embalagem.setId(resultSet.getLong("id_embalagen"));
          embalagem.setEmbalagem(resultSet.getString("embalagem"));
          embalagem.setUnidade(resultSet.getString("unidade"));
          return embalagem;
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    // mal recomendado
    return null;
  }

  public List<Embalagem> buscaTodos() {
    String query = "SELECT id_embalagen, embalagem, unidade FROM embalagens ORDER BY embalagem";

    List<Embalagem> embalagems = new ArrayList<Embalagem>();

    try (Statement statement = connection.createStatement()) {
      try (ResultSet resultSet = statement.executeQuery(query)) {
        while (resultSet.next()) {
          Embalagem embalagem = new Embalagem();
          embalagem.setId(resultSet.getLong("id_embalagen"));
          embalagem.setEmbalagem(resultSet.getString("embalagem"));
          embalagem.setUnidade(resultSet.getString("unidade"));
          embalagems.add(embalagem);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return embalagems;
  }
}
