package br.edu.fatec.pizzaria.dao;

import java.util.List;

public interface CrudDao<T, ID> {

  void salva(T model);

  void atualiza(T model);

  void apaga(ID id);

  T busca(ID id);

  List<T> buscaTodos();

}
