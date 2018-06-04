package edu.apostilas.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.apostilas.dao.UsuarioDAO;
import edu.apostilas.models.Usuario;

@Controller
public class LoginController {
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String verifyLogin(@RequestParam String login,
			@RequestParam String senha, HttpSession session, Model model) {
		
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();
		
		Usuario usuario = usuarioDao.loginUsuario(login, senha);
		if(usuario == null) {
			model.addAttribute("loginError", "Login ou senha inválidos!");
			return "login";
		}
		session.setAttribute("usuarioLogado", usuario);
		session.setAttribute("date", sdf.format(cal.getTime()));
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("usuarioLogado");
		session.removeAttribute("date");
		session.invalidate();
		return "redirect:/login";
	}
	
	
	
}
