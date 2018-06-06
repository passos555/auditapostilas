package edu.apostilas.models;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Movimento {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idMovimento;
	private String dt;
	private int quantidade;
	
	@JoinColumn(name="idUsuario", nullable = false)
	@OneToOne
	private Usuario user;
	
	@Enumerated(EnumType.STRING)
	private TipoMovimento tipo;
	
	@JoinColumn(name="idAluno", nullable = true)
	@OneToOne
	private Aluno aluno;
	
	@JoinColumn(name="idApostila", nullable = true)
	@OneToOne
	private Apostila apostila;

	
	
	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public int getIdMovimento() {
		return idMovimento;
	}

	public void setIdMovimento(int idMovimento) {
		this.idMovimento = idMovimento;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public TipoMovimento getTipo() {
		return tipo;
	}

	public void setTipo(TipoMovimento tipo) {
		this.tipo = tipo;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public Apostila getApostila() {
		return apostila;
	}

	public void setApostila(Apostila apostila) {
		this.apostila = apostila;
	}
	
	
	
	
	
}
