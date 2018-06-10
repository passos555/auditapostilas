package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.Aluno;
import edu.apostilas.models.Apostila;
import edu.apostilas.models.Status;

@Repository
@Transactional
public class AlunoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Aluno aluno) {
		manager.persist(aluno);
	}
	
	public Aluno findAluno(String cpf) {
		try {
			Aluno aluno = manager.createQuery("select distinct(a) from Aluno a"
					+ " where a.cpf = :cpf", Aluno.class)
					.setParameter("cpf", cpf)
					.getSingleResult();
			if(aluno != null) {
				return aluno;
			}
		} catch (Exception e) {
			return null;
		}
		return null;
	}
	
	public List<Aluno> listar(){
		return manager.createQuery("select a from Aluno a", Aluno.class).getResultList();
	}
	
	public List<Apostila> listarApostilas(int id){
		return manager.createQuery("select ap from ApostilaXAluno aa"
				+ " inner join aa.apostila ap"
				+ " inner join aa.aluno a"
				+ " where aa.aluno.idAluno = :id", Apostila.class)
				.setParameter("id", id).getResultList();
	}
	
	public boolean alterar(Aluno aluno) {
		try {
			Aluno alunoAntigo = (Aluno)manager.find(Aluno.class, aluno.getIdAluno());
			if(alunoAntigo != null) {
				alunoAntigo.setNome(aluno.getNome());
				alunoAntigo.setCpf(aluno.getCpf());
				alunoAntigo.setEmail(aluno.getEmail());
				alunoAntigo.setDtNasc(aluno.getDtNasc());
				alunoAntigo.setCelular(aluno.getCelular());
				alunoAntigo.setSexo(aluno.getSexo());
				return true;
			} 
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public Aluno findAluno(int id) {
		return manager.createQuery("select distinct(a) from Aluno a where a.idAluno = :id", Aluno.class)
				.setParameter("id", id).getSingleResult();
	}
	
	public long countNovosAlunos(String mes) {
		return (long)manager.createQuery("select count(a) from Aluno a where a.dtCadastro like :mes")
				.setParameter("mes",  "%" + mes + "%")
				.getSingleResult();
	}
	
	public long countAlunos() {
		return (long)manager.createQuery("select count(a.idAluno) from Aluno a").getSingleResult();
	}
	
	public long countAlunosInativos() {
		return (long)manager.createQuery("select count(a) from Aluno a where a.status = :status")
				.setParameter("status", Status.Inativo)
				.getSingleResult();
	}
	
	public long countAlunosAtivos() {
		return (long)manager.createQuery("select count(a) from Aluno a where a.status = :status")
				.setParameter("status", Status.Ativo)
				.getSingleResult();
	}
	
	public boolean ativar(Aluno aluno) {
		try {
			Aluno alunoAntigo = (Aluno)manager.find(Aluno.class, aluno.getIdAluno());
			if(alunoAntigo != null) {
				alunoAntigo.setStatus(Status.Ativo);
				return true;
			} 
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public boolean remover(Aluno aluno) {
		try {
			Aluno alunoAntigo = (Aluno)manager.find(Aluno.class, aluno.getIdAluno());
			if(aluno != null) {
				alunoAntigo.setStatus(Status.Inativo);
				return true;
			}		
		} catch (Exception e) {
			return false;
		}
		return false;
	}
}
