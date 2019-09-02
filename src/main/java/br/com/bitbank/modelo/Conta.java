package br.com.bitbank.modelo;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Positive;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
@Table
@Entity @Transactional
@Component
public  class Conta {
	
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
	private Double saldo;
	
	@Positive
	private Integer agencia;
	@Positive
	private Integer numero;

	public Conta() {
		this.saldo = 0.0;
	}
	
	public Double getSaldo() {
		return this.saldo;
	}

	public Integer getNumero() {
		return this.numero;
	}
	@Bean
	public void deposita(Double valor) {
		this.saldo += valor;
		
	}

	public boolean saca(Double valor) {
		if (this.saldo >= valor) {
			this.saldo -= valor;
			return true;
		} else {
			return false;
		}
	}

	public boolean transfere(Double valor, Conta destino) {
		if (this.saca(valor)) {
			destino.deposita(valor);
			return true;
		} else {
			return false;
		}
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Integer getAgencia() {
		return this.agencia;
	}

	public void setAgencia(Integer agencia) {
		this.agencia = agencia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
