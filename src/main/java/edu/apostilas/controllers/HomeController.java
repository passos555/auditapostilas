package edu.apostilas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.apostilas.dao.AlunoDAO;

@Controller
public class HomeController {
	
	@Autowired
	private AlunoDAO alunoDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("home");
		model.addObject("alunos",alunoDao.countAlunos());
		return model;
	}
	
}
