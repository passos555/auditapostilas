package edu.apostilas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.apostilas.dao.MovimentoDAO;
import edu.apostilas.models.Movimento;

@Controller
public class MovimentoController {
	
	@Autowired
	private MovimentoDAO movimentoDao;
	
	@RequestMapping("/movimentos/consulta")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("movimentos/consulta");
		List<Movimento> movimentos = movimentoDao.listar();
		model.addObject("movimentos", movimentos);
		return model;
	}
}
