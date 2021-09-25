package com.br.marcusrolim.clubesquad.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "tb_passeio")
public class Passeio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "nome", nullable = false)
	@Range(min = 1, max = 50, message = "Inválido (Mínimo 1 caracteres e máximo 50 caracteres).")
	private String nome;

	@Column(name = "preco", nullable = false)
	@Digits(integer = 5, fraction = 2, message = "Inválido. (Informe preco de R$ 0,00 à R$ 99.999,99")
	private Double preco;

	@Column(name = "duracao", nullable = false)
	private Integer duracao;

	public Passeio() {}
	
	public Passeio(Integer id,
			@Range(min = 1, max = 50, message = "Inválido (Mínimo 1 caracteres e máximo 50 caracteres).") String nome,
			@Digits(integer = 5, fraction = 2, message = "Inválido. (Informe preco de R$ 0,00 à R$ 99.999,99") Double preco,
			Integer duracao) {
		super();
		this.id = id;
		this.nome = nome;
		this.preco = preco;
		this.duracao = duracao;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Integer getDuracao() {
		return duracao;
	}

	public void setDuracao(Integer duracao) {
		this.duracao = duracao;
	}
}

