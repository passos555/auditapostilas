package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.LogUsuario;

@Repository
@Transactional
public class LogUsuarioDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(LogUsuario logUsuario) {
		manager.persist(logUsuario);
	}
	
	public List<LogUsuario> listar(){
		return manager.createQuery("select l from LogUsuario l", LogUsuario.class).getResultList();
	}
	
}
