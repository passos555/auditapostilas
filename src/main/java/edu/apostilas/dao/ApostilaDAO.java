package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.Apostila;

@Repository
@Transactional
public class ApostilaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Apostila apostila) {
		manager.persist(apostila);
	}
	
	public Apostila findApostila(Apostila novaApostila) {
		try {
			Apostila apostila = manager.createQuery("select distinct(a) from Apostila a"
					+ " where a.descricao = :descricao and a.tipo = :tipo", Apostila.class)
					.setParameter("descricao", novaApostila.getDescricao())
					.setParameter("tipo", novaApostila.getTipo())
					.getSingleResult();
			if(apostila != null) {
				return apostila;
			}
		} catch (Exception e) {
			return null;
		}
		return null;
	}
	
	public List<Apostila> listar(){
		return manager.createQuery("select a from Apostila a", Apostila.class).getResultList();
	}
	
	public boolean alterar(Apostila apostila) {
		try {
			Apostila apostilaAntiga = (Apostila)manager.find(Apostila.class, apostila.getIdApostila());
			if(apostilaAntiga != null) {
				apostilaAntiga.setDescricao(apostila.getDescricao());
				apostilaAntiga.setPaginas(apostila.getPaginas());
				apostilaAntiga.setTipo(apostila.getTipo());
				return true;
			} 
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public boolean adicionar(Apostila apostila) {
		try {
			Apostila apostilaAntiga = (Apostila)manager.find(Apostila.class, apostila.getIdApostila());
			if(apostilaAntiga != null) {
				apostilaAntiga.setQuantidade(apostilaAntiga.getQuantidade() + apostila.getQuantidade());
				return true;
			} 
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public void removerApostila(int id) {

		Apostila apostila = (Apostila)manager.find(Apostila.class, id);
		if(apostila != null) 
			apostila.setQuantidade(apostila.getQuantidade() - 1);
		
	}
	
	public Apostila findApostila(int id) {
		return manager.createQuery("select distinct(a) from Apostila a where a.idApostila = :id", Apostila.class)
				.setParameter("id", id).getSingleResult();
	}
}
