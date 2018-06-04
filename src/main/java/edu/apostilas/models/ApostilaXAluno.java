package edu.apostilas.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


@Entity
public class ApostilaXAluno {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idApostilaXAluno;
	
	@JoinColumn(name="idAluno", nullable = false)
	@OneToOne
	private Aluno aluno;
	
	@JoinColumn(name="idApostila", nullable = false)
	@OneToOne
	private Apostila apostila;
	
	public int getIdApostilaXAluno() {
		return idApostilaXAluno;
	}
	public void setIdApostilaXAluno(int idApostilaXAluno) {
		this.idApostilaXAluno = idApostilaXAluno;
	}
	public Apostila getApostila() {
		return apostila;
	}
	public void setApostila(Apostila apostila) {
		this.apostila = apostila;
	}
	public Aluno getAluno() {
		return aluno;
	}
	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
}
