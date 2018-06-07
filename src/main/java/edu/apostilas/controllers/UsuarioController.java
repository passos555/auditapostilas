package edu.apostilas.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.apostilas.dao.LogUsuarioDAO;
import edu.apostilas.dao.UsuarioDAO;
import edu.apostilas.models.LogUsuario;
import edu.apostilas.models.Permissao;
import edu.apostilas.models.Status;
import edu.apostilas.models.Usuario;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@Autowired
	private LogUsuarioDAO logUsuarioDao;
	
	@RequestMapping("/usuarios/novo")
	public ModelAndView novoForm() {
		ModelAndView model = new ModelAndView("usuarios/novo");
		model.addObject("permissoes", Permissao.values());
		return model;
	}
	
	@RequestMapping(value = "/usuarios/novo", method = RequestMethod.POST)
	public ModelAndView gravar(Usuario usuario, RedirectAttributes redirectAttributes, HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/novo");
		
		Usuario usuarioExistente = usuarioDao.findUsuario(usuario.getLogin());
		if(usuarioExistente != null) {
			redirectAttributes.addFlashAttribute("erro", "Este login já está sendo usado!");
			return model;
		}
		usuario.setStatus(Status.Ativo);
		usuarioDao.gravar(usuario);
		gravaLog(usuario, session, "Inserção", "", usuario.toString());
		redirectAttributes.addFlashAttribute("sucesso", "Usuário cadastrado com sucesso!");
		return model;
	}
	
	@RequestMapping("/usuarios/consulta")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("usuarios/consulta");
		List<Usuario> usuarios = usuarioDao.listar();
		model.addObject("usuarios", usuarios);
		model.addObject("permissoes", Permissao.values());
		return model;
	}
	
	/*
	@RequestMapping("/usuarios/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("/usuarios/detalhe");
		Usuario usuario = usuarioDao.findUsuario(id);
		model.addObject("usuario", usuario);
		model.addObject("permissoes", Permissao.values());
		return model;
	}*/
	
	@RequestMapping(value = "/usuarios/detalhe", method = RequestMethod.POST)
	public ModelAndView alterar(Usuario usuario, RedirectAttributes redirectAttributes, HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		String antes = usuarioDao.findUsuario(usuario.getIdUsuario()).toString();
		Usuario usuarioExistente = usuarioDao.findUsuario(usuario.getIdUsuario());
		boolean result = usuarioDao.alterar(usuario);
		if(result) {
			usuario.setStatus(usuarioExistente.getStatus());
			gravaLog(usuario, session, "Alteração", antes, usuario.toString());
			redirectAttributes.addFlashAttribute("sucesso", "Usuário alterado com sucesso!");
		}
		else
			redirectAttributes.addFlashAttribute("erro", "Usuário não foi alterado!");
			
		return model;
	}
	
	@RequestMapping(value = "/usuarios/remover", method = RequestMethod.POST)
	public ModelAndView remover(@RequestParam String idUsuario, RedirectAttributes redirectAttributes,  HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		Usuario usuarioLogado = (Usuario)session.getAttribute("usuarioLogado");
		System.out.println(idUsuario);
		Usuario usuario = usuarioDao.findUsuario(Integer.parseInt(idUsuario.replace(",", "")));
		String antes = usuarioDao.findUsuario(usuario.getIdUsuario()).toString();
				
		if(usuarioLogado.getIdUsuario() == usuario.getIdUsuario()) {
			redirectAttributes.addFlashAttribute("erro", "Você não pode se remover!");
			return model;
		} else {
			boolean result = usuarioDao.remover(usuario);
			if(result) {
				usuario.setStatus(Status.Inativo);
				gravaLog(usuario, session, "Desativação", antes, usuario.toString());
				redirectAttributes.addFlashAttribute("sucesso", "Usuário removido com sucesso!");
			}
			else
				redirectAttributes.addFlashAttribute("erro", "Usuário não foi removido!");
				
			return model;
		}
	}
	
	@RequestMapping(value = "/usuarios/ativar{id}")
	public ModelAndView ativar(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes, HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		Usuario usuario = usuarioDao.findUsuario(id);
		String antes = usuarioDao.findUsuario(usuario.getIdUsuario()).toString();
		boolean result = usuarioDao.ativar(usuario);
		if(result) {
			usuario.setStatus(Status.Ativo);
			gravaLog(usuario, session, "Ativação", antes, usuario.toString());
			redirectAttributes.addFlashAttribute("sucesso", "Usuário ativado com sucesso!");
		}
		else
			redirectAttributes.addFlashAttribute("erro", "Usuário não foi ativado!");
			
		return model;
	}
	
	/*
	@RequestMapping("/usuarios/remover/{id}")
	public ModelAndView remover(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		Usuario usuario = usuarioDao.findUsuario(id);
		usuarioDao.remover(usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Usuário removido com sucesso!");
		return model;
	}*/
	
	public void gravaLog(Usuario usuario, HttpSession session, String transacao, String antes, String depois) {
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		LogUsuario logUsuario = new LogUsuario();
		logUsuario.setUserModificado(usuario);
		logUsuario.setTransacao(transacao);
		logUsuario.setDt(sdf.format(cal.getTime()));
		logUsuario.setUserLogado((Usuario)session.getAttribute("usuarioLogado"));
		logUsuario.setAntes(antes);
		logUsuario.setDepois(depois);
		logUsuarioDao.gravar(logUsuario);
	}
}
