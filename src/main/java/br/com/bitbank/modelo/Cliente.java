package br.com.bitbank.modelo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.transaction.annotation.Transactional;

@Entity @Transactional
public class Cliente {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "titular_id")
	private Titular titular;
	
	@OneToOne( cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "conta_id" )
	private Conta conta;
	
	/**
	 * Geters e Seters gereados automaticamento para aprendizagem, serão removidos ou editados futuramente
	 */

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Titular getTitular() {
		return titular;
	}

	public void setTitular(Titular titular) {
		this.titular = titular;
	}

	public Conta getConta() {
		return conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

}