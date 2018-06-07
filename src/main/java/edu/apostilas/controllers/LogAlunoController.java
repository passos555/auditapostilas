package edu.apostilas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.apostilas.dao.LogAlunoDAO;
import edu.apostilas.models.LogAluno;

@Controller
public class LogAlunoController {
	
	@Autowired
	private LogAlunoDAO logAlunoDao;
	
	@RequestMapping("/logs/alunos")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("logs/alunos");
		List<LogAluno> logs = logAlunoDao.listar();
		model.addObject("logs", logs);
		return model;
	}
	
	
}
