package edu.apostilas.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Aluno {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idAluno;
	private String nome;
	private String cpf;
	private String email;
	private String celular;
	private String dtNasc;
	private String dtCadastro;
	
	@ElementCollection
	private List<Apostila> apostilas = new ArrayList<>();
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	@Enumerated(EnumType.STRING)
	private Sexo sexo;
	
	
	
	public String getDtCadastro() {
		return dtCadastro;
	}

	public void setDtCadastro(String dtCadastro) {
		this.dtCadastro = dtCadastro;
	}

	public List<Apostila> getApostilas() {
		return apostilas;
	}

	public void setApostilas(List<Apostila> apostilas) {
		this.apostilas = apostilas;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Sexo getSexo() {
		return sexo;
	}

	public void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}

	public int getIdAluno() {
		return idAluno;
	}

	public void setIdAluno(int idAluno) {
		this.idAluno = idAluno;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getDtNasc() {
		return dtNasc;
	}

	public void setDtNasc(String dtNasc) {
		this.dtNasc = dtNasc;
	}

	@Override
	public String toString() {
		String retorno = this.nome + " ; " + this.cpf + " ; " + this.getDtNasc() + " ; " + this.email + " ; "
				+ this.celular + " ; " + this.sexo + " ; " + this.status;
		return retorno;
	}
	
	
	
}
