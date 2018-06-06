package edu.apostilas.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.apostilas.models.Status;
import edu.apostilas.models.Usuario;

@Repository
@Transactional
public class UsuarioDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Usuario usuario) {
		manager.persist(usuario);
	}
	
	public Usuario findUsuario(String login) {
		try {
			return manager.createQuery("select distinct(u) from Usuario u"
					+ " where u.login = :login", Usuario.class)
					.setParameter("login", login).getSingleResult();
		} catch (Exception e) {
			return null;
		}
		
	}
	
	public Usuario loginUsuario(String login, String senha) {
		try {
			Usuario usuario = this.findUsuario(login);
			if(usuario != null && usuario.getSenha().equals(senha)) 
				return usuario;
		} catch (Exception e) {
			return null;
		}
		
		return null;
	}
	
	public List<Usuario> listar(){
		return manager.createQuery("select u from Usuario u", Usuario.class).getResultList();
	}
	
	public boolean alterar(Usuario usuario) {
		try {
			Usuario usuarioAntigo = (Usuario)manager.find(Usuario.class, usuario.getIdUsuario());
			if(usuarioAntigo != null) {
				usuarioAntigo.setLogin(usuario.getLogin());
				usuarioAntigo.setSenha(usuario.getSenha());
				usuarioAntigo.setPermissao(usuario.getPermissao());
				return true;
			} 
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public boolean ativar(Usuario usuario) {
		try {
			Usuario usuarioAntigo = (Usuario)manager.find(Usuario.class, usuario.getIdUsuario());
			if(usuarioAntigo != null) {
				usuarioAntigo.setStatus(Status.Ativo);
				return true;
			} 
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public Usuario findUsuario(int id) {
		return manager.createQuery("select distinct(u) from Usuario u where u.idUsuario = :id", Usuario.class)
				.setParameter("id", id).getSingleResult();
	}
	
	public boolean remover(Usuario usuario) {
		try {
			Usuario usuarioAntigo = (Usuario)manager.find(Usuario.class, usuario.getIdUsuario());
			if(usuarioAntigo != null) {
				usuarioAntigo.setStatus(Status.Inativo);
				return true;
			}
		} catch (Exception e) {
			return false;
		}
	  return false;
	}
}
