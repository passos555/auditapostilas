package edu.apostilas.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class LogApostila {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idLogApostila;
	private String dt;
	private String transacao;
	private String antes;
	private String depois;
	
	@JoinColumn(name="idUsuario", nullable = false)
	@OneToOne
	private Usuario user;
	
	@JoinColumn(name="idApostila", nullable = false)
	@OneToOne
	private Apostila apostila;

	public int getIdLogApostila() {
		return idLogApostila;
	}

	public void setIdLogApostila(int idLogApostila) {
		this.idLogApostila = idLogApostila;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getTransacao() {
		return transacao;
	}

	public void setTransacao(String transacao) {
		this.transacao = transacao;
	}

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

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public Apostila getApostila() {
		return apostila;
	}

	public void setApostila(Apostila apostila) {
		this.apostila = apostila;
	}
	
	
	
}
