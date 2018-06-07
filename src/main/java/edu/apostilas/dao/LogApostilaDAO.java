package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.LogApostila;

@Repository
@Transactional
public class LogApostilaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(LogApostila logApostila) {
		manager.persist(logApostila);
	}
	
	public List<LogApostila> listar(){
		return manager.createQuery("select l from LogApostila l", LogApostila.class).getResultList();
	}
	
}
