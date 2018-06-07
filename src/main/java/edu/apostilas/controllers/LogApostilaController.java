package edu.apostilas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.apostilas.dao.LogApostilaDAO;
import edu.apostilas.models.LogApostila;

@Controller
public class LogApostilaController {
	
	@Autowired
	private LogApostilaDAO logApostilaDao;
	
	@RequestMapping("/logs/apostilas")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("logs/apostilas");
		List<LogApostila> logs = logApostilaDao.listar();
		model.addObject("logs", logs);
		return model;
	}
	
}
