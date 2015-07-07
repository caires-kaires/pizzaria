package br.edu.fatec.pizzaria.model;

public class Embalagem {

  private Long id;
  private String embalagem;
  private String unidade;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getEmbalagem() {
    return embalagem;
  }

  public void setEmbalagem(String embalagem) {
    this.embalagem = embalagem;
  }

  public String getUnidade() {
    return unidade;
  }

  public void setUnidade(String unidade) {
    this.unidade = unidade;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("Embalagem [id=");
    builder.append(id);
    builder.append(", embalagem=");
    builder.append(embalagem);
    builder.append(", unidade=");
    builder.append(unidade);
    builder.append("]");
    return builder.toString();
  }

}
