package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.Movimento;
import edu.apostilas.models.TipoMovimento;

@Repository
@Transactional
public class MovimentoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Movimento movimento) {
		manager.persist(movimento);
	}
	
	public List<Movimento> listar(){
		return manager.createQuery("select m from Movimento m", Movimento.class).getResultList();
	}
	
	public long countMovimentos(String mes) {
		return (long)manager.createQuery("select count(m) from Movimento m where m.dt like :mes")
				.setParameter("mes", "%" + mes + "%")
				.getSingleResult();
	}
	
	public long countEntrada() {
		return (long)manager.createQuery("select count(m.tipo) from Movimento m where m.tipo = :tipo")
				.setParameter("tipo", TipoMovimento.Entrada)
				.getSingleResult();
	}
	
	public long countSaida() {
		return (long)manager.createQuery("select count(m.tipo) from Movimento m where m.tipo = :tipo")
				.setParameter("tipo", TipoMovimento.Saída)
				.getSingleResult();
	}
	
	
}
