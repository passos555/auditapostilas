package edu.apostilas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.apostilas.dao.UsuarioDAO;
import edu.apostilas.models.Permissao;
import edu.apostilas.models.Usuario;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@RequestMapping("/usuarios/novo")
	public ModelAndView novoForm() {
		ModelAndView model = new ModelAndView("usuarios/novo");
		model.addObject("permissoes", Permissao.values());
		return model;
	}
	
	@RequestMapping(value = "/usuarios/novo", method = RequestMethod.POST)
	public ModelAndView gravar(Usuario usuario, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/novo");
		
		Usuario usuarioExistente = usuarioDao.findUsuario(usuario.getLogin());
		if(usuarioExistente != null) {
			redirectAttributes.addFlashAttribute("erro", "Este login já está sendo usado!");
			return model;
		}
		usuarioDao.gravar(usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Usuário cadastrado com sucesso!");
		return model;
	}
	
	@RequestMapping("/usuarios/consulta")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("usuarios/consulta");
		List<Usuario> usuarios = usuarioDao.listar();
		model.addObject("usuarios", usuarios);
		return model;
	}
	
	@RequestMapping("/usuarios/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("/usuarios/detalhe");
		Usuario usuario = usuarioDao.findUsuario(id);
		model.addObject("usuario", usuario);
		model.addObject("permissoes", Permissao.values());
		return model;
	}
	
	@RequestMapping(value = "/usuarios/detalhe", method = RequestMethod.POST)
	public ModelAndView alterar(Usuario usuario, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		boolean result = usuarioDao.alterar(usuario);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Usuário alterado com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Usuário não foi alterado!");
			
		return model;
	}
	
	@RequestMapping("/usuarios/remover/{id}")
	public ModelAndView remover(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		Usuario usuario = usuarioDao.findUsuario(id);
		usuarioDao.remover(usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Usuário removido com sucesso!");
		return model;
	}
}
