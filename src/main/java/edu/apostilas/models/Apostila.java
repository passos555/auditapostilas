package edu.apostilas.models;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Apostila {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idApostila;
	private String descricao;
	private int paginas;
	private int quantidade;
	
	@Enumerated(EnumType.STRING)
	private TipoApostila tipo;
	
	
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public TipoApostila getTipo() {
		return tipo;
	}
	public void setTipo(TipoApostila tipo) {
		this.tipo = tipo;
	}
	public int getIdApostila() {
		return idApostila;
	}
	public void setIdApostila(int idApostila) {
		this.idApostila = idApostila;
	}
	public int getPaginas() {
		return paginas;
	}
	public void setPaginas(int paginas) {
		this.paginas = paginas;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	@Override
	public String toString() {
		return this.descricao + " - " + this.tipo;
	}
	
	public String toString2() {
		return this.descricao + ";" + this.paginas + ";" + this.tipo;
	}
	
}
