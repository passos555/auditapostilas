package edu.apostilas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.apostilas.dao.LogUsuarioDAO;
import edu.apostilas.models.LogUsuario;

@Controller
public class LogUsuarioController {
	
	@Autowired
	private LogUsuarioDAO logUsuarioDao;
	
	@RequestMapping("/logs/usuarios")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("logs/usuarios");
		List<LogUsuario> logs = logUsuarioDao.listar();
		model.addObject("logs", logs);
		return model;
	}
	
}
