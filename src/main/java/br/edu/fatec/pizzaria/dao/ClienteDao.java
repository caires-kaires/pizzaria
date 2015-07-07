package br.edu.fatec.pizzaria.dao;

import java.sql.Connection;
import java.util.List;

import br.edu.fatec.pizzaria.model.Cliente;



public class ClienteDao implements CrudDao<Cliente, Long>{
  
  private Connection connection;
  
    public ClienteDao(Connection connection){
      this.connection = connection;
    }

    @Override
    public void salva(Cliente model) {
      // TODO Auto-generated method stub
      
    }

    @Override
    public void atualiza(Cliente model) {
      // TODO Auto-generated method stub
      
    }

    @Override
    public void apaga(Long id) {
      // TODO Auto-generated method stub
      
    }

    @Override
    public Cliente busca(Long id) {
      // TODO Auto-generated method stub
      return null;
    }

    @Override
    public List<Cliente> buscaTodos() {
      // TODO Auto-generated method stub
      return null;
    }

}
