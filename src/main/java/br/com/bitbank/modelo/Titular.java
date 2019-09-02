package br.com.bitbank.modelo;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;
@Table
@Entity
public class Titular {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String nome;
	
	@NotEmpty(message = "o campo nao pode ser vazio")
	private String rg;
	
	@NotEmpty
	private String cpf;
	
	@DateTimeFormat
	private Calendar dataNascimento;

	private String email;
	
	private TipoGenero genero;
	
	private String fotoPerfilPath;
	
	/**
	 * Geters e Seters gereados automaticamento para aprendizagem, serão removidos ou editados futuramente
	 */
	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}


	public Calendar getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Calendar dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public TipoGenero getGenero() {
		return genero;
	}

	public void setGenero(TipoGenero genero) {
		this.genero = genero;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getFotoPerfilPath() {
		return fotoPerfilPath;
	}

	public void setFotoPerfilPath(String fotoPerfilPath) {
		this.fotoPerfilPath = fotoPerfilPath;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

}
