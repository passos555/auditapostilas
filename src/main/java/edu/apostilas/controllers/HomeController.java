package edu.apostilas.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.apostilas.dao.AlunoDAO;
import edu.apostilas.dao.ApostilaDAO;
import edu.apostilas.dao.MovimentoDAO;

@Controller
public class HomeController {
	
	@Autowired
	private AlunoDAO alunoDao;
	
	@Autowired
	private ApostilaDAO apostilaDao;
	
	@Autowired
	private MovimentoDAO movimentoDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("home");
		DateFormat sdf = new SimpleDateFormat("/MM/");
		Calendar cal = Calendar.getInstance();
		String mes = sdf.format(cal.getTime());
		model.addObject("movimentos", movimentoDao.countMovimentos(mes));
		model.addObject("alunos",alunoDao.countAlunos());
		model.addObject("apostilas", apostilaDao.countQuantidade());
		return model;
	}
	
}
