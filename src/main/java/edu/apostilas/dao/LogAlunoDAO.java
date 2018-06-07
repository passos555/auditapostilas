package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.LogAluno;

@Repository
@Transactional
public class LogAlunoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(LogAluno logaluno) {
		manager.persist(logaluno);
	}
	
	public List<LogAluno> listar(){
		return manager.createQuery("select l from LogAluno l", LogAluno.class).getResultList();
	}
}
