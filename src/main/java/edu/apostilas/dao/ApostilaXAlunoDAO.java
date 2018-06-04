package edu.apostilas.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.ApostilaXAluno;

@Repository
@Transactional
public class ApostilaXAlunoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public boolean gravar(ApostilaXAluno apostilaAluno) {
		try {
			if(!existe(apostilaAluno)) {
				manager.persist(apostilaAluno);
				return true;
			} else 
				return false;
				
		} catch (Exception e) {
		    return false;
		}
	}
	
	public ApostilaXAluno find(int idAluno, int idApostila) {
		try {
			return manager.createQuery("select aa from ApostilaXAluno aa"
					+ " where aa.aluno.idAluno = :idAluno"
					+ " and aa.apostila.idApostila = :idApostila", ApostilaXAluno.class)
			.setParameter("idAluno", idAluno)
			.setParameter("idApostila", idApostila)
			.getSingleResult();
		} catch (Exception e) {
			return null;
		}
		
	}
	
	public boolean existe(ApostilaXAluno apostilaAluno) {
		try {
			ApostilaXAluno existente = this.find(apostilaAluno.getAluno().getIdAluno(), apostilaAluno.getApostila().getIdApostila());
			
			if(existente == null)
				return false;
			else 
				return true;
				
		} catch (Exception e) {
			return true;
		}
	}
}
