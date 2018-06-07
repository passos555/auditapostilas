package edu.apostilas.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class LogUsuario {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idLogUsuario;
	private String dt;
	private String transacao;
	private String antes;
	private String depois;
	
	@JoinColumn(name="idUsuarioLogado", nullable = false)
	@OneToOne
	private Usuario userLogado;
	
	@JoinColumn(name="idUsuarioModificado", nullable = false)
	@OneToOne
	private Usuario userModificado;

	public int getIdLogUsuario() {
		return idLogUsuario;
	}

	public void setIdLogUsuario(int idLogUsuario) {
		this.idLogUsuario = idLogUsuario;
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

	public Usuario getUserLogado() {
		return userLogado;
	}

	public void setUserLogado(Usuario userLogado) {
		this.userLogado = userLogado;
	}

	public Usuario getUserModificado() {
		return userModificado;
	}

	public void setUserModificado(Usuario userModificado) {
		this.userModificado = userModificado;
	}
	
	
	
	
}
