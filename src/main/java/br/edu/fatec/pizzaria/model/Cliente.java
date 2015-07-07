package br.edu.fatec.pizzaria.model;

public class Cliente {

  private Long id;
  private String nome;
  private String cpf;
  private String endereco;
  private String numero;
  private String telefone;
  private String bairro;
  private String cidade;
  private String pais;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getCpf() {
    return cpf;
  }

  public void setCpf(String cpf) {
    this.cpf = cpf;
  }

  public String getEndereco() {
    return endereco;
  }

  public void setEndereco(String endereco) {
    this.endereco = endereco;
  }

  public String getNumero() {
    return numero;
  }

  public void setNumero(String numero) {
    this.numero = numero;
  }

  public String getTelefone() {
    return telefone;
  }

  public void setTelefone(String telefone) {
    this.telefone = telefone;
  }

  public String getBairro() {
    return bairro;
  }

  public void setBairro(String bairro) {
    this.bairro = bairro;
  }

  public String getCidade() {
    return cidade;
  }

  public void setCidade(String cidade) {
    this.cidade = cidade;
  }

  public String getPais() {
    return pais;
  }

  public void setPais(String pais) {
    this.pais = pais;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("Cliente [id = ");
    builder.append(id);
    builder.append(" Nome: ");
    builder.append(nome);
    builder.append(" CPF: ");
    builder.append(cpf);
    builder.append(" Endereço: ");
    builder.append(endereco);
    builder.append(" Numero: ");
    builder.append(numero);
    builder.append(" Telefone: ");
    builder.append(telefone);
    builder.append(" Bairro: ");
    builder.append(bairro);
    builder.append(" Cidade: ");
    builder.append(cidade);
    builder.append(" País: ");
    builder.append(pais);
    builder.append("]");

    return builder.toString();
  }

}
