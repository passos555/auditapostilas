package edu.apostilas.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class LogAluno {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idLogAluno;
	private String transacao;
	private String dt;
	private String antes;
	private String depois;
	
	@JoinColumn(name="idUsuario", nullable = false)
	@OneToOne
	private Usuario user;
	
	@JoinColumn(name="idAluno", nullable = false)
	@OneToOne
	private Aluno aluno;

	
	public String getAntes() {
		return antes;
	}

	public void setAntes(String antes) {
		this.antes = antes;
	}

	public String getDepois() {
		return depois;
	}

	public void setDepois(String depois) {
		this.depois = depois;
	}

	public int getIdLogAluno() {
		return idLogAluno;
	}

	public void setIdLogAluno(int idLogAluno) {
		this.idLogAluno = idLogAluno;
	}

	public String getTransacao() {
		return transacao;
	}

	public void setTransacao(String transacao) {
		this.transacao = transacao;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	
	
	
}
