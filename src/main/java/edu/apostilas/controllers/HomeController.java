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
		double porcentagem = ((double)alunoDao.countAlunos() / 5) * 100;
		model.addObject("movimentos", movimentoDao.countMovimentos(mes));
		model.addObject("porcentagem", porcentagem);
		model.addObject("novosAlunos", alunoDao.countNovosAlunos(mes));
		model.addObject("alunosAtivos", alunoDao.countAlunosAtivos());
		model.addObject("alunosInativos", alunoDao.countAlunosInativos());
		model.addObject("saidas", movimentoDao.countSaida());
		model.addObject("entradas", movimentoDao.countEntrada());
		model.addObject("alunos",alunoDao.countAlunos());
		model.addObject("apostilas", apostilaDao.countQuantidade());
		return model;
	}
	
}
